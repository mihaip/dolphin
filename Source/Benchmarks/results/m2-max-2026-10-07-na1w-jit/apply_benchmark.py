#!/usr/bin/env python3
"""Apply the benchmark adaptation and select the original or diagnostic JIT core.

Only accepts the pinned fork's original sources or this exact adaptation.
"""
from pathlib import Path
import argparse,hashlib
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('repo',type=Path)
p.add_argument('--diagnostic',action='store_true')
a=p.parse_args()
assets=Path(__file__).resolve().parent
benchmark=a.repo/'benchmark/bench1.cpp'
adapted=(assets/'bench1.cpp').read_bytes()
current=benchmark.read_bytes()
assert hashlib.sha256(current).hexdigest() == '4f0a86cc1760bf5c6f13d0d7d707c33655e44fd49752c38b0c9a78f0924a1056' or current == adapted, 'Unexpected benchmark changes'
cmake=a.repo/'CMakeLists.txt'
cmake_source=cmake.read_bytes()
old=b'add_executable(bench1 ${BENCH_SOURCES} $<TARGET_OBJECTS:core>'
new=b'add_executable(bench1 ${BENCH_SOURCES} ${JIT_OBJECTS} $<TARGET_OBJECTS:core>'
assert cmake_source.count(old)==1 or cmake_source.count(new)==1, 'Unexpected benchmark CMake definition'
core=a.repo/'cpu/ppc/jit/jit.cpp'
original=(assets/'jit-original.cpp').read_bytes()
diagnostic=original.replace(b'extern constexpr uint32_t JIT_MAX_SELFLOOP_REDISPATCH = 4;', b'extern constexpr uint32_t JIT_MAX_SELFLOOP_REDISPATCH = 1000000;')
diagnostic=diagnostic.replace(b'    t057_dump("final");', b'    // Benchmark diagnostic: omit the unconditional final telemetry dump.')
assert core.read_bytes() in (original,diagnostic), 'Unexpected JIT core changes'
benchmark.write_bytes(adapted)
cmake.write_bytes(cmake_source.replace(old,new))
core.write_bytes(diagnostic if a.diagnostic else original)
print('Applied benchmark; JIT core:', 'diagnostic' if a.diagnostic else 'original')
