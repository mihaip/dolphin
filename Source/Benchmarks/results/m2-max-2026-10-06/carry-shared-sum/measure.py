from pathlib import Path
import subprocess, statistics, re, json, csv, os, hashlib, argparse

root = Path(os.environ.get('CARRY_RESULTS', str(Path(__file__).parent)))
parser=argparse.ArgumentParser()
parser.add_argument('--runs', type=int, default=30)
args=parser.parse_args()
names = ['baseline', 'wide', 'shared']
values = {n: {'ppc_exec': [], 'ppc_exec_until': []} for n in names}
rows = []
for run in range(args.runs):
    for name in names[run%3:] + names[:run%3]:
        p = subprocess.run([str(root/name)], capture_output=True, text=True, check=True)
        output = p.stdout + p.stderr
        (root/f'{name}-{run:02d}.log').write_text(output)
        checksums = re.findall(r'Checksum: (0x[0-9A-Fa-f]+)', output)
        assert checksums and all(c.upper() == '0XF376152A' for c in checksums), checksums
        samples = list(map(int, re.findall(r'\(\d\) (\d+) ns', output)))
        assert len(samples) == 10, samples
        for mode, batches in [('ppc_exec', samples[:5]), ('ppc_exec_until', samples[5:])]:
            values[name][mode].extend(batches)
            rows.extend({'variant':name, 'run':run, 'mode':mode,
                         'batch':i+1, 'minimum_ns':v} for i,v in enumerate(batches))
    print('Completed rotation', run+1, flush=True)
report = {n: {mode: {'median_ns': statistics.median(v), 'minimum_ns': min(v),
                     'maximum_ns': max(v), 'batch_minima': len(v)}
              for mode,v in modes.items()} for n,modes in values.items()}
report['protocol'] = f'{args.runs} rotated runs per variant; 5 batches of 200 samples per entry point'
report['checksum'] = '0xF376152A'
report['binaries_sha256'] = {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names}
with (root/'batches.csv').open('w') as f:
    w = csv.DictWriter(f, fieldnames=list(rows[0]), lineterminator='\n')
    w.writeheader(); w.writerows(rows)
(root/'summary.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
