# Upstream DingusPPC carry optimization

The upstream-only comparison reproduces the checksum improvement. No
correctness defect was found in the commit. Its broader use of wide carry
arithmetic does have workload-dependent Wasm costs, especially for the
previously cheap `subfme` and `subfze` cases.

## Native checksum comparison

| Revision | `ppc_exec` | `ppc_exec_until` |
| --- | ---: | ---: |
| Parent `8652a5b8c4ebf42bc7acb3fc51167eaaf21364d5` | 80.167 µs | 80.291 µs |
| Commit `74c60fcd5788656c0e9b524229899529cbd008d6` | 58.583 µs | 58.500 µs |

The primary benchmark takes **26.92% less time**, matching the earlier carry
experiments. These are medians of 150 batch minima, from 30 alternating process
runs per revision, with five batches of 200 samples per entry point. Both
revisions use the unchanged upstream benchmark and produce `0xF376152A`.

Both binaries were built from the actual upstream revisions in the existing
checkout, without the local fork's changes: Apple M2 Max, native ARM64,
Apple Clang 17.0.0 / Xcode 26.3, maintained `build-xcode/`, Release
`-O3 -DNDEBUG`, no LTO or sanitizers. The upstream-only local branch
`benchmark-upstream-carry` points at the commit. The original `master` tip
`1baa8eb10ccf516b31403062afa9b63028a13f71` was restored, and its `bench1` and
`dingusppc` targets rebuilt. No worktree or emulator source patch was used.

The build script explicitly regenerates CMake's Xcode project after each branch
switch because the fork and upstream contain different source filenames.
Allowing Xcode's automatic regeneration to happen during the build initially
left stale file lists; explicit regeneration resolved this.

## Correctness review

The new helper extracts bit 32 of the full sum and places it into host bit 29,
XER.CA. Its mask preserves every other XER bit. All widened sums are unsigned
and at most 33 bits, so the newly introduced arithmetic cannot overflow a
64-bit unsigned value or introduce signed-overflow undefined behavior.

