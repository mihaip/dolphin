from pathlib import Path
import subprocess, shutil, json, os

repo=Path(os.environ.get('DPPC_REPO','/Users/mihai/Developer/source/infinite-mac/dingusppc'))
root=Path(os.environ.get('CARRY_REVIEW_RESULTS',str(Path(__file__).parent)))
root.mkdir(parents=True,exist_ok=True)
commit='74c60fcd5788656c0e9b524229899529cbd008d6'
def git(*args):
    return subprocess.check_output(['git',*args],cwd=repo,text=True).strip()
original_branch=git('branch','--show-current')
original_tip=git('rev-parse','HEAD')
parent=git('rev-parse',commit+'^')
branch='benchmark-upstream-carry'
assert original_branch and not git('diff','--name-only') and not git('diff','--cached','--name-only')
manifest={'original_branch':original_branch,'original_tip':original_tip,'before':parent,
          'after':commit,'upstream_branch':branch,'config':'Release native arm64 -O3 -DNDEBUG, no LTO/sanitizers'}
(root/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
exists=subprocess.run(['git','show-ref','--verify','--quiet','refs/heads/'+branch],cwd=repo).returncode==0
if exists:
    assert git('rev-parse',branch)==commit
    git('switch',branch)
else:
    git('switch','-c',branch,commit)
try:
    for name,rev in [('before',parent),('after',branch)]:
        if name=='before':git('switch','--detach',rev)
        else:git('switch',rev)
        (root/(name+'-ppcopcodes.cpp')).write_bytes((repo/'cpu/ppc/ppcopcodes.cpp').read_bytes())
        (root/(name+'-ppcemu.h')).write_bytes((repo/'cpu/ppc/ppcemu.h').read_bytes())
        with (root/('build-'+name+'.log')).open('w') as log:
            subprocess.run(['cmake','-S',str(repo),'-B','build-xcode'],cwd=repo,stdout=log,stderr=subprocess.STDOUT,check=True)
            subprocess.run(['cmake','--build','build-xcode','--config','Release',
                            '--target','bench1','--parallel','8'],cwd=repo,
                           stdout=log,stderr=subprocess.STDOUT,check=True)
        shutil.copy2(repo/'build-xcode/bin/Release/bench1',root/name)
        print('Built',name,git('rev-parse','HEAD'),flush=True)
finally:
    git('switch',original_branch)
    assert git('rev-parse','HEAD')==original_tip
    with (root/'build-restored.log').open('w') as log:
        subprocess.run(['cmake','-S',str(repo),'-B','build-xcode'],cwd=repo,stdout=log,stderr=subprocess.STDOUT,check=True)
        subprocess.run(['cmake','--build','build-xcode','--config','Release','--target',
                        'bench1','dingusppc','--parallel','8'],cwd=repo,
                       stdout=log,stderr=subprocess.STDOUT,check=True)
    print('Restored',original_branch,original_tip,flush=True)
