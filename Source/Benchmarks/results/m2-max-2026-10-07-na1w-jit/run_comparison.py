#!/usr/bin/env python3
"""Compare this fork's two runtime modes using an identical x86-64 binary."""
import argparse, csv, json, os, re, statistics, subprocess
from pathlib import Path
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--binary',type=Path,required=True)
parser.add_argument('--diagnostic-binary',type=Path)
parser.add_argument('--runs',type=int,default=30)
parser.add_argument('--output',type=Path,required=True)
a=parser.parse_args()
a.output.mkdir(parents=True,exist_ok=True)
commands=[('interpreter',[str(a.binary.resolve())]),('jit-default',[str(a.binary.resolve()),'--jit'])]
if a.diagnostic_binary:commands.append(('jit-relaxed-selfloop',[str(a.diagnostic_binary.resolve()),'--jit']))
env={k:v for k,v in os.environ.items() if not k.startswith('DPPC_')}
env['DYLD_FRAMEWORK_PATH']='/Library/Frameworks'
records=[]
counters=[]
input_bytes=None
for run in range(a.runs):
    shift=run%len(commands)
    for name,command in commands[shift:]+commands[:shift]:
        result=subprocess.run(command,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,env=env,timeout=30,check=True)
        (a.output/f'{name}-{run+1:02d}.log').write_text(result.stdout)
        data=re.findall(r'^[0-9a-f]{64}$',result.stdout,re.M)
        checksums=re.findall(r'Checksum: 0x([0-9A-Fa-f]+)',result.stdout)
        if input_bytes is None:input_bytes=data
        assert len(data)==2 and data==input_bytes and checksums==['F376152A'],name
        samples=re.findall(r'\((\d)\) (\d+) ns, ([0-9.]+) MiB/s',result.stdout)
        assert len(samples)==10,name
        for index,(batch,ns,rate) in enumerate(samples):
            mode=name if index<5 else name+'-until-interpreter-control'
            records.append(dict(run=run+1,mode=mode,batch=int(batch),ns=int(ns),mib_per_s=float(rate)))
        native,bails=map(int,re.search(r'JIT native blocks: (\d+), interpreter handoffs: (\d+)',result.stdout).groups())
        counters.append(dict(run=run+1,mode=name,native_blocks=native,interpreter_handoffs=bails))
        if name=='interpreter':assert native==0 and bails==0
        elif name=='jit-default':assert native==9000 and bails==1000
        else:assert native>9000 and bails==0
        print(f'Run {run+1}: {name} OK; blocks={native}, handoffs={bails}',flush=True)
with (a.output/'batches.csv').open('w') as f:
    w=csv.DictWriter(f,fieldnames=records[0].keys(),lineterminator='\n');w.writeheader();w.writerows(records)
summary={}
for mode in sorted({r['mode'] for r in records}):
    times=[r['ns'] for r in records if r['mode']==mode]
    median=statistics.median(times)
    summary[mode]=dict(batches=len(times),median_ns=median,min_ns=min(times),max_ns=max(times),mib_per_s=1e9*32768/(median*1024*1024))
report=dict(runs=a.runs,samples_per_batch=200,bytes_per_sample=32768,checksum='F376152A',input_prefix=input_bytes,commands=commands,summary=summary,counters=counters)
(a.output/'summary.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(summary,indent=2))
