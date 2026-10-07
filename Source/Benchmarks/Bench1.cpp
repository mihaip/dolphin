// Port of DingusPPC benchmark/bench1.cpp, copyright 2018-26 DingusPPC Development Team.
// SPDX-License-Identifier: GPL-3.0-or-later

#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>

#include "Common/CommonPaths.h"
#include "Common/Config/Config.h"
#include "Common/FileUtil.h"
#include "Common/Logging/LogManager.h"
#include "Core/Config/MainSettings.h"
#include "Core/ConfigLoaders/BaseConfigLoader.h"
#include "Core/ConfigManager.h"
#include "Core/Core.h"
#include "Core/CoreTiming.h"
#include "Core/HLE/HLE.h"
#include "Core/HW/CPU.h"
#include "Core/HW/Memmap.h"
#include "Core/MemTools.h"
#include "Core/PowerPC/JitCommon/JitBase.h"
#include "Core/PowerPC/JitInterface.h"
#include "Core/PowerPC/PowerPC.h"
#include "Core/System.h"

constexpr u32 cs_code[] = {
    0x3863FFFC, 0x7C861671, 0x41820090, 0x70600002, 0x41E2001C, 0xA0030004, 0x3884FFFE, 0x38630002,
    0x5486F0BF, 0x7CA50114, 0x41820070, 0x70C60003, 0x41820014, 0x7CC903A6, 0x84030004, 0x7CA50114,
    0x4200FFF8, 0x5486E13F, 0x41820050, 0x80030004, 0x7CC903A6, 0x80C30008, 0x7CA50114, 0x80E3000C,
    0x7CA53114, 0x85030010, 0x7CA53914, 0x42400028, 0x80030004, 0x7CA54114, 0x80C30008, 0x7CA50114,
    0x80E3000C, 0x7CA53114, 0x85030010, 0x7CA53914, 0x4200FFE0, 0x7CA54114, 0x70800002, 0x41E20010,
    0xA0030004, 0x38630002, 0x7CA50114, 0x70800001, 0x41E20010, 0x88030004, 0x5400402E, 0x7CA50114,
    0x7C650194, 0x4E800020};

constexpr u32 test_size = 0x8000;  // 0x7FFFFFFC is the max
constexpr u32 test_samples = 200;
constexpr u32 test_iterations = 5;

