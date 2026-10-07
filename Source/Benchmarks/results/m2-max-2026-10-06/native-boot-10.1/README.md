# DingusPPC native Mac OS X 10.1 boot control

The `adde` carry calculation that reduced DingusPPC's checksum time by 27%
produced no detectable improvement in this full boot. The supplied image named
`disk-10.1.hda` contains **Mac OS X 10.1.5, build 5S60b**, verified from its
`System/Library/CoreServices/SystemVersion.plist` after the timing runs.

| Build | Mean elapsed time | Median elapsed time |
| --- | ---: | ---: |
| Original carry calculation | 41.597 s | 41.636 s |
| Branchless 64-bit carry calculation | 41.677 s | 41.616 s |

Six paired runs, alternating A/B and B/A order. The optimized build's mean
time minus the baseline's was **+80 ms**; a two-sided paired Student t 95%
interval is **−191 to +351 ms**. This experiment cannot resolve a few-millisecond
effect, and the observed difference does not establish a slowdown.

## What the guest actually used

A separate counter build, with the original carry arithmetic, recorded:

| Counter through the checkpoint | Count |
| --- | ---: |
| Guest instructions dispatched | 8,855,588,185 |
| `adde`, without CR recording or overflow checking | 1,501,544 |
| `adde.`, with CR recording and without overflow checking | 399,392 |
| Overflow-checking `adde` variants | 0 |
| All `adde` variants | 1,900,936 (0.021466% of instructions) |

The checksum spends 44.4% of its instructions on `adde`. This boot executes it
roughly 2,000 times less frequently as a share of its instructions. Scaling the
earlier checksum saving, `(80.209 − 58.562) µs / 8192`, across the boot's
1,900,936 calls gives **5.02 ms**, or **0.0121%** of baseline elapsed time.
That is an extrapolation, not a measured boot saving: operand patterns, CR
recording, branch prediction, and surrounding code differ. The counter build
also found carry output true on 29.62% of calls, with 330,196 output changes
between consecutive calls within each variant. Those changes are not a host
branch-miss measurement.

This conclusion applies to the tested `adde` patch. It does not measure changes
to other arithmetic handlers, a cached interpreter, or an Emscripten boot.

## Setup and correctness checks

- DingusPPC commit `1baa8eb10ccf516b31403062afa9b63028a13f71`.
- Apple M2 Max, 64 GB RAM; Apple Clang 17.0.0, Xcode 26.3.
- Maintained `build-xcode/`, Release, native ARM64, `-O3 -DNDEBUG`;
  no LTO, sanitizers, or counters in either timed build.
- Beige G3 v3 ROM (`78F57389`), MPC750, 128 MB RAM, ATI Rage GT,
  Multiscan 17-inch monitor, 832 × 624 desktop.
- Fresh APFS clones of the same disk and fresh identical NVRAM/PRAM seeds for
  every run. The original disk was not modified.
- Strict `--deterministic` mode, default fixed guest RTC. The matching seeds
  select `ide0/@0:8`; the seed hashes are in `inputs.json`.
- Elapsed time is the console logger's host time at the first one-second
  diagnostic checkpoint with guest virtual time ≥160 seconds. This is a fixed
  checkpoint after Finder and startup activity have settled, not a measurement
  of the first visible desktop frame. At that checkpoint the guest is idle at
  `0x00090af4` (`mtmsr r5`).
- All twelve timed boots produced identical sequences of guest virtual times,
  PCs, and disassembled instructions through that checkpoint.
- Separate framebuffer-capture builds produced byte-identical desktop images.
  Capturing and counter instrumentation are excluded from the timed builds.
- Runs were intentionally stopped with SIGTERM after the checkpoint; these
  terminations are not guest or emulator crashes.

`candidate.patch` changes only carry calculation in `ppc_adde`. `profile.patch`
adds the independent counters. The ARM64 disassemblies confirm removal of the
data-dependent carry branches. Both patches apply to the original DPPC source.
Temporary source changes were restored and the original native build rebuilt
after creating the test binaries.

## Reproduction

ROM, disk, video ROM, and seed files are not included. Supply compatible copies
and an existing native Xcode build directory. `inputs.json` identifies the
exact inputs used here. The scripts retain the original local defaults and
accept environment overrides:

```sh
export DPPC_REPO=/path/to/dingusppc
export BOOT_RESULTS=/tmp/dppc-carry-boot-new
export OSX_BOOT_ROM=/path/to/Beige-G3-v3.ROM
export OSX_BOOT_DISK=/path/to/disk-10.1.hda
export OSX_BOOT_SEEDS=/path/to/matching-seeds

python3 build_variants.py
python3 run_boots.py profile-verify
python3 build_screens.py
python3 run_boots.py screenbase2-verify screencandidate2-verify
python3 run_boots.py \
  baseline-01 candidate-01 candidate-02 baseline-02 \
  baseline-03 candidate-03 candidate-04 baseline-04 \
  baseline-05 candidate-05 candidate-06 baseline-06
python3 summarize.py
```

Use a fresh result directory. The build scripts temporarily modify the CPU and
diagnostic sources, copy each resulting app bundle, then restore the captured
sources in a `finally` block and rebuild the maintained Release emulator.
`build_screens.py` is optional verification instrumentation: it writes a PPM
from the emulated framebuffer at the same checkpoint. The two PNG files here
are lossless conversions of those identical PPM captures.

`timings.csv`, `summary.json`, per-run console logs, and `profile.log` contain
the raw evidence. The counter log ends just after the 160-second checkpoint;
subsequent idle output is omitted. `summary.json` records every timed command, endpoint, return
code, and normalized guest-trace hash. The published build scripts add input
path overrides and baseline creation to the local experiment scripts; the
measured binary and input hashes are recorded independently.
