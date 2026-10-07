# Reusing the wide carry sum in DingusPPC's checksum

Computing the 64-bit sum once and using its low 32 bits for the register result
removes two ARM64 instructions, but produced no additional measurable checksum
improvement over the previous wide-carry patch in this experiment.

| Native Release variant | `ppc_exec` | `ppc_exec_until` |
| --- | ---: | ---: |
| Original handler | 80.291 µs | 80.416 µs |
| Wide carry, separate 32-bit register-result calculation | 58.625 µs | 58.750 µs |
| Wide carry, register result taken from the same sum | 58.625 µs | 58.709 µs |

Values are medians of 150 batch minima per entry point, collected in 30 rotated
process runs per variant. Each process runs the unchanged DingusPPC harness:
five batches of 200 samples for each entry point. All runs reported the same
`0xF376152A` checksum, with no mismatch reports. Both wide variants reduce the
primary benchmark time by 26.98% relative to the matched original handler.

The tested change is:

```cpp
uint32_t xer_ca = !!(ppc_state.spr[SPR::XER] & XER::CA);
uint64_t sum = uint64_t(ppc_result_a) + ppc_result_b + xer_ca;
uint32_t ppc_result_d = uint32_t(sum);

ppc_state.spr[SPR::XER] = (ppc_state.spr[SPR::XER] & ~XER::CA) |
                         (uint32_t(sum >> 32) * XER::CA);
```

CR recording, overflow handling, and register storage are unchanged. The
wide sum's low bits give the same wrapping 32-bit result, and bit 32 gives the
same carry for two 32-bit inputs plus a carry input of zero or one.

The ARM64 disassemblies show that the hot `ppc_adde<RC0,OV0>` handler shrinks
from 21 instructions in the previous wide patch to 19 in the shared-sum patch.
The separate two-instruction 32-bit addition chain disappears; the result is
stored directly from the low half of the 64-bit sum register. The two 64-bit
adds needed for `a + b + carry` remain. Fewer instructions do not necessarily
shorten the critical dependency chain: both versions still load the same
state, calculate carry, and store the same architectural results. The lack of
a timing gain suggests the extra 32-bit additions were not the bottleneck;
this is an inference from the timings and assembly, not a hardware-counter
attribution.

Host and build settings match the previous experiment: Apple M2 Max, native
ARM64, Apple Clang 17.0.0 / Xcode 26.3, maintained `build-xcode/`, Release
`-O3 -DNDEBUG`, no LTO or sanitizers. DPPC revision is
`1baa8eb10ccf516b31403062afa9b63028a13f71`. The guest benchmark and its sample
counts were not modified. No OS X boot was repeated. All temporary CPU source
changes were restored, and both native `bench1` and `dingusppc` targets rebuilt.

## Evidence and reproduction

`summary.json` records the aggregation and measured binary hashes;
`batches.csv` records every batch minimum. The adjacent console logs and
`*-adde.s` files provide the raw output and disassembly. `preliminary/` retains
the shorter ten-run exploratory pass, whose optimized timings were noisier.
Disassembly extraction overlapped the beginning of that exploratory pass;
the reported thirty-run pass ran after extraction completed, without other
task work running concurrently.

`wide.patch` and `shared.patch` each apply independently to the original DPPC
source. To rebuild all three variants and repeat the comparison:

```sh
export DPPC_REPO=/path/to/dingusppc
export CARRY_RESULTS=/tmp/dppc-carry-sum-new
python3 build_variants.py
python3 measure.py --runs 30
```

Use a fresh result directory and an existing native Xcode build configuration.
The builder temporarily edits `ppcopcodes.cpp`, captures each benchmark binary,
then restores the source in a `finally` block and rebuilds both original
targets. It preserves the source file's CRLF line endings.