The immediate operands are deliberately converted to `uint32_t` before the
wide addition. Negative immediates therefore participate as their 32-bit
two's-complement bit patterns. Likewise, complements are bounded to 32 bits
before widening, and the minus-one operands are explicitly `uint32_t(-1)`.
Those details make the subtraction and minus-one forms equivalent to the
architectural word arithmetic. The instruction definitions in the
[PowerPC Programming Environments manual](https://www.nxp.com/docs/en/user-guide/MPCFPE.pdf)
agree with the reference formulas used here.

Low register results are unchanged. The existing overflow and CR-recording
code is unchanged, and executes after carry is updated, as before. Ordinary
`add` and `subf` variants without carry compile back to `i32.add` and `i32.sub`:
the source-level widening does not survive optimization in those variants.

The actual `ppcopcodes.cpp` from each full upstream source archive was compiled
with an independent handler runner. For each revision, each engine, and each
LTO setting, **549,208 reference cases** passed. Coverage includes:

- 43 instruction/flag variants, including ordinary non-carry add/subtract.
- Independent BigInt references for results, carry, signed overflow, sticky
  SO, and CR0, including preservation of unrelated XER and CR bits.
- Boundary and random operands, both carry inputs, and every initial SO/OV
  combination in the boundary matrix.
- Destination/source aliasing, use of r0, and verification that unrelated GPRs
  remain unchanged in the boundary matrix.
- All 65,536 immediate encodings for `addic`, `addic.`, and `subfic`, in addition
  to boundary and random immediate tests.

## Wasm performance concern

These are **isolated handler costs**, not whole-emulator or boot timings.
The actual handlers run through indirect calls inside Wasm; JS only enters at
the outer loop. Each family gets a fresh before/after module pair, followed by
eight one-million-call warmup loops and twelve alternating five-million-call
trials per operand pattern. Performance tests use the non-recording,
non-overflow variants. The complete flag variants are covered by correctness
tests. Every timed before/after hash matched.

The table uses **Emscripten 6.0.11, `-O3 -flto -DNDEBUG`**, matching the
configured Emscripten build's use of LTO. Engines run natively on the M2 Max:
Node 25.2.1 / V8 and the macOS 15.7.9 JavaScriptCore shell. A positive percentage
means the updated handler takes more time.

| Handler and operands | V8 time change | JavaScriptCore time change |
| --- | ---: | ---: |
| `adde`, random | −57.9% | −49.6% |
| `adde`, predictable | +12.6% | +16.9% |
| `subfme`, random | +4.1% | +32.1% |
| `subfme`, predictable | +20.8% | +36.2% |
| `subfze`, random | +2.0% | +10.2% |
| `subfze`, predictable | +9.6% | +9.8% |

Without LTO, the same effects appear: predictable `adde` costs +11.3% / +13.9%,
`subfme` +26.2% / +35.4%, and `subfze` +7.6% / +8.4%, in V8 / JavaScriptCore.
Small changes in the other families should not be overinterpreted. The full
matrix and trial values are in the JSON/CSV files.

The `subfme` change is the clearest follow-up candidate. Previously, its carry
output could be set from the special case independently of the arithmetic
result. LLVM simplifies that to preserving CA when rA is all ones, and setting
CA otherwise. The new implementation calculates two 64-bit additions and
extracts carry from that sum. It introduces more work and couples the CA
update to the sum's dependency chain. The old and new optimized LLVM functions
are in `before-selected.ll` and `after-selected.ll`. `subfze` similarly replaces
a cheap 32-bit result-zero test with wide arithmetic and carry extraction.

For a performance follow-up, retaining specialized carry formulas for
`subfme`/`subfze`, or expressing their equivalent 32-bit boolean carry rules,
would be worth testing. These formulas are mathematically correct already;
the concern is their generated code. A global Wasm slowdown cannot be inferred
from these per-handler percentages without instruction frequencies in an
actual workload. The previous OS X boot estimate covered only `adde`, whereas
this upstream commit changes ten arithmetic families. No boot was repeated.

Wasm supports internal 64-bit integer operations even with 32-bit memory
addresses; the emitted modules contain `i64.add` and `i64.shr_u`. This follows
the [Wasm instruction model](https://webassembly.github.io/spec/core/syntax/instructions.html).
JS BigInt integration concerns values crossing the JS/Wasm boundary, as
described in [Emscripten's documentation](https://emscripten.org/docs/compiling/WebAssembly.html),
and is not needed inside the timed loop.

## Evidence and reproduction

`summary.json` and `batches.csv` aggregate the native comparison; the 60 native
console logs contain the raw results. `manifest.json` records revisions,
original branch/tip, toolchains, and module hashes. ARM64 disassemblies and
selected optimized LLVM functions show the generated arithmetic.

`wasm-node.json`, `wasm-jsc.json`, and `wasm-summary.csv` contain the non-LTO
fresh-module measurements. `lto/` contains the corresponding LTO modules,
measurements, and scripts. `initial-sweep/` retains the first non-LTO sweep
which reused modules across families; fresh module pairs were then used to
avoid cross-family JIT feedback history. Compilation and other task work did
not run concurrently with the measured passes.

For native reproduction with an existing Xcode build configured to build
benchmarks:

```sh
export DPPC_REPO=/path/to/dingusppc
export CARRY_REVIEW_RESULTS=/tmp/upstream-carry-new
git -C "$DPPC_REPO" fetch upstream
python3 build_native.py
CARRY_RESULTS="$CARRY_REVIEW_RESULTS" python3 measure_native.py --runs 30
```

The builder checks for tracked changes, captures the starting branch/tip,
builds both revisions, then restores that branch and rebuilds its native
targets in a `finally` block. It creates/reuses `benchmark-upstream-carry`
only when it points to the specified upstream commit.

The included Wasm modules can be checked and measured directly:

```sh
node measure_wasm.mjs
# Run the JSC script from this directory, then repeat from lto/ for LTO:
/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Helpers/jsc \
  measure_wasm_jsc.js
```

For recompilation, export each entire DPPC revision using `git archive` into
`/tmp/before-src` and `/tmp/after-src` in an Emscripten 6.0.11 environment,
copy `handler_runner.cpp` to `/tmp/handler_runner.cpp`, then run
`build_wasm.sh` or `build_wasm_lto.sh`. The scripts retain the exact flags
used for the experiment; explicit `WASM_BIGINT` is deprecated in this SDK and
prints a warning because it is now the default. Move the resulting modules
beside the corresponding measurement scripts. This does not use or alter the
emulator's configured `build/` directory.
