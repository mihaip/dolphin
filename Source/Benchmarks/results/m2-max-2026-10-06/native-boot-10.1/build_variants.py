from pathlib import Path
import subprocess,shutil,difflib,os
repo=Path(os.environ.get('DPPC_REPO', '/Users/mihai/Developer/source/infinite-mac/dingusppc'))
root=Path(os.environ.get('BOOT_RESULTS', '/tmp/dppc-carry-10.1'))
(root/'original').mkdir(parents=True, exist_ok=True)
files=['cpu/ppc/ppcopcodes.cpp','cpu/ppc/ppcexec.cpp','main.cpp']
original={f:(repo/f).read_bytes() for f in files}
for f,b in original.items():(root/'original'/Path(f).name).write_bytes(b)
old='''    if ((ppc_result_d < ppc_result_a) || (xer_ca && (ppc_result_d == ppc_result_a))) {
        ppc_state.spr[SPR::XER] |= XER::CA;
    } else {
        ppc_state.spr[SPR::XER] &= ~XER::CA;
    }'''
new='''    uint64_t sum = uint64_t(ppc_result_a) + ppc_result_b + xer_ca;
    ppc_state.spr[SPR::XER] = (ppc_state.spr[SPR::XER] & ~XER::CA) |
                             (uint32_t(sum >> 32) * XER::CA);'''
def edit(f,s):
 b=original[f];crlf=b'\r\n' in b
 return s.replace('\n','\r\n').encode() if crlf else s.encode()
def build(name,changes):
 for f,b in original.items():(repo/f).write_bytes(changes.get(f,b))
 with (root/('build-'+name+'.log')).open('w') as log:
  subprocess.run(['cmake','--build','build-xcode','--config','Release','--target','dingusppc','--parallel','8'],cwd=repo,stdout=log,stderr=subprocess.STDOUT,check=True)
 shutil.copytree(repo/'build-xcode/bin/Release/dingusppc.app',root/(name+'.app'))
 patch=''
 for f,b in changes.items():patch+=''.join(difflib.unified_diff(original[f].decode().splitlines(True),b.decode().splitlines(True),fromfile='a/'+f,tofile='b/'+f))
 (root/(name+'.patch')).write_text(patch)
 print('Built',name,flush=True)
try:
 build('baseline',{})
 s=original[files[0]].decode().replace('\r\n','\n');assert s.count(old)==1
 build('candidate',{files[0]:edit(files[0],s.replace(old,new))})
 s=original[files[0]].decode().replace('\r\n','\n')
 s=s.replace('static int junction_temperature', 'uint64_t diag_calls[4]{}, diag_taken[4]{}, diag_inputs[4]{}, diag_changes[4]{};\nstatic bool diag_last[4]{};\n\nstatic int junction_temperature')
 marker='    uint32_t ppc_result_d = ppc_result_a + ppc_result_b + xer_ca;'
 i=s.index('void dppc_interpreter::ppc_adde(');j=s.index(marker,i)+len(marker)
 s=s[:j]+'''
    constexpr unsigned variant = (rec ? 1 : 0) | (ov ? 2 : 0);
    bool taken = (ppc_result_d < ppc_result_a) || (xer_ca && ppc_result_d == ppc_result_a);
    if (diag_calls[variant]) diag_changes[variant] += (taken != diag_last[variant]);
    ++diag_calls[variant]; diag_taken[variant] += taken; diag_inputs[variant] += xer_ca;
    diag_last[variant] = taken;
'''+s[j:]
 changes={files[0]:edit(files[0],s)}
 s=original[files[1]].decode().replace('\r\n','\n').replace('bool is_deterministic = false;', 'uint64_t diag_total = 0;\nbool is_deterministic = false;').replace('void ppc_main_opcode(PPCOpcode *opcodeGrabber, uint32_t opcode)\n{','void ppc_main_opcode(PPCOpcode *opcodeGrabber, uint32_t opcode)\n{\n    ++diag_total;')
 changes[files[1]]=edit(files[1],s)
 s=original[files[2]].decode().replace('\r\n','\n').replace('using namespace std;', 'extern uint64_t diag_total, diag_calls[4], diag_taken[4], diag_inputs[4], diag_changes[4];\nusing namespace std;')
 marker='            LOG_F(INFO, "TS=%016llu PC=0x%08x executing %s", get_virt_time_ns(), ppc_state.pc, op_name.c_str());'
 assert s.count(marker)==1
 s=s.replace(marker,marker+'''
            LOG_F(INFO, "CARRY total=%llu calls=%llu,%llu,%llu,%llu taken=%llu inputs=%llu changes=%llu",
                (unsigned long long)diag_total,
                (unsigned long long)diag_calls[0], (unsigned long long)diag_calls[1],
                (unsigned long long)diag_calls[2], (unsigned long long)diag_calls[3],
                (unsigned long long)(diag_taken[0]+diag_taken[1]+diag_taken[2]+diag_taken[3]),
                (unsigned long long)(diag_inputs[0]+diag_inputs[1]+diag_inputs[2]+diag_inputs[3]),
                (unsigned long long)(diag_changes[0]+diag_changes[1]+diag_changes[2]+diag_changes[3]));''')
 changes[files[2]]=edit(files[2],s)
 build('profile',changes)
finally:
 for f,b in original.items():(repo/f).write_bytes(b)
 with (root/'build-restored.log').open('w') as log:subprocess.run(['cmake','--build','build-xcode','--config','Release','--target','dingusppc','--parallel','8'],cwd=repo,stdout=log,stderr=subprocess.STDOUT,check=True)
