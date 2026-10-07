from pathlib import Path
import os,signal,shutil,subprocess,time,re,json,argparse
repo=Path(os.environ.get('DPPC_REPO', '/Users/mihai/Developer/source/infinite-mac/dingusppc'))
root=Path(os.environ.get('BOOT_RESULTS', '/tmp/dppc-carry-10.1'))
rom=os.environ.get('OSX_BOOT_ROM', '/Users/mihai/Developer/Retro/ROMs/4MB ROMs/1997-11 - 78F57389 - Power Mac G3 (v3).ROM')
disk=os.environ.get('OSX_BOOT_DISK', '/Users/mihai/Developer/Retro/QEMU/disk-10.1.hda')
seeds=Path(os.environ.get('OSX_BOOT_SEEDS',str(repo/'build-xcode/video-write-probe/seeds/osx')))
parser=argparse.ArgumentParser();parser.add_argument('names',nargs='+');parser.add_argument('--pause',action='store_true');args=parser.parse_args()
for name in args.names:
 variant=name.split('-')[0];run=root/name;run.mkdir()
 for file in ['nvram.bin','pram.bin']:
  shutil.copy2(seeds/file,run/file)
 shutil.copy2(repo/'build-xcode/bin/Release/113-32900-004_Apple_MACH64.bin',run/'113-32900-004_Apple_MACH64.bin')
 subprocess.run(['cp','-c',disk,str(run/'disk.hda')],check=True)
 binary=root/(variant+'.app')/'Contents/MacOS/dingusppc'
 cmd=[str(binary),'--deterministic','--mon_id=Multiscan17in','--log-to-stderr','-b',rom,'--hdd_img','disk.hda','--rambank1_size=128']
 record={'variant':variant,'command':cmd,'cwd':str(run),'endpoint_ns':160000000000,'termination':None}
 (run/'command.json').write_text(json.dumps(record,indent=2)+'\n')
 try:
  with (run/'console.log').open('w') as log:
   p=subprocess.Popen(cmd,cwd=run,stdin=subprocess.DEVNULL,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env=dict(os.environ,DYLD_FRAMEWORK_PATH='/Library/Frameworks'))
  record['pid']=p.pid;deadline=time.monotonic()+120;pos=0;found=False
  while p.poll() is None and time.monotonic()<deadline and not found:
   with (run/'console.log').open() as log:
    log.seek(pos)
    while line := log.readline():
     m=re.search(r'\(\s*(\d+\.\d+)s\).*TS=(\d+) PC=(0x[0-9a-f]+)',line)
     if m and int(m[2])>=record['endpoint_ns']:
      record.update(host_seconds=float(m[1]),guest_ns=int(m[2]),pc=m[3],marker=line.rstrip());found=True;break
    pos=log.tell()
   if not found:time.sleep(.01)
  if not found:raise RuntimeError('No guest milestone before exit/120-second timeout')
  if variant.startswith('screen'):
   capture_deadline=time.monotonic()+5
   frame=run/'framebuffer.ppm'
   while time.monotonic()<capture_deadline:
    if frame.exists() and frame.stat().st_size>=1557519:break
    time.sleep(.01)
   else:raise RuntimeError('Framebuffer capture missing/incomplete')
  if args.pause:
   p.send_signal(signal.SIGSTOP);record['termination']='SIGSTOP at endpoint, awaiting visual verification'
  else:
   p.send_signal(signal.SIGTERM);p.wait(timeout=5);record['termination']='SIGTERM after endpoint, intentional';record['returncode']=p.returncode
  (run/'result.json').write_text(json.dumps(record,indent=2)+'\n')
  print(name,record['host_seconds'],record['pc'],record['termination'],flush=True)
 except BaseException:
  if 'p' in locals() and p.poll() is None:p.kill();p.wait()
  record['termination']='failure, intentionally killed';(run/'result.json').write_text(json.dumps(record,indent=2)+'\n');raise
