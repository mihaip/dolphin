# DingusPPC checksum benchmark for Dolphin

A standalone port of [DingusPPC's `benchmark/bench1.cpp`](https://github.com/mihaip/dingusppc/blob/1baa8eb10ccf516b31403062afa9b63028a13f71/benchmark/bench1.cpp).
It runs the same 49 PowerPC checksum instructions on the same 32 KiB buffer,
in physical-addressing mode, with `srand(0xCAFEBABE)`, five batches of 200
samples, a warmup execution, and minimum back-to-back clock overhead subtraction.
Each batch reports its fastest sample, as in DingusPPC. `rand()` is platform
specific; the comparison runner checks the input prefix and checksum match.

The default core is Dolphin's **Cached Interpreter**, explicitly selected with
`PowerPC::CPUCore::CachedInterpreter`. `interpreter` selects Dolphin's plain
interpreter; `jit` selects the host's native-code JIT (ARM64 on Apple Silicon,
x86-64 on Intel/AMD), with Dolphin's default optimizations and fastmem settings.
Unsupported hosts reject `jit`. This benchmark does not boot a game or
initialize graphics/audio devices. It calls the normal
`PowerPCManager::RunLoop`; no CPU implementation files are changed.

The only guest-code adaptation replaces DingusPPC's invalid-instruction sentinel
at `0xc4` with the routine's original `blr`, and patches that address with
Dolphin's existing `HBReload` HLE hook. This stops the CPU after the checksum.
The no-frontend host callbacks are copied from `Source/UnitTests/StubHost.cpp`,
with `Host_Message` also ending the plain interpreter's current timing slice.
Start/stop conventions differ between emulators; their costs remain in the
measured time. Preparation and checksum validation are outside the timed region.
The decoded/native code cache remains warm between samples; compilation is
excluded by the warmup. Native JIT runs install Dolphin's normal exception
handler for fastmem and return-stack faults. Configuration uses a temporary
user directory, so an installed Dolphin's settings do not affect the run.

## Build and run Dolphin

From the repository root, on macOS with Xcode selected:

```sh
git submodule update --init --recursive
cmake -S . -B build-bench -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER="$(xcrun -f clang)" \
  -DCMAKE_CXX_COMPILER="$(xcrun -f clang++)" \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=15.7 \
  -DENABLE_PPC_BENCHMARK=ON \
  -DENABLE_QT=OFF -DENABLE_TESTS=OFF -DENABLE_NOGUI=OFF \
  -DENABLE_CLI_TOOL=OFF -DENABLE_VULKAN=OFF -DENABLE_LLVM=OFF \
  -DUSE_MGBA=OFF -DUSE_DISCORD_PRESENCE=OFF \
  -DUSE_RETRO_ACHIEVEMENTS=OFF -DENABLE_AUTOUPDATE=OFF \
  -DENABLE_ANALYTICS=OFF -DENCODE_FRAMEDUMPS=OFF -DENABLE_LTO=OFF
cmake --build build-bench --target ppc-bench --parallel 8
build-bench/Binaries/ppc-bench cached
build-bench/Binaries/ppc-bench interpreter
build-bench/Binaries/ppc-bench jit
```

Normal Dolphin build dependencies still apply (for example CMake, Ninja and
macOS development tools). Frontends and optional integrations are disabled to
reduce build dependencies; the benchmark links the existing `core` and
`uicommon` libraries. The target is off by default.

## Build the other emulators

Pinned comparison revisions:

