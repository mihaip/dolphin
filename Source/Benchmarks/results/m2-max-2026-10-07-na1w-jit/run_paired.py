#!/usr/bin/env python3
"""Pair interpreter/JIT checksum samples within each process."""
import argparse,csv,json,os,re,statistics,subprocess
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary',type=Path,required=True)
p.add_argument('--diagnostic-binary',type=Path,required=True)
p.add_argument('--runs',type=int,default=30)
p.add_argument('--output',type=Path,required=True)
a=p.parse_args()
a.output.mkdir(parents=True,exist_ok=True)
commands=[('default',a.binary.resolve()),('relaxed-selfloop',a.diagnostic_binary.resolve())]
env={k:v for k,v in os.environ.items() if not k.startswith('DPPC_')}
env['DYLD_FRAMEWORK_PATH']='/Library/Frameworks'
rows=[];counters=[];data_ref=None
for run in range(a.runs):
    order=commands if run%2==0 else commands[::-1]
    for name,binary in order:
        r=subprocess.run([str(binary),'--paired'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,env=env,timeout=30,check=True)
        (a.output/f'{name}-{run+1:02d}.log').write_text(r.stdout)
        data=re.findall(r'^[0-9a-f]{64}$',r.stdout,re.M)
        if data_ref is None:data_ref=data
        assert len(data)==2 and data==data_ref
        assert re.findall(r'Checksum: 0x([0-9A-Fa-f]+)',r.stdout)==['F376152A']
        pairs=re.findall(r'Pair \((\d+)\): interpreter (\d+) ns, jit (\d+) ns',r.stdout)
        assert len(pairs)==5
        for batch,interp,jit in pairs:
            interp,jit=int(interp),int(jit)
            rows.append(dict(run=run+1,variant=name,batch=int(batch),interpreter_ns=interp,jit_ns=jit,jit_time_ratio=jit/interp))
        native,bails=map(int,re.search(r'JIT native blocks: (\d+), interpreter handoffs: (\d+)',r.stdout).groups())
        if name=='default':assert native==9000 and bails==1000
        else:assert native==2055000 and bails==0
        counters.append(dict(run=run+1,variant=name,native_blocks=native,interpreter_handoffs=bails))
        print(f'Run {run+1}: {name} OK; blocks={native}, handoffs={bails}',flush=True)
with (a.output/'batches.csv').open('w') as f:
    w=csv.DictWriter(f,fieldnames=rows[0].keys(),lineterminator='\n');w.writeheader();w.writerows(rows)
summary={}
for name,_ in commands:
    batch=[r for r in rows if r['variant']==name]
    s={'batches':len(batch),'median_paired_time_ratio':statistics.median(r['jit_time_ratio'] for r in batch)}
    for field in ['interpreter_ns','jit_ns']:
        values=[r[field] for r in batch]
        s[field]={'median':statistics.median(values),'min':min(values),'max':max(values)}
    summary[name]=s
report=dict(runs=a.runs,samples_per_batch_per_mode=200,bytes_per_sample=32768,checksum='F376152A',input_prefix=data_ref,commands=[(n,str(b)) for n,b in commands],summary=summary,counters=counters)
(a.output/'summary.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(summary,indent=2))
