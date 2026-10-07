# Measurements: Apple M2 Max, October 6, 2026

Host: Apple M2 Max, 64 GiB RAM; native arm64; macOS 15.7.9 (24G830).
Compiler: Apple Clang 17.0.0 (`clang-1700.6.4.2`), Xcode 26.3 (17C529).
Builds: Release, `-O3 -DNDEBUG`; no LTO or sanitizer runtime. The binaries
were checked for sanitizer symbols and were all native arm64 Mach-O executables.
Build commands, pinned revisions, and remaining compiler-flag differences are
in [the benchmark README](../../README.md).

Ten process invocations per mode were executed sequentially, rotating order
across Dolphin cached, DingusPPC, PearPC, and Dolphin plain interpreter.
Each invocation warms the CPU once, then reports five minima, each over 200
executions of the 32 KiB checksum. DingusPPC does this for both of its run entry
points. Values below are the median of the resulting 50 batch minima per mode.
They measure warm-cache throughput, not cold translation cost or typical frame
time. Clock overhead was zero at the host clock's observed resolution.

| Core / entry point | Median batch minimum | Throughput | Range of batch minima |
| --- | ---: | ---: | ---: |
| DingusPPC `ppc_exec` | 80.395 µs | 388.70 MiB/s | 80.208–82.875 µs |
| DingusPPC `ppc_exec_until` | 82.354 µs | 379.46 MiB/s | 80.125–82.833 µs |
| PearPC generic interpreter | 73.083 µs | 427.60 MiB/s | 71.083–73.583 µs |
| Dolphin Cached Interpreter | 98.334 µs | 317.79 MiB/s | 97.833–106.125 µs |
| Dolphin plain interpreter | 321.688 µs | 97.14 MiB/s | 319.250–329.875 µs |

Dolphin cached takes **22.3% more time than DingusPPC's `ppc_exec`** on this
benchmark (18.2% lower throughput). PearPC takes 9.1% less time than DingusPPC
(10.0% higher throughput). Within Dolphin, cached is **3.27× faster** than
its plain interpreter.

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

Files: `batches.csv` contains every reported batch minimum; `summary.json`
contains the aggregation and command paths; the 40 `.log` files preserve complete
stdout/stderr. Initialization and printing are outside each sample. No CPU
frequency or affinity was forced, and the original minimum-sample method is
retained. Repeat on your own hardware before generalizing these results.
