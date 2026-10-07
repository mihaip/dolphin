#!/usr/bin/env python3
"""Run the three checksum benchmarks sequentially, rotating their order."""
import argparse
import csv
import json
from pathlib import Path
import re
import statistics
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('dolphin', 'dingus', 'pearpc'):
        parser.add_argument('--' + name, required=True, type=Path)
    parser.add_argument('--runs', type=int, default=10)
    parser.add_argument('--output', type=Path, default=Path('benchmark-results'))
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    commands = [
        ('dolphin-cached', [str(args.dolphin.resolve()), 'cached']),
        ('dingus', [str(args.dingus.resolve())]),
        ('pearpc', [str(args.pearpc.resolve()), 'bench']),
        ('dolphin-interpreter', [str(args.dolphin.resolve()), 'interpreter']),
    ]
    records = []
    input_bytes = None
    checksum = None
    for run in range(args.runs):
        shift = run % len(commands)
        for name, command in commands[shift:] + commands[:shift]:
            result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                    text=True, check=True)
            (args.output / f'{name}-{run + 1:02d}.log').write_text(result.stdout)
            data = re.findall(r'^[0-9a-f]{64}$', result.stdout, re.MULTILINE)
            checksums = re.findall(r'Checksum: 0x([0-9A-Fa-f]+)', result.stdout)
            if len(data) != 2 or not checksums:
                raise RuntimeError(f'{name}: missing input/checksum output')
            if input_bytes is None:
                input_bytes, checksum = data, checksums[0]
            if data != input_bytes or any(c != checksum for c in checksums):
                raise RuntimeError(f'{name}: input or checksum mismatch')
            samples = re.findall(r'\((\d)\) (\d+) ns, ([0-9.]+) MiB/s', result.stdout)
            if len(samples) != (10 if name == 'dingus' else 5):
                raise RuntimeError(f'{name}: missing batch timings')
            for index, (batch, ns, rate) in enumerate(samples):
                mode = name
                if name == 'dingus':
                    mode = 'dingus-exec' if index < 5 else 'dingus-exec-until'
                records.append(dict(run=run + 1, mode=mode, batch=int(batch),
                                    ns=int(ns), mib_per_s=float(rate)))
            print(f'Run {run + 1}: {name} OK', flush=True)
    with (args.output / 'batches.csv').open('w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=records[0].keys(), lineterminator="\n")
        writer.writeheader()
        writer.writerows(records)
    summary = {}
    for mode in sorted({r['mode'] for r in records}):
        times = [r['ns'] for r in records if r['mode'] == mode]
        median = statistics.median(times)
        summary[mode] = dict(batches=len(times), median_ns=median,
                             min_ns=min(times), max_ns=max(times),
                             mib_per_s=1e9 * 0x8000 / (median * 1024 * 1024))
    report = dict(runs=args.runs, samples_per_batch=200, bytes_per_sample=0x8000,
                  checksum=checksum, input_prefix=input_bytes, commands=commands,
                  summary=summary)
    (args.output / 'summary.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    main()