int main(int argc, char** argv)
{
  PowerPC::CPUCore core = PowerPC::CPUCore::CachedInterpreter;
  if (argc == 2 && std::strcmp(argv[1], "interpreter") == 0)
    core = PowerPC::CPUCore::Interpreter;
  else if (argc == 2 && std::strcmp(argv[1], "jit") == 0)
  {
    core = PowerPC::DefaultCPUCore();
    if (core != PowerPC::CPUCore::JIT64 && core != PowerPC::CPUCore::JITARM64)
    {
      std::fprintf(stderr, "Native-code JIT is unavailable on this host.\n");
      return 1;
    }
  }
  else if (argc != 1 && !(argc == 2 && std::strcmp(argv[1], "cached") == 0))
  {
    std::fprintf(stderr, "Usage: %s [cached|interpreter|jit]\n", argv[0]);
    return 1;
  }

  // Isolate configuration from an installed Dolphin's user directory.
  const std::string user_dir = File::CreateTempDir();
  File::SetUserPath(D_USER_IDX, user_dir + "/");
  Config::Init();
  Config::AddLayer(ConfigLoaders::GenerateBaseConfigLoader());
  Common::Log::LogManager::Init();
  SConfig::Init();
  Config::SetCurrent(Config::MAIN_CPU_THREAD, false);
  Config::SetCurrent(Config::MAIN_ENABLE_DEBUGGING, false);
  Config::SetCurrent(Config::MAIN_EMULATION_SPEED, 0.0f);
  Config::SetCurrent(Config::MAIN_MMU, false);
  Config::SetCurrent(Config::MAIN_ACCURATE_CPU_CACHE, false);

  auto& system = Core::System::GetInstance();
  system.Initialize();
  Core::DeclareAsCPUThread();
  auto& memory = system.GetMemory();
  auto& cpu = system.GetCPU();
  auto& power_pc = system.GetPowerPC();
  auto& state = system.GetPPCState();
  auto& timing = system.GetCoreTiming();
  const bool native_jit = core == PowerPC::CPUCore::JIT64 || core == PowerPC::CPUCore::JITARM64;
  const bool exception_handler = native_jit && EMM::IsExceptionHandlerSupported();
  if (exception_handler)
    EMM::InstallExceptionHandler();
  memory.Init();
  timing.Init();
  cpu.Init(core);
  state.msr.Hex = 0;  // Physical addressing, like the original benchmark.
  power_pc.MSRUpdated();

  for (u32 i = 0; i < sizeof(cs_code) / sizeof(cs_code[0]); ++i)
    memory.Write_U32(cs_code[i], i * 4);

  // Stop at the original sentinel address using Dolphin's existing stop hook.
  // Only the sentinel is replaced; all checksum instructions are unchanged.
  HLE::Patch(system, 0xc4, "HBReload");

  std::srand(0xCAFEBABE);
  std::printf("Core: %s\nTest size: 0x%X\nFirst few bytes:\n", power_pc.GetCPUName(), test_size);
  for (u32 i = 0; i < test_size; ++i)
  {
    const u8 value = std::rand() % 256;
    memory.Write_U8(value, 0x1000 + i);
    if (i < 64)
      std::printf("%02x%s", value, i % 32 == 31 ? "\n" : "");
  }

  // Independent checksum: add big-endian words with end-around carry.
  u64 sum = 0;
  for (u32 i = 0; i < test_size; i += 4)
  {
    sum += memory.Read_U32(0x1000 + i);
    sum = (sum & 0xffffffff) + (sum >> 32);
  }
  const u32 expected_checksum = static_cast<u32>(sum);

  const auto prepare = [&] {
    state.pc = 0;
    state.npc = 4;
    state.gpr[3] = 0x1000;
    state.gpr[4] = test_size;
    state.gpr[5] = 0;
    cpu.SetStepping(false);
  };
  const auto verify = [&] {
    if (state.gpr[3] != expected_checksum || state.Exceptions != 0)
    {
      std::fprintf(stderr, "Checksum: %08X, expected: %08X, exceptions: %08X\n", state.gpr[3],
                   expected_checksum, state.Exceptions);
      std::exit(1);
    }
  };
  prepare();
  power_pc.RunLoop();  // Warm the decoded/native block cache before measuring.
  verify();
  std::printf("Checksum: 0x%08X\n", state.gpr[3]);
  if (native_jit)
  {
    const auto& options = static_cast<const JitBase*>(system.GetJitInterface().GetCore())->jo;
    std::printf("JIT settings: fastmem=%d, block-linking=%d, memcheck=%d\n", options.fastmem,
                options.enableBlocklink, options.memcheck);
  }

  u64 overhead = std::numeric_limits<u64>::max();
  for (u32 j = 0; j < test_samples; ++j)
  {
    const auto start = std::chrono::steady_clock::now();
    const auto end = std::chrono::steady_clock::now();
    const u64 elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    if (elapsed < overhead)
      overhead = elapsed;
  }
  std::printf("Overhead Time: %llu ns\n", static_cast<unsigned long long>(overhead));

  for (u32 i = 0; i < test_iterations; ++i)
  {
    u64 best_sample = std::numeric_limits<u64>::max();
    for (u32 j = 0; j < test_samples; ++j)
    {
      prepare();
      const auto start = std::chrono::steady_clock::now();
      power_pc.RunLoop();
      const auto end = std::chrono::steady_clock::now();
      verify();
      const u64 elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
      if (elapsed < best_sample)
        best_sample = elapsed;
    }
    best_sample -= overhead;
    std::printf("(%u) %llu ns, %.4f MiB/s\n", i + 1, static_cast<unsigned long long>(best_sample),
                1e9 * test_size / (best_sample * 1024.0 * 1024.0));
  }

  HLE::Clear();
  cpu.Shutdown();
  if (exception_handler)
    EMM::UninstallExceptionHandler();
  timing.Shutdown();
  memory.Shutdown();
  Core::UndeclareAsCPUThread();
  SConfig::Shutdown();
  Common::Log::LogManager::Shutdown();
  Config::Shutdown();
  File::DeleteDirRecursively(user_dir);
  return 0;
}
