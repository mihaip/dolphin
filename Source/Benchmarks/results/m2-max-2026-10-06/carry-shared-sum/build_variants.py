from pathlib import Path
import os, subprocess, shutil, difflib, json

repo = Path(os.environ.get('DPPC_REPO', '/Users/mihai/Developer/source/infinite-mac/dingusppc'))
root = Path(os.environ.get('CARRY_RESULTS', str(Path(__file__).parent)))
source = repo/'cpu/ppc/ppcopcodes.cpp'
original = source.read_bytes()
text = original.decode().replace('\r\n', '\n')
old = '''    uint32_t ppc_result_d = ppc_result_a + ppc_result_b + xer_ca;

    if ((ppc_result_d < ppc_result_a) || (xer_ca && (ppc_result_d == ppc_result_a))) {
        ppc_state.spr[SPR::XER] |= XER::CA;
    } else {
        ppc_state.spr[SPR::XER] &= ~XER::CA;
    }'''
carry = '''    ppc_state.spr[SPR::XER] = (ppc_state.spr[SPR::XER] & ~XER::CA) |
                             (uint32_t(sum >> 32) * XER::CA);'''
wide = '''    uint32_t ppc_result_d = ppc_result_a + ppc_result_b + xer_ca;

    uint64_t sum = uint64_t(ppc_result_a) + ppc_result_b + xer_ca;
''' + carry
shared = '''    uint64_t sum = uint64_t(ppc_result_a) + ppc_result_b + xer_ca;
    uint32_t ppc_result_d = uint32_t(sum);

''' + carry
assert text.count(old) == 1
root.mkdir(parents=True, exist_ok=True)
(root/'original-ppcopcodes.cpp').write_bytes(original)
try:
    for name, replacement in [('baseline', old), ('wide', wide), ('shared', shared)]:
        changed = text.replace(old, replacement)
        source.write_bytes(changed.replace('\n', '\r\n').encode() if b'\r\n' in original else changed.encode())
        with (root/f'build-{name}.log').open('w') as log:
            subprocess.run(['cmake', '--build', 'build-xcode', '--config', 'Release',
                            '--target', 'bench1', '--parallel', '8'], cwd=repo,
                           stdout=log, stderr=subprocess.STDOUT, check=True)
        shutil.copy2(repo/'build-xcode/bin/Release/bench1', root/name)
        patch = ''.join(difflib.unified_diff(original.decode().splitlines(True), source.read_bytes().decode().splitlines(True),
                                            fromfile='a/cpu/ppc/ppcopcodes.cpp',
                                            tofile='b/cpu/ppc/ppcopcodes.cpp'))
        (root/f'{name}.patch').write_text(patch)
        print('Built', name, flush=True)
finally:
    source.write_bytes(original)
    with (root/'build-restored.log').open('w') as log:
        subprocess.run(['cmake', '--build', 'build-xcode', '--config', 'Release',
                        '--target', 'bench1', 'dingusppc', '--parallel', '8'], cwd=repo,
                       stdout=log, stderr=subprocess.STDOUT, check=True)
