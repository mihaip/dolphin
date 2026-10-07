from pathlib import Path
import subprocess,shutil
import argparse
parser=argparse.ArgumentParser(description="Build the CPU benchmark diagnostic variants in a fresh configured checkout.")
parser.add_argument('--repo',required=True,type=Path)
parser.add_argument('--output',type=Path,default=Path('analysis-build'))
args=parser.parse_args()
repo=args.repo.resolve()
out=args.output.resolve()
out.mkdir(parents=True,exist_ok=True)
files={'ci':repo/'Source/Core/Core/PowerPC/CachedInterpreter/CachedInterpreter.cpp','int':repo/'Source/Core/Core/PowerPC/Interpreter/Interpreter_Integer.cpp','mem':repo/'Source/Core/Core/PowerPC/MMU.cpp','load':repo/'Source/Core/Core/PowerPC/Interpreter/Interpreter_LoadStore.cpp'}
original={k:p.read_text() for k,p in files.items()}
variants=['stock-baseline','stock-carry64','stock-no-memcheck','stock-direct-ram','stock-no-pmu','stock-tiny-cache']
try:
 for name in variants:
  sources=original.copy()
  if name.endswith('carry64'):
   sources['int']=sources['int'].replace('ppc_state.SetCarry(Helper_Carry(a, b) || (carry != 0 && Helper_Carry(a + b, carry)));','ppc_state.SetCarry((u64{a} + u64{b} + carry) >> 32);')
  elif name.endswith('no-memcheck'):
   sources['mem']=sources['mem'].replace('  Memcheck(address, var, false, sizeof(T));','  // Diagnostic: no watchpoints installed.')
  elif name.endswith('direct-ram'):
   s=sources['load'].replace('#include "Core/ConfigManager.h"','#include "Core/ConfigManager.h"\n#include "Core/HW/Memmap.h"')
   for op in ['lwz','lwzu']:
    i=s.index('void Interpreter::'+op+'(');j=s.index('\nvoid Interpreter::',i+10)
    c=s[i:j].replace('const u32 temp = interpreter.m_mmu.Read<u32>(address);','const u32 temp = Common::swap32(interpreter.m_system.GetMemory().GetRAM() + address);');s=s[:i]+c+s[j:]
   sources['load']=s
  elif name.endswith('no-pmu'):
   sources['ci']=sources['ci'].replace('  PowerPC::UpdatePerformanceMonitor(operands.downcount, operands.num_load_stores,\n                                    operands.num_fp_inst, ppc_state);','  // Diagnostic: performance counters disabled.')
  elif name.endswith('tiny-cache'):
   sources['ci']=sources['ci'].replace('  const u8* normal_entry = m_block_cache.Dispatch();','''  // Diagnostic: immutable code, fixed CPU mode, only 50 instruction addresses.
  static const u8* entries[50]{};
  auto& entry = entries[m_ppc_state.pc / 4];
  const u8* normal_entry = entry;
  if (!normal_entry)
    normal_entry = entry = m_block_cache.Dispatch();''')
  for k,p in files.items():
   if p.read_text()!=sources[k]: p.write_text(sources[k])
  patch=''
  import difflib
  for k,p in files.items():
   rel=str(p.relative_to(repo))
   patch+=''.join(difflib.unified_diff(original[k].splitlines(True),sources[k].splitlines(True),fromfile='a/'+rel,tofile='b/'+rel))
  (out/(name+'.patch')).write_text(patch)
  with (out/('build-'+name+'.log')).open('w') as f:
   subprocess.run(['cmake','--build','build-bench','--target','ppc-bench','--parallel','8'],cwd=repo,stdout=f,stderr=subprocess.STDOUT,check=True)
  shutil.copy2(repo/'build-bench/Binaries/ppc-bench',out/name)
  print('Built',name,flush=True)
finally:
 for k,p in files.items():
  if p.read_text()!=original[k]:p.write_text(original[k])
 subprocess.run(['cmake','--build','build-bench','--target','ppc-bench','--parallel','8'],cwd=repo,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