- [Dolphin upstream `1ab733dd5c`](https://github.com/dolphin-emu/dolphin/commit/1ab733dd5ccb38108c97a76b1f79802683e36049), latest `master` fetched on October 6, 2026.
- [DingusPPC `1baa8eb10c`](https://github.com/mihaip/dingusppc/commit/1baa8eb10ccf516b31403062afa9b63028a13f71).
- [PearPC `41ff753571`](https://github.com/mihaip/pearpc/commit/41ff753571a027e989cc894cadfba2c4b3226870), using its generic interpreter.

For DingusPPC, from that checkout:

```sh
cmake -S . -B build-xcode -G Xcode \
  -DCMAKE_C_COMPILER="$(xcrun -f clang)" \
  -DCMAKE_CXX_COMPILER="$(xcrun -f clang++)" \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=15.7 -DDPPC_BUILD_BENCHMARKS=ON \
  -DSANITIZE_ADDRESS=OFF -DSANITIZE_UNDEFINED=OFF \
  -DSANITIZE_THREAD=OFF -DSANITIZE_MEMORY=OFF
cmake --build build-xcode --config Release --target bench1 --parallel 8
build-xcode/bin/Release/bench1
```

Regenerate CMake before building so its source globs include current files.
The original benchmark is unchanged and reports both `ppc_exec` and
`ppc_exec_until`.

For PearPC, build in a fresh copy to avoid disturbing its Emscripten configuration.
From the PearPC checkout, the following uses only tracked source files and keeps
native build changes in `build-native-bench/source`:

```sh
mkdir -p build-native-bench/source
git archive 41ff753571a027e989cc894cadfba2c4b3226870 | tar -x -C build-native-bench/source
cd build-native-bench/source
python3 - <<'PY_PATCH'
from pathlib import Path
p = Path('configure.ac')
p.write_text(p.read_text().replace('-mdynamic-no-pic', ''))
p = Path('src/ppc_bench.cc')
p.write_text(p.read_text().replace('test_samples = 2000', 'test_samples = 200'))
PY_PATCH
./autogen.sh
CC="$(xcrun -f clang)" CXX="$(xcrun -f clang++)" \
CFLAGS="-O3 -DNDEBUG -isysroot $(xcrun --show-sdk-path)" \
CXXFLAGS="-O3 -DNDEBUG -isysroot $(xcrun --show-sdk-path)" \
SDL_CONFIG=/opt/homebrew/bin/sdl2-config MACOSX_DEPLOYMENT_TARGET=15.7 \
./configure --enable-cpu=generic --enable-ui=sdl --disable-emscripten
make -C src/debug debugparse.h
make -j8
src/ppc bench
```

PearPC requires autoconf, automake, bison, flex, and SDL2. Adjust `SDL_CONFIG`
for your installation. Its old `-mdynamic-no-pic` flag is omitted for modern
Clang on arm64. Generating the parser header before the parallel build avoids
an existing dependency race. The sample-count change matches DingusPPC; the
checksum code and CPU implementation remain unchanged.

All three builds use Apple Clang 17.0.0 (`clang-1700.6.4.2`) from Xcode 26.3,
arm64, `-O3 -DNDEBUG`, a macOS 15.7 deployment target, no LTO, and no sanitizers.
Project defaults otherwise remain intact: Dolphin uses C++23,
`-march=armv8-a+crc`, `-fno-strict-aliasing`, `-fno-exceptions`, and
`-fomit-frame-pointer`; DingusPPC uses GNU C++20; PearPC uses C++11 and
`-fomit-frame-pointer`. These are aligned optimized native builds, not identical
compiler command lines. No fast-math flags were added.

## Repeat the comparison

Once the builds finish, run all benchmarks sequentially. The script rotates
their order across ten process invocations, checks outputs, and saves raw logs,
all batch minima in CSV, and a JSON summary:

```sh
python3 Source/Benchmarks/run_comparison.py \
  --dolphin build-bench/Binaries/ppc-bench \
  --dingus /path/to/dingusppc/build-xcode/bin/Release/bench1 \
  --pearpc /path/to/pearpc/build-native-bench/source/src/ppc \
  --runs 10 --output benchmark-results
```

Run on an otherwise idle machine, without simultaneous builds. The summary is
the **median of 50 batch minima**, each minimum drawn from 200 executions. It is
not the mean or median of individual execution times. Initialization, random
buffer generation, validation, and printing are excluded from each timed sample.
The stop path and normal CPU timing-slice handling are included. No forced
termination or timeout was used for the recorded runs.
