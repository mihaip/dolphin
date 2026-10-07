#!/usr/bin/env bash
set -euo pipefail
source /emsdk/emsdk_env.sh >/dev/null 2>&1
for variant in before after; do
    src=/tmp/$variant-src
    em++ "$src/cpu/ppc/ppcopcodes.cpp" /tmp/handler_runner.cpp \
        -I"$src" -I"$src/thirdparty/loguru" -std=gnu++20 -O3 -flto -DNDEBUG -DLOGURU_STACKTRACES=0 \
        -sSTANDALONE_WASM -sWASM_BIGINT -sEXPORTED_FUNCTIONS='["_run","_check","_get_cr","_get_gpr"]' \
        --no-entry -o /tmp/$variant-handlers-lto.wasm
    /emsdk/upstream/bin/wasm-dis /tmp/$variant-handlers-lto.wasm -o /tmp/$variant-handlers-lto.wat
done
