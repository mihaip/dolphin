from pathlib import Path
import csv, hashlib, json, re, statistics, os

root = Path(os.environ.get('BOOT_RESULTS', str(Path(__file__).parent)))
runs = []
traces = {}
for p in sorted(root.glob('*/result.json')):
    r = json.loads(p.read_text())
    name = p.parent.name
    if not re.fullmatch(r'(baseline|candidate)-\d+', name):
        continue
    trace = []
    for line in (p.parent/'console.log').read_text().splitlines():
        m = re.search(r'TS=(\d+) PC=.*', line)
        if m:
            trace.append(m[0])
            if int(m[1]) >= r['endpoint_ns']:
                break
    traces[name] = trace
    r['name'] = name
    r['trace_sha256'] = hashlib.sha256('\n'.join(trace).encode()).hexdigest()
    r['trace_samples'] = len(trace)
    runs.append(r)

by_name = {r['name']: r for r in runs}
pairs = []
for i in range(1, 7):
    b = by_name.get(f'baseline-{i:02d}')
    c = by_name.get(f'candidate-{i:02d}')
    if b and c:
        pairs.append({'pair':i, 'baseline_seconds':b['host_seconds'],
                      'candidate_seconds':c['host_seconds'],
                      'saved_seconds':b['host_seconds'] - c['host_seconds'],
                      'saved_percent':100*(b['host_seconds'] - c['host_seconds'])/b['host_seconds']})
if not pairs:
    raise SystemExit('No complete pairs yet')

with (root/'timings.csv').open('w') as f:
    w = csv.DictWriter(f, fieldnames=list(pairs[0]), lineterminator='\n')
    w.writeheader(); w.writerows(pairs)

summary = {'pairs':pairs, 'all_guest_traces_equal':len({r['trace_sha256'] for r in runs}) == 1,
           'runs':runs}
for variant in ('baseline', 'candidate'):
    v = [p[variant+'_seconds'] for p in pairs]
    summary[variant] = {'mean_seconds':statistics.mean(v), 'median_seconds':statistics.median(v),
                        'stdev_seconds':statistics.stdev(v) if len(v)>1 else None}
v = [p['saved_seconds'] for p in pairs]
summary['paired_mean_saved_seconds'] = statistics.mean(v)
summary['paired_median_saved_seconds'] = statistics.median(v)
if len(v) == 6:
    # Two-sided 95% Student t interval, five degrees of freedom.
    half = 2.5705818356 * statistics.stdev(v) / len(v)**0.5
    summary['paired_95_percent_ci_seconds'] = [statistics.mean(v)-half, statistics.mean(v)+half]

profile = (root/'profile-verify/console.log').read_text().splitlines()
for i,line in enumerate(profile):
    m = re.search(r'TS=(\d+) PC=',line)
    if m and int(m[1]) >= 160000000000:
        c = re.search(r'CARRY total=(\d+) calls=([\d,]+) taken=(\d+) inputs=(\d+) changes=(\d+)',profile[i+1])
        total = int(c[1]); calls = list(map(int,c[2].split(',')))
        count = sum(calls)
        summary['profile'] = {'guest_instructions':total,'adde_variants':calls,'adde_total':count,
            'adde_percent':100*count/total,'carry_output_true':int(c[3]),
            'carry_input_true':int(c[4]),'carry_output_transitions':int(c[5]),
            'checksum_extrapolated_saved_seconds':count*(80.209-58.562)*1e-6/8192}
        break

frames = [root/n/'framebuffer.ppm' for n in ('screenbase2-verify','screencandidate2-verify')]
if all(p.exists() for p in frames):
    summary['framebuffers_equal'] = frames[0].read_bytes() == frames[1].read_bytes()
    summary['framebuffer_sha256'] = [hashlib.sha256(p.read_bytes()).hexdigest() for p in frames]
(root/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k not in ('runs','pairs')},indent=2))
