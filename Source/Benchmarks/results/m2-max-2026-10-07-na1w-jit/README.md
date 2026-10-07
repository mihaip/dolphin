# Na1w DingusPPC JIT checksum benchmark

At fork revision `f59c271f852795a3b2d3cb5d0ed900b4d270fd0c` on
`jit-debugging`, the default JIT mode gives **no meaningful checksum speedup**.
It interprets almost the entire hot loop after a four-iteration self-loop
limit. A diagnostic build that lets the loop remain in the JIT dispatcher is
**57.5% slower** than its paired interpreter control on this machine.

## Main measurements

The fork has an **x86-64 backend only**, so these are x86-64 binaries running
under **Rosetta 2 on the Apple M2 Max**. Both modes in each comparison use the
same executable and compiler settings. Absolute times are not directly
comparable to the earlier native ARM64 Dolphin/DingusPPC/PearPC table.

| Variant | Interpreter | JIT mode | Median paired time change |
| --- | ---: | ---: | ---: |
| Fork's original JIT core | 154.938 µs | 155.105 µs | +0.16% |
| Diagnostic: relaxed self-loop guard, final telemetry omitted | 151.771 µs | 240.042 µs | +57.54% |

Times are medians of 150 batch minima. The percentage is the median of the
150 individual batch JIT/interpreter ratios, so it need not equal the ratio
of the two overall medians. Positive means slower.

There are 30 process runs per variant, rotating their order. Within each
process, interpreter and JIT samples alternate, with sample order reversed
between pairs; each mode gets five batches of 200 executions of the original
32 KiB guest checksum. The PPC instruction array, input generation, and size
are unchanged. Initialization, an interpreter reference run, JIT compilation
and execution warmup, clock-overhead measurement, CPU resets, and validation
are outside timed intervals. All **120,000 timed checksums** matched the
interpreter reference and the previously established result `0xF376152A`.
This verifies this benchmark, not general JIT correctness or OS compatibility.

Compiler: Apple Clang 17.0.0 / Xcode 26.3, GNU C++20, Release `-O3 -DNDEBUG`,
x86-64, macOS 15.7 deployment target, no LTO or sanitizers. Host: macOS 15.7.9.
SDL2 comes from the installed universal framework. No build or other task work
ran concurrently with measured passes. `DPPC_*` diagnostic environment
variables are removed in child processes.

## What actually executes

The existing `bench1` neither selects JIT mode nor links the JIT object
library. The adaptation adds those links and sets `g_exec_mode = jit` for JIT
samples. `ppc_exec_until` remains interpreter-only in this fork, so the main
comparison uses `ppc_exec` for both modes. `benchmark.patch` shows every
benchmark/build adaptation; no emulator implementation changes are used in
the default result.

The fork's existing counters prove the mode is entered:

| Variant | Native-code blocks per checksum | Whole-interpreter handoffs per checksum |
| --- | ---: | ---: |
| Original JIT core | 9 | 1 |
| Relaxed self-loop diagnostic | 2,055 | 0 |

The original dispatcher limits consecutive self-loop executions to four via
`JIT_MAX_SELFLOOP_REDISPATCH`. The checksum's normal loop triggers that limit
and the dispatcher calls `ppc_exec_interpreter()` for the remainder. Every
measured default-mode process reports 9,000 blocks and 1,000 handoffs; the
diagnostic reports 2,055,000 blocks and zero handoffs. Thus the default result
mostly measures interpreter execution preceded by a little JIT work.

The diagnostic makes exactly two emulator-source changes (`diagnostic.patch`):
raise the limit from 4 to 1,000,000, and omit the unconditional
`t057_dump("final")` at the end of every checksum. That final dump otherwise
prints several lines inside the timed call. Other safety checks, state
fingerprinting, translation choices, and dispatcher behavior remain intact.
This is a benchmark diagnostic, not a proposed emulator fix.

Several existing design choices explain why retaining JIT dispatch is still
expensive:

- **`adde` is unsupported by inline translation.** The checksum's central
  carry additions call the interpreter fallback, which also updates the PC
  and checks execution flags. This is not a loop reduced to host add/adc.
