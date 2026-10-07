from pathlib import Path
import subprocess,statistics,re,json,sys,os
import argparse
parser=argparse.ArgumentParser(description="Rotate the diagnostic variants and save checksum-checked batch minima.")
parser.add_argument('--binaries',required=True,type=Path)
parser.add_argument('--runs',type=int,default=10)
parser.add_argument('names',nargs='+')
args=parser.parse_args()
root=args.binaries.resolve()
names=args.names
values={n:[] for n in names}
env=dict(os.environ,PPC_BENCH_SAMPLES='200')
for run in range(args.runs):
 for name in names[run%len(names):]+names[:run%len(names)]:
  cmd=[str(root/name),'cached'] if not name.startswith('dingus') else [str(root/name)]
  p=subprocess.run(cmd,env=env,capture_output=True,text=True,check=True)
  out=p.stdout+p.stderr
  (root/f'{name}-run-{run:02d}.log').write_text(out)
  assert '0xF376152A' in out
  samples=list(map(int,re.findall(r'\(\d\) (\d+) ns',out)))
  if name.startswith('dingus'): samples=samples[:5]
  assert len(samples)==5
  values[name]+=samples
report={n:dict(median_ns=statistics.median(v),min_ns=min(v),max_ns=max(v),batches=len(v)) for n,v in values.items()}
(root/('comparison-'+'-'.join(names)+'.json')).write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
