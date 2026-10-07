# Measurements: Apple M2 Max, October 6, 2026

Host: Apple M2 Max, 64 GiB RAM; native arm64; macOS 15.7.9 (24G830).
Compiler: Apple Clang 17.0.0 (`clang-1700.6.4.2`), Xcode 26.3 (17C529).
Builds: Release, `-O3 -DNDEBUG`; no LTO or sanitizer runtime. The binaries
were checked for sanitizer symbols and were all native arm64 Mach-O executables.
Build commands, pinned revisions, and remaining compiler-flag differences are
in [the benchmark README](../../README.md).

Ten process invocations per mode were executed sequentially, rotating order
across Dolphin cached, DingusPPC, PearPC, Dolphin plain interpreter, and Dolphin
ARM64 JIT.
Each invocation warms the CPU once, then reports five minima, each over 200
executions of the 32 KiB checksum. DingusPPC does this for both of its run entry
points. Values below are the median of the resulting 50 batch minima per mode.
They measure warm-cache throughput, not cold translation cost or typical frame
time. Clock overhead was zero at the host clock's observed resolution.

| Core / entry point | Median batch minimum | Throughput | Range of batch minima |
| --- | ---: | ---: | ---: |
| DingusPPC `ppc_exec` | 80.334 µs | 389.00 MiB/s | 80.125–83.834 µs |
| DingusPPC `ppc_exec_until` | 80.291 µs | 389.21 MiB/s | 80.041–84.000 µs |
| PearPC generic interpreter | 71.084 µs | 439.62 MiB/s | 71.041–74.250 µs |
| Dolphin Cached Interpreter | 91.188 µs | 342.70 MiB/s | 90.875–119.000 µs |
| Dolphin plain interpreter | 313.771 µs | 99.60 MiB/s | 312.083–320.916 µs |
| Dolphin ARM64 JIT | 19.980 µs | 1564.10 MiB/s | 19.958–21.416 µs |

Dolphin cached takes **13.5% more time than DingusPPC's `ppc_exec`**
on this benchmark (11.9% lower throughput). PearPC takes 11.5% less time
than DingusPPC (13.0% higher throughput). Within Dolphin, cached is
**3.44× faster** than its plain interpreter.

Dolphin's **ARM64 JIT takes 19.980 µs**, making it **4.02× faster than
DingusPPC**, **4.56× faster than Dolphin cached**, and 3.56× faster than PearPC.
The logs confirm `JITARM64`, fastmem enabled, block linking enabled, and JIT
extra MMU/watchpoint checks off (`memcheck=0`). These are normal default JIT
settings for the physical-addressed, watchpoint-free benchmark. The warmup
compiles its native blocks outside the measured samples.

The table is a fresh matched run of all cores after adding JIT selection to the
harness. No emulator CPU implementation changed. Dolphin cached measured
91.188 µs here versus 98.334 µs in the original run; binary layout and run
conditions can shift these small-loop results. Use the matched table for ratios.
The original measurements and the separate diagnostic analysis remain saved.

All runs completed successfully with identical printed input bytes and checksum
`0xF376152A`. Dolphin independently verifies the checksum and absence of CPU
exceptions after every sample. The 49 checksum opcodes were compared against
both original ports and match exactly; only the termination sentinel differs.
There were no guest crashes or bounded/terminated runs in the recorded data.

This result does **not** support predicting a speedup for DingusPPC from the
label "cached interpreter" alone. Dolphin greatly improves over its own plain
interpreter, but its complete cached CPU and memory paths are slower here than
DingusPPC's existing interpreter. The difference cannot be attributed solely to
decode/dispatch strategy: memory access helpers, register representation,
timing, and stop conventions differ too. Neither a hard performance ceiling
nor real Mac OS application performance can be inferred from one tiny,
physical-addressed, warm-cache, integer/load loop.