- **Loads call `jit_mem_read`.** There is no direct fastmem path here; each
  load returns through a C++ helper using the normal MMU.
- **Blocks return to the dispatcher.** Static exit metadata explicitly says
  chaining is a later task. Each loop iteration repeats dispatch/cache work
  and the host function prologue/epilogue.
- **Every block hashes CPU state.** `jit_state_fingerprint()` walks all 32
  GPRs and several other registers to detect lack of progress. This is a
  substantial cost for a short arithmetic loop.

These observations come from the exact fork sources, especially
[`jit.cpp`](https://github.com/Na1w/dingusppc/blob/f59c271f852795a3b2d3cb5d0ed900b4d270fd0c/cpu/ppc/jit/jit.cpp),
[`jit_translate.cpp`](https://github.com/Na1w/dingusppc/blob/f59c271f852795a3b2d3cb5d0ed900b4d270fd0c/cpu/ppc/jit/jit_translate.cpp),
and
[`jit_backend_x64.cpp`](https://github.com/Na1w/dingusppc/blob/f59c271f852795a3b2d3cb5d0ed900b4d270fd0c/cpu/ppc/jit/jit_backend_x64.cpp).
No profiler attribution or individual percentage contribution is claimed.
Rosetta can influence helper/dispatch costs; a physical x86-64 run is needed
to establish native x86-64 performance. This branch also predates the upstream
carry optimization measured in the preceding experiment.

## Reproduction and evidence

`paired/` contains the primary raw logs, CSV batch pairs, summary, and counters.
`manifest.json` pins the revision, settings, and executable hashes.
`preliminary-default/` and `preliminary-three-modes/` retain earlier comparisons
that alternated separate process runs. Their small default-mode differences
changed sign, and interpreter-only `ppc_exec_until` controls also varied.
That motivated the paired within-process protocol above. The full-loop
slowdown appeared in both protocols.

The exact adapted `bench1.cpp` and a source-checking applicator are included.
For an ordinary clone of the fork (no Git worktree needed), initialize its
submodules, check out the pinned revision above, then run:

```sh
python3 /path/to/results/apply_benchmark.py /path/to/dingusppc
cd /path/to/dingusppc
cmake -S . -B build-xcode -G Xcode \
  -DCMAKE_C_COMPILER="$(xcrun -f clang)" \
  -DCMAKE_CXX_COMPILER="$(xcrun -f clang++)" \
  -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_OSX_DEPLOYMENT_TARGET=15.7 \
  -DDPPC_BUILD_BENCHMARKS=ON -DDPPC_ENABLE_JIT=ON \
  -DSDL2_DIR=/Library/Frameworks/SDL2.framework/Resources/CMake \
  -DSDL2_INCLUDE_DIRS=/Library/Frameworks/SDL2.framework/Headers
cmake --build build-xcode --config Release --target bench1 --parallel 8
cp build-xcode/bin/Release/bench1 /tmp/bench1-default
python3 /path/to/results/apply_benchmark.py . --diagnostic
cmake --build build-xcode --config Release --target bench1 --parallel 8
cp build-xcode/bin/Release/bench1 /tmp/bench1-diagnostic
python3 /path/to/results/run_paired.py \
  --binary /tmp/bench1-default --diagnostic-binary /tmp/bench1-diagnostic \
  --runs 30 --output /tmp/na1w-jit-results
```

The applicator also accepts a source export and preserves CMake's original
CRLF line endings. Running it without `--diagnostic` restores the original
JIT core. Adapt the SDL2 path for other hosts; physical x86-64 hosts do not
require Rosetta. The scripts set `DYLD_FRAMEWORK_PATH` for this macOS framework.

Locally, all work used a `git archive` source export in
`/tmp/dppc-na1w-jit-20261007/source`, with pinned Cubeb submodules exported too.
The main DingusPPC checkout stayed on its original `master`, with its sources
and build directories untouched. Local branch `benchmark-na1w-jit` pins the
fork revision without switching the checkout. No worktree was created.