The [September 2024 Dolphin progress report](https://dolphin-emu.org/blog/2024/09/04/dolphin-progress-report-release-2407-2409/)
covers Cached Interpreter 2.0. This measurement uses the implementation from
October 2026 upstream, including its subsequent changes, rather than the exact
2024 version.

Files: [jit-comparison/](jit-comparison/) contains every reported batch minimum
in `batches.csv`, the aggregation and command paths in `summary.json`, and
complete stdout/stderr in 50 `.log` files. The original comparison without JIT
remains in the adjacent CSV, JSON, and 40 log files. Initialization and printing are outside each sample. No CPU
frequency or affinity was forced, and the original minimum-sample method is
retained. Repeat on your own hardware before generalizing these results.

## Why Dolphin is slower: follow-up investigation

The loop is a good fit for cached interpretation. Its cache is working: the
block dump shows a nine-instruction hot block at `0x70`, executed 2,047 times
per checksum. That block contains four loads, four add-with-carry instructions,
and one counter branch. The complete checksum executes 18,447 guest
instructions, including 8,192 loads and 8,192 add-with-carry operations. Only
nine distinct decoded blocks are needed. There is no recurring translation,
cache clearing, guest exception, or instruction-page walk in the timed loop.

The comparison measures more than opcode dispatch. Dolphin caches the handler
address and original opcode, then calls its general interpreter handler. That
handler still extracts register operands and instruction flags every time.
DingusPPC already selects a handler with a single flat-table lookup
`((opcode >> 15) & 0x1F800) | (opcode & 0x7FF)`, and specializes record/overflow
flags with templates. Dolphin is removing an already cheap operation while
retaining more expensive instruction and memory work.

A five-second, one-millisecond `sample` profile of an extended cached benchmark
collected 3,878 main-thread samples. Approximate exclusive residency:

| Area | Main-thread samples |
| --- | ---: |
| Add-with-carry handler | 33.3% |
| General MMU read path, excluding watchpoints | 18.9% |
| Watchpoint check (`Memcheck`) | 10.0% |
| Load instruction handlers | 10.2% |
| Cached command loop itself | 10.8% |
| Guest performance-monitor update | 6.9% |
| Branch handler | 4.4% |
| Block-cache lookup | 3.0% |
| End-block callback | 2.5% |

These are statistical CPU samples, not hardware branch-miss counters or exact
cycle attribution. Sampling used a harness with 100,000 samples per batch and
two batches to keep the CPU running; its operand/block dump code also changed
binary layout. Timed variants below instead use the original unchanged
benchmark harness, with all builds completed before measurements.

### Controlled changes

Every variant changes only one Dolphin component, leaves the guest checksum
code unchanged, and is compared in ten rotated runs, five batches of 200 samples
per run. All checksums match. The baseline is freshly rebuilt with the original
harness; its 99.312 µs is consistent with the earlier 98.334 µs result.

| Dolphin cached variant | Median batch minimum | Time reduction |
| --- | ---: | ---: |
| Unmodified CPU | 99.312 µs | — |
| Branchless 64-bit carry calculation | 67.292 µs | 32.2% |
| Omit read-side watchpoint call | 81.875 µs | 17.6% |
| Direct RAM reads in `lwz`/`lwzu` | 71.916 µs | 27.6% |
| Omit guest performance-monitor update | 93.750 µs | 5.6% |
| Tiny fixed-address block-cache lookup | 96.333 µs | 3.0% |

Effects are not additive. Changes can interact and shift code layout. The
extended profiling harness alone shifted the cached result by about 5%, so
small differences should not be treated as exact cost decomposition. The final
table avoids mixing that harness with the original one. The large carry and
memory effects persist in both configurations.

**Carry arithmetic:** Dolphin's `addex` uses short-circuit carry tests:

```cpp
Helper_Carry(a, b) || (carry != 0 && Helper_Carry(a + b, carry))
```

Apple Clang emits data-dependent `b.lo` and `cbz` branches for these tests. The
input is random: the first carry predicate is true for 4,103 of the 8,192
additions, with 5,480 changes between adjacent outcomes. Replacing the carry
expression with `(u64{a} + u64{b} + carry) >> 32` yields additions and a shift
without data-dependent branches. Record and overflow handling remain intact.
This transformation is equivalent for 32-bit operands and a carry input of
zero or one. The speedup is measured; branch misprediction as the explanation
is an inference from the emitted assembly and input pattern, not a PMU reading.

DingusPPC also has data-dependent carry branches. As a control, applying the
same wide-add technique improves its `ppc_exec` from **80.209 to 58.562 µs**.
Thus optimizing only Dolphin beats unchanged DingusPPC, but applying the
optimization to both leaves Dolphin about 15% slower. The carry behavior is a
shared bottleneck, not an inherent disadvantage of cached interpretation.

**Loads and watchpoints:** With physical addressing and guest caches disabled,
Dolphin still calls its general MMU read routine. It checks page boundaries,
translation mode, memory-region/cache behavior, calls `Memcheck` despite the
empty watchpoint list, and checks load exceptions. No actual page-table walk
is being charged here. DingusPPC's primary TLB caches the host address offset,
so a hit goes directly to the host load and endian swap. Omitting Dolphin's
watchpoint call alone removes most of the gap to unchanged DingusPPC. The
RAM-only experiment measures the broader cost of the general load path.

**Block overhead:** The hot block ends at every counter branch. Dolphin
updates PC/downcount, calls `UpdatePerformanceMonitor` even when the guest
performance counters are disabled, then redispatches the next block. Cached
block linking is explicitly disabled (`jo.enableBlocklink = false`). This is
measurable, but the tiny-cache experiment indicates lookup alone is a smaller
cost. The command stream uses 32 bytes per interpreted instruction; the hot
block occupies 312 bytes for 36 bytes of guest code. Both fit in host cache, so
this is extra dispatch/load work, not evidence of a capacity-cache problem.

The HLE stop hook executes once per checksum, whereas loads/adds execute 8,192
times. The profile contains essentially no stop-hook or CoreTiming residency.
The large gains from changing inner handlers while leaving the stop path
untouched also argue against benchmark start/stop conventions causing the gap.

For a DingusPPC cached interpreter, the promising direction is to preserve its
cheap memory fast path and specialize decoded operands/instruction flags, elide
unnecessary checks and PC writes, and reduce repeated block-exit work. Merely
putting existing general handlers into a decoded command stream does not
capture all of those benefits. This loop exposes the handler costs precisely
because caching has already removed repeated fetch/decode.

### Evidence and reproduction

The [analysis directory](analysis/) contains the matched timings, all 80 run
logs, CPU sample report, decoded block dump, assembly, and one-change diagnostic
patches. These patches are experiments, **not general emulator fixes**: the
RAM-only path bypasses required hardware semantics, the tiny cache assumes
immutable code and mode, and the omitted hooks cannot be removed when enabled.
All emulator source changes were restored and both benchmark targets rebuilt.

In a fresh checkout configured with the build commands above:

```sh
python3 Source/Benchmarks/results/m2-max-2026-10-06/analysis/build_variants.py \
  --repo "$PWD" --output /tmp/dolphin-analysis-build
python3 Source/Benchmarks/results/m2-max-2026-10-06/analysis/compare_variants.py \
  --binaries /tmp/dolphin-analysis-build \
  stock-baseline stock-carry64 stock-no-memcheck stock-direct-ram \
  stock-no-pmu stock-tiny-cache
```

The builder changes sources sequentially to create each binary, restores them
in a `finally` block, and rebuilds the original target. Run it in a fresh
configured checkout. For an individual experiment, the adjacent `.patch`
files show the exact modification. The adjacent `dingus-carry64.patch` records the equivalent DingusPPC control:
a 64-bit sum with bit 32 packed back into XER.CA. Its guest code and other flag
handling are unchanged; apply it to the pinned DingusPPC revision and rebuild
the native `bench1` target.

### Native Mac OS X boot control

The [Mac OS X 10.1.5 boot experiment](native-boot-10.1/) tests that DingusPPC
carry patch against a full Beige G3 boot. Six paired runs showed no detectable
improvement: baseline and optimized mean times were 41.597 s and 41.677 s.
Only 0.0215% of the boot's guest instructions were `adde`, compared with 44.4%
in this checksum; extrapolating the checksum saving gives about 5 ms per boot.
The linked results include raw logs, exact input hashes, counter instrumentation,
identical desktop captures, and scripts for reproduction.
