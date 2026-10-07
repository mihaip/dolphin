/*
DingusPPC - The Experimental PowerPC Macintosh emulator
Copyright (C) 2018-26 The DingusPPC Development Team
          (See CREDITS.MD for more details)

(You may also contact divingkxt or powermax2286 on Discord)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

/** @file Experimental PowerPC JIT implementation.

    This translation unit owns the process-wide block cache, the runtime
    dispatcher (ppc_jit_exec) and the per-instruction fallback path
    (jit_fallback_step).

    ppc_jit_exec() is a real dispatcher loop rather than a shim: it looks the
    block starting at the current guest PC up in the block cache, translates it
    on a miss via jit_translate_block(), and executes the emitted native code
    with reinterpret_cast<void (*)()>(blk->code)(). After each block it performs
    g_icycles cycle accounting, calls ppc_process_events() when the cycle budget
    is exhausted or a timer fires, and services the exec_flags raised by the
    block (SLEEP, RFI, OPC_DECODER, EXCEPTION and endian switch).

    The loop is deliberately conservative: on translation failure, or when a
    block makes no forward progress (the guest PC is unchanged), it hands
    control back to ppc_exec_interpreter(), which shares the same global CPU
    state. Exceptions are never handed back this way. A recoverable exception
    (EXT_INT/DECR), which ppc_exception_handler() raises *without* longjmp'ing,
    is serviced in-loop by applying ppc_next_instruction_address to the PC and
    clearing exec_flags, exactly as ppc_exec_inner() does; a bare return here
    would instead unwind into the debugger's "go" handler and re-enter the
    prompt rather than continuing the guest. Instructions the translator cannot
    handle are emitted as fallback stubs that call jit_fallback_step(), which
    runs the single instruction through the interpreter and advances the PC
    exactly as ppc_exec_inner() would.
*/

#include <cstdio>
#include <cstdlib>
#include <csignal>
#include <ctime>
#include "jit.h"
#include "jit_backend_x64.h"
#include "jit_translate.h"

#include "../ppcemu.h"
#include "../ppcmmu.h"

// Architectural-state trace (DPPC_JIT_STATE_TRACE): the shared emitter lives in
// cpu/ppc/ppcexec.cpp (ppc_state_trace_emit) so the JIT fallback path and the
// interpreter loop write to the same file and produce directly diffable
// per-instruction traces. Declared here rather than in ppcemu.h to keep the
// diagnostic self-contained.
extern void ppc_state_trace_emit(void);

// TEMP t-054: guest-PC histogram hook (defined in cpu/ppc/ppcexec.cpp).
extern "C" void ppc_pc_hist_sample(uint32_t pc);

/** Number of consecutive re-dispatches of the *same* block with an
    *unchanged* architectural state before the dispatcher gives up and hands
    control to the interpreter.

    A block whose exit is a taken back-edge to its own start is perfectly
    legitimate (e.g. the cache-flush loop at guest 0x0040961C): the PC returns
    to the block start but the guest loop counter advances, so the block makes
    real forward progress. Only a block that leaves *every* observable piece of
    architectural state unchanged across many consecutive re-dispatches is
    genuinely stuck (e.g. its only exit is a dispatch) and must not be allowed
    to spin in native code forever. */
static constexpr uint32_t JIT_MAX_STUCK_REDISPATCH = 64;

/** Number of consecutive re-dispatches of the *same* self-looping block (one
    that branched back to its own guest_start) before the dispatcher hands
    control to the interpreter.

    A taken back-edge to the block's own start is legitimate -- the guest loop
    counter advances -- but it can also be a genuine livelock whose
    architectural fingerprint keeps changing, so the stuck guard above never
    fires (e.g. the cache-flush loop at guest 0x0040961C). The bound is
    deliberately small: after a few native iterations the interpreter takes
    over and lets the guest make progress. Exposed (external linkage) so the
    regression test can assert the bound. */
extern constexpr uint32_t JIT_MAX_SELFLOOP_REDISPATCH = 4;

/** Count of times ppc_jit_exec() bailed out to the interpreter because a block
    was judged to be making no forward progress: either its architectural
    fingerprint was unchanged across re-dispatches, or it re-dispatched its own
    guest_start more than JIT_MAX_SELFLOOP_REDISPATCH times in a row. Exposed
    for the regression test (testjit_selfloop.cpp), which asserts that a
    self-looping block is bounded by this hand-off instead of livelocking. */
uint64_t g_jit_noprogress_bails = 0;

/** Count of native blocks executed by the dispatcher. Exposed for the
    regression test (testjit_selfloop.cpp): a self-looping block runs natively
    for at most JIT_MAX_SELFLOOP_REDISPATCH iterations before the dispatcher
    hands off to the interpreter, so this stays small and bounded. */
uint64_t g_jit_native_blocks = 0;

/** Cheap fingerprint of the observable architectural state a guest block can
    change. Two consecutive re-dispatches of the same block with equal
    fingerprints mean the block is not making progress; a GPR/CR/SPR/... update
    (as a self-looping counter performs) changes the fingerprint and resets the
    stuck counter. FNV-1a over the relevant fields. */
static uint64_t jit_state_fingerprint() {
    uint64_t h = 0xCBF29CE484222325ull;
    auto mix = [&h](uint32_t v) {
        h ^= v;
        h *= 0x100000001B3ull;
    };
    for (int i = 0; i < 32; i++) {
        mix(ppc_state.gpr[i]);
    }
    mix(ppc_state.cr);
    mix(ppc_state.fpscr);
    mix(ppc_state.spr[SPR::LR]);
    mix(ppc_state.spr[SPR::CTR]);
    mix(ppc_state.spr[SPR::XER]);
    mix(ppc_state.msr);
    mix(ppc_state.reserve ? 1u : 0u);
#if SUPPORTS_PPC_LITTLE_ENDIAN_MODE
    mix(ppc_state.is_LE ? 1u : 0u);
#endif
    return h;
}

/** Translation-context signature.

    A translated block's *instructions* are read from guest memory through the
    MMU at translation time (jit_default_fetch -> mmu_translate_imem), and the
    emitted code embeds only guest PCs plus calls into the runtime helpers
    (jit_mem_read / jit_mem_write), which re-resolve the *data* mapping on every
    access. A cached block therefore stays valid as long as the *instruction*
    address-translation context is unchanged: the MSR bits that select the
    ITLB table (IR, PR -- the inputs mmu_change_mode() uses for the ITLB) and
    the endianness (which selects how instruction words are decoded).

    MSR[DR] is deliberately NOT part of the context. Data accesses are not
    baked in at translation time: every load/store is emitted as a call to
    jit_mem_read()/jit_mem_write() (jit.cpp:873/:904), which re-resolve the data
    mapping through mmu_read_vmem()/mmu_write_vmem() on every access using the
    *current* MSR -- the DTLB table is selected by mmu_change_mode() from the
    live MSR[DR,PR]. A block translated with DR set therefore runs correctly
    with DR clear and vice versa, so keying on DR only minted spurious
    contexts (the ROM's DSI handler toggles MSR[DR] with mtmsr around every
    emulated instruction) without ever changing what the block *does*.

    The block cache is keyed by guest PC *only* (see make_key() in
    jit_blockcache.h), so a block is never duplicated per context and
    old-context blocks cannot accumulate. Correctness is preserved by
    ppc_jit_exec(): it computes this context once per dispatch iteration and,
    whenever the context differs from the previous iteration's, drops the whole
    cache (jit_invalidate_all()) *before* any lookup. A block therefore can
    never be executed under an MSR mode whose semantics differ from the one it
    was translated under -- any context change flushes every block translated
    under the old context first. Because DR is not part of the context, a
    DSI/RFI round trip that only toggles MSR[DR] does not change the context and
    does not flush. */
uint32_t jit_translate_context() {
    uint32_t ctx = ppc_state.msr & static_cast<uint32_t>(MSR::IR | MSR::PR);
#if SUPPORTS_PPC_LITTLE_ENDIAN_MODE
    ctx |= ppc_state.is_LE ? static_cast<uint32_t>(MSR::LE) : 0u;
#endif
    return ctx;
}

/** The one and only block cache for this process. */
JitBlockCache& jit_block_cache() {
    static JitBlockCache cache;
    return cache;
}

void jit_init() {
    // Nothing to allocate eagerly; the cache lazily creates blocks. Reset it
    // so a restart starts from a clean slate.
    jit_block_cache().invalidate_all();
}

void jit_shutdown() {
    jit_block_cache().invalidate_all();
}

void jit_invalidate_page(uint32_t page) {
    jit_block_cache().invalidate_page(page);
}

/** Pending-invalidation state for self-modifying code.

    A guest store may target a page that contains the block currently running.
    The emitted native code lives in the shared JitCodeArena, so removing that
    block (jit_invalidate_page) while it is still executing would free or
    overwrite the code under our feet. The store helper therefore only records
    the affected page(s) here; the dispatcher drains the record once the native
    block has returned.

    A small fixed-size set keeps the store fast path cheap (a short linear scan
    plus one append) while never invalidating a page that might still be
    executing. If the set overflows, a full invalidation is deferred instead. */
static constexpr unsigned JIT_PENDING_MAX = 8;
static uint32_t g_pending_pages[JIT_PENDING_MAX];
static unsigned g_pending_count = 0;
static bool     g_pending_all   = false;

// TEMP t-057 instrumentation (removed before commit).
static constexpr uint32_t T057_LOOP_PC = 0xFFF13FA8u;
uint64_t g_t057_loop_dispatch = 0;      // dispatches with pc == loop start
uint64_t g_t057_loop_translate = 0;     // jit_translate_block() calls at loop start
uint64_t g_t057_loop_smc_continue = 0;  // smc_invalidated continues while at loop
uint64_t g_t057_loop_selfloop_bail = 0; // self-loop guard bail while at loop
uint64_t g_t057_loop_stuck_bail = 0;    // stuck guard bail while at loop
uint64_t g_t057_loop_ctx[16] = {0};     // distinct ctx values seen at loop
uint64_t g_t057_loop_fallback = 0;      // fallback steps for loop opcodes
uint64_t g_t057_loop_inv_page = 0;      // invalidate_page() calls for loop page
uint64_t g_t057_loop_inv_deleted = 0;   // blocks actually deleted by that
uint64_t g_t057_loop_native = 0;        // native block executions at loop start
uint64_t g_t057_loop_drain = 0;         // drains with pending invalidation
uint64_t g_t057_loop_insns = 0;         // guest insns executed natively in loop
uint64_t g_t057_loop_fp = 0;            // fingerprint computations at loop
uint64_t g_t057_loop_events = 0;        // ppc_process_events() calls at loop
uint64_t g_t057_loop_handoff = 0;       // handoffs to interpreter at loop
static uint64_t g_t057_last_dump = 0;
uint64_t g_t057_inv_calls = 0;          // invalidate_page() calls (any page)
uint64_t g_t057_inv_deleted = 0;        // blocks deleted by invalidate_page()
uint64_t g_t057_inv_loop_page = 0;      // invalidate_page() on the loop's page
uint64_t g_t057_inv_loop_deleted = 0;   // loop-page blocks deleted
uint64_t g_t057_failed_scan = 0;        // failed_pcs entries scanned
uint64_t g_t057_store_ea_page = 0;      // last store page from the loop
uint64_t g_t057_store_calls = 0;        // stores issued from the loop
uint64_t g_t057_loop_first_ns = 0;      // wall time of first loop dispatch
uint64_t g_t057_loop_last_ns = 0;       // wall time of last loop dispatch
uint64_t g_t057_drain_ns = 0;           // wall ns spent in jit_drain_pending_invalidations
uint64_t g_t057_drain_calls = 0;        // drain calls
uint64_t g_t057_lookup_ns = 0;          // wall ns spent in lookup+translate
uint64_t g_t057_exec_ns = 0;            // wall ns spent executing native blocks
uint64_t g_t057_pending_ns = 0;         // wall ns spent in jit_pending_invalidate_page
uint64_t g_t057_pending_calls = 0;      // pending-page calls
static uint64_t t057_t0 = 0;            // per-iteration timer scratch

static uint64_t t057_now_ns() {
    static const bool enabled = [] {
        const char* v = std::getenv("DPPC_T057_TIMING");
        return v != nullptr && v[0] != '\0' && !(v[0] == '0' && v[1] == '\0');
    }();
    if (!enabled) return 0;
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return uint64_t(ts.tv_sec) * 1000000000ull + uint64_t(ts.tv_nsec);
}

static uint64_t t057_wall_ns() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return uint64_t(ts.tv_sec) * 1000000000ull + uint64_t(ts.tv_nsec);
}

// TEMP t-058 instrumentation (removed before commit): per-translation wall
// time, to show the mprotect() storm is gone.
uint64_t g_t058_translate_ns = 0;
uint64_t g_t058_translate_calls = 0;
static uint64_t t058_now_ns() {
    static const bool enabled = [] {
        const char* v = std::getenv("DPPC_T058_TIMING");
        return v != nullptr && v[0] != '\0' && !(v[0] == '0' && v[1] == '\0');
    }();
    if (!enabled) return 0;
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return uint64_t(ts.tv_sec) * 1000000000ull + uint64_t(ts.tv_nsec);
}

static void t057_dump(const char* tag);

static void t057_sigterm(int) {
    t057_dump("sigterm");
    signal(SIGTERM, SIG_DFL);
    raise(SIGTERM);
}

static struct T057Init {
    T057Init() { signal(SIGTERM, t057_sigterm); }
} g_t057_init;

void jit_pending_invalidate_page(uint32_t page) {
    uint64_t t057_p0 = t057_now_ns();
    g_t057_store_calls++;
    g_t057_store_ea_page = page;
    if (g_pending_all) {        return;
    }
    for (unsigned i = 0; i < g_pending_count; i++) {
        if (g_pending_pages[i] == page) {
            g_t057_pending_calls++;
            g_t057_pending_ns += t057_now_ns() - t057_p0;
            return; // already recorded
        }
    }
    if (g_pending_count == JIT_PENDING_MAX) {
        // Too many distinct pages pending: fall back to a full invalidation,
        // applied (safely) by the drain once the block has returned.
        g_pending_all   = true;
        g_pending_count = 0;
        g_t057_pending_calls++;
        g_t057_pending_ns += t057_now_ns() - t057_p0;
        return;
    }
    g_pending_pages[g_pending_count++] = page;
    g_t057_pending_calls++;
    g_t057_pending_ns += t057_now_ns() - t057_p0;
}

void jit_drain_pending_invalidations() {
    if (g_pending_all) {
        g_pending_all   = false;
        g_pending_count = 0;
        jit_block_cache().invalidate_all();
        return;
    }
    for (unsigned i = 0; i < g_pending_count; i++) {
        g_t057_inv_calls++;
        if (g_pending_pages[i] == (T057_LOOP_PC & PPC_PAGE_MASK)) {
            g_t057_inv_loop_page++;
        }
        size_t before = jit_block_cache().size();
        jit_block_cache().invalidate_page(g_pending_pages[i]);
        size_t after = jit_block_cache().size();
        g_t057_inv_deleted += (before - after);
        if (g_pending_pages[i] == (T057_LOOP_PC & PPC_PAGE_MASK)) {
            g_t057_inv_loop_deleted += (before - after);
        }
    }
    g_pending_count = 0;
}

bool jit_pending_invalidate_pending() {
    return g_pending_all || g_pending_count != 0;
}

// TEMP t-055 instrumentation (removed before commit).
uint64_t g_t055_dispatch = 0;
uint64_t g_t055_translate = 0;
uint64_t g_t055_ctx[16] = {0};
uint64_t g_t055_handoff = 0;
uint64_t g_t055_native_insns = 0;
uint64_t g_t055_blocks = 0;
uint64_t g_t055_flush = 0;
uint64_t g_t055_flush_ctx = 0; // TEMP t-052: jit_invalidate_all() calls from the ctx!=last_ctx path
uint32_t g_t052_ctx_seen[64] = {0}; // TEMP t-052: distinct ctx values observed
uint64_t g_t052_ctx_seen_n = 0;      // TEMP t-052: number of distinct ctx values
uint64_t g_t052_ctx_changes = 0;    // TEMP t-052: ctx != last_ctx occurrences

static void t057_dump(const char* tag) {
    fprintf(stderr,
        "[T057 %s] loop_disp=%llu loop_translate=%llu loop_native=%llu "
        "loop_insns=%llu smc_cont=%llu selfloop_bail=%llu stuck_bail=%llu "
        "handoff=%llu fallback=%llu drain=%llu fp=%llu events=%llu\n",
        tag,
        (unsigned long long)g_t057_loop_dispatch,
        (unsigned long long)g_t057_loop_translate,
        (unsigned long long)g_t057_loop_native,
        (unsigned long long)g_t057_loop_insns,
        (unsigned long long)g_t057_loop_smc_continue,
        (unsigned long long)g_t057_loop_selfloop_bail,
        (unsigned long long)g_t057_loop_stuck_bail,
        (unsigned long long)g_t057_loop_handoff,
        (unsigned long long)g_t057_loop_fallback,
        (unsigned long long)g_t057_loop_drain,
        (unsigned long long)g_t057_loop_fp,
        (unsigned long long)g_t057_loop_events);
    fprintf(stderr,
        "[T057 %s] inv_calls=%llu inv_loop_page=%llu inv_deleted=%llu "
        "inv_loop_deleted=%llu store_calls=%llu store_page=%08x "
        "first_ns=%llu last_ns=%llu\n",
        tag,
        (unsigned long long)g_t057_inv_calls,
        (unsigned long long)g_t057_inv_loop_page,
        (unsigned long long)g_t057_inv_deleted,
        (unsigned long long)g_t057_inv_loop_deleted,
        (unsigned long long)g_t057_store_calls,
        g_t057_store_ea_page,
        (unsigned long long)g_t057_loop_first_ns,
        (unsigned long long)g_t057_loop_last_ns);
    fprintf(stderr, "[T057 %s] loop_ctx:", tag);
    for (int i = 0; i < 16; i++) {
        if (g_t057_loop_ctx[i]) fprintf(stderr, " %d=%llu", i,
            (unsigned long long)g_t057_loop_ctx[i]);
    }
    fprintf(stderr, "\n");
    fprintf(stderr,
        "[T057 %s] lookup_ns=%llu exec_ns=%llu drain_ns=%llu drain_calls=%llu "
        "pending_ns=%llu pending_calls=%llu icycles=%llu cache=%zu\n",
        tag,
        (unsigned long long)g_t057_lookup_ns,
        (unsigned long long)g_t057_exec_ns,
        (unsigned long long)g_t057_drain_ns,
        (unsigned long long)g_t057_drain_calls,
        (unsigned long long)g_t057_pending_ns,
        (unsigned long long)g_t057_pending_calls,
        (unsigned long long)g_icycles,
        jit_block_cache().size());
    fprintf(stderr,
        "[T058 %s] translate_calls=%llu translate_ns=%llu avg_ns=%.0f\n",
        tag,
        (unsigned long long)g_t058_translate_calls,
        (unsigned long long)g_t058_translate_ns,
        g_t058_translate_calls ? double(g_t058_translate_ns) /
                                 double(g_t058_translate_calls) : 0.0);
    // TEMP t-052 instrumentation (removed before commit).
    fprintf(stderr,
        "[T052 %s] dispatch=%llu translate=%llu flush_total=%llu "
        "flush_ctx=%llu ctx_changes=%llu distinct_ctx=%llu icyc=%llu "
        "guest_s=%.3f cache=%zu\n",
        tag,
        (unsigned long long)g_t055_dispatch,
        (unsigned long long)g_t055_translate,
        (unsigned long long)g_t055_flush,
        (unsigned long long)g_t055_flush_ctx,
        (unsigned long long)g_t052_ctx_changes,
        (unsigned long long)g_t052_ctx_seen_n,
        (unsigned long long)g_icycles,
        double(get_virt_time_ns()) / 1e9,
        jit_block_cache().size());
    fprintf(stderr, "[T052 %s] ctx_values:", tag);
    for (uint64_t i = 0; i < g_t052_ctx_seen_n; i++) {
        fprintf(stderr, " %08x", g_t052_ctx_seen[i]);
    }
    fprintf(stderr, "\n");
    fflush(stderr);
}

void jit_invalidate_all() {
    // A full invalidation supersedes any deferred page invalidation.
    g_pending_all   = false;
    g_pending_count = 0;
    g_t055_flush++;
    jit_block_cache().invalidate_all();
}

/** Runtime entry point for JIT mode.

    The dispatcher drives translated basic blocks directly: it looks the block
    starting at the current guest PC up in the block cache, translates it on a
    miss, and calls the emitted native code. Control returns to this loop
    whenever a block exits (branch, fallback stub or dispatch), after which the
    loop re-reads ppc_state.pc and repeats.

    The loop is deliberately conservative: whenever it cannot make forward
    progress natively (translation failed, an execution flag was raised, or a
    block left the PC unchanged) it hands control back to the interpreter,
    which shares the same global CPU state.
*/
void ppc_jit_exec() {
    // One backend for the whole process; the arena and block cache are owned
    // by the shared cache accessor. Initialise lazily so a JIT run started
    // without ppc_reset() still has a clean cache.
    static JitBackendX64 backend;
    static bool          backend_ready = false;
    if (!backend_ready) {
        jit_init();
        backend_ready = true;
    }

    uint64_t max_cycles = 0;

    // Stuck-block detection: a block that returns to its own start is only a
    // problem if it also leaves the architectural state unchanged. Track the
    // last dispatched PC and state fingerprint so a legitimate self-loop (whose
    // counter GPR/CTR advances) is distinguished from a genuinely stuck block.
    uint32_t last_pc  = 0xFFFFFFFFu;
    uint64_t last_fp  = 0;
    uint32_t stuck    = 0;

    // Self-loop detection: count consecutive re-dispatches of the *same* block
    // whose exit branched back to the block's own guest_start. Such a loop is
    // normally legitimate, but it can also be a livelock whose architectural
    // fingerprint keeps changing (so the stuck guard above never fires); after
    // JIT_MAX_SELFLOOP_REDISPATCH consecutive self-loop re-dispatches the
    // dispatcher hands off to the interpreter.
    uint32_t selfloop_streak = 0;

    while (power_on) {
        // Service any execution flags raised by the previous block or by
        // ppc_process_events(). This mirrors the tail of ppc_exec_inner()
        // (cpu/ppc/ppcexec.cpp) so the JIT and interpreter agree on control
        // flow instead of blindly handing off to the interpreter.
        if (exec_flags != 0) {
            if ((exec_flags & EXEF_SLEEP) && !(exec_flags & EXEF_EXCEPTION)) {
                // Same sleep loop as ppc_exec_inner(): keep processing events
                // until an interrupt wakes the CPU (clearing EXEF_SLEEP).
                while (power_on && (exec_flags & EXEF_SLEEP)) {
                    max_cycles = ppc_process_events();
                    if (!(exec_flags & EXEF_SLEEP)) {
                        break;
                    }
                    if (max_cycles > g_icycles) {
                        g_icycles = max_cycles;
                    } else {
                        g_icycles++;
                    }
                }
            }

            if (exec_flags & EXEF_EXCEPTION) {
                // A recoverable exception (EXT_INT/DECR) returned here without
                // longjmp'ing; its vector lives in ppc_next_instruction_address.
                // Mirror ppc_exec_inner(): apply the vector to the PC and keep
                // running in this loop. Returning to ppc_exec() here would hand
                // control back to the debugger's "go" handler (ppc_exec() only
                // catches longjmp, not a normal return), which is exactly the
                // "boot drops into the debugger" regression.
                //
                // The exception changed MSR: exception entry masks it with
                // 0xFFFB1041, clearing IR/DR/PR (the vector runs in
                // real-addressing supervisor mode), and may also change the
                // endianness. That is a genuine translation-context change, but
                // it does NOT invalidate the blocks translated in the previous
                // context: they are keyed by (pc, ctx) and simply coexist with
                // the vector's blocks. So there is nothing to flush here -- the
                // next lookup picks the block for the new context, and the old
                // context's blocks stay warm for the matching RFI.
                ppc_state.pc = ppc_next_instruction_address;
                exec_flags   = 0;

                if (!power_on) {
                    break;
                }
                continue;
            }

            if (exec_flags & EXEF_RFI) {
                // RFI restores the saved MSR (typically translation on), which
                // switches the translation context back. The (pc, ctx)-keyed
                // cache already holds the pre-exception blocks for that context,
                // so they are reused instead of being re-translated -- and the
                // exception vector's blocks are kept for the next fault. No
                // whole-cache flush is needed.
            }

            if (exec_flags & EXEF_OPC_DECODER) {
                // The JIT never caches an opcode-grabber pointer: the fallback
                // path always calls ppc_opcode_grabber directly, so there is no
                // cached decoder state to refresh. Nothing to do here.
            }

            // EXEF_BRANCH (and any remaining bits) were already applied to
            // ppc_state.pc by jit_fallback_step(); clear them and resume.
            exec_flags = 0;

            if (!power_on) {
                break;
            }
            continue;
        }

        const uint32_t pc = ppc_state.pc;
        ppc_pc_hist_sample(pc); // TEMP t-054

        // Translation-context guard. The block cache is keyed by guest PC only
        // (see make_key() in jit_blockcache.h), so every block it holds was
        // translated under the context recorded in last_ctx. When the context
        // changes -- exception entry masks MSR with 0xFFFB1041, clearing IR/PR,
        // and RFI restores them -- drop the whole cache once, *before* any
        // lookup, so a block is never executed under an MSR mode whose
        // semantics differ from the one it was translated under. Because
        // MSR[DR] is deliberately not part of the context, a DSI/RFI round trip
        // that only toggles DR does not change the context and does not flush.
        static uint32_t last_ctx = 0xFFFFFFFFu;
        const uint32_t ctx = jit_translate_context();
        if (ctx != last_ctx) {
            // TEMP t-052 REVERT EXPERIMENT: no flush; (pc,ctx) keying instead.
            g_t052_ctx_changes++; // TEMP t-052
            { // TEMP t-052: record distinct ctx values
                bool found = false;
                for (uint64_t i = 0; i < g_t052_ctx_seen_n; i++) {
                    if (g_t052_ctx_seen[i] == ctx) { found = true; break; }
                }
                if (!found && g_t052_ctx_seen_n < 64) {
                    g_t052_ctx_seen[g_t052_ctx_seen_n++] = ctx;
                }
            }
            last_ctx = ctx;
        }

        // A PC that already failed to translate is known-bad: skip the lookup
        // and translation attempt and hand straight off to the interpreter.
        if (jit_block_cache().is_failed(pc)) {
            ppc_exec_interpreter();
            return;
        }

        const bool t057_at_loop = (pc == T057_LOOP_PC);
        if (t057_at_loop) {
            static bool t057_handler_installed = false;
            if (!t057_handler_installed) {
                t057_handler_installed = true;
                signal(SIGTERM, t057_sigterm);
            }
            g_t057_loop_dispatch++;
            if (g_t057_loop_dispatch == 1) {
                g_t057_loop_first_ns = t057_wall_ns();
            }
            g_t057_loop_last_ns = t057_wall_ns();
            uint32_t c = 0;
            if (ctx & MSR::IR) c |= 1;
            if (ctx & MSR::DR) c |= 2;
            if (ctx & MSR::PR) c |= 4;
            if (ctx & MSR::LE) c |= 8;
            g_t057_loop_ctx[c]++;
            static const bool t057_timing = [] {
                const char* v = std::getenv("DPPC_T057_TIMING");
                return v != nullptr && v[0] != '\0' && !(v[0] == '0' && v[1] == '\0');
            }();
            if (t057_timing) {
                static uint64_t t057_next_dump = 0;
                uint64_t t057_now = t057_wall_ns();
                if (t057_now >= t057_next_dump) {
                    t057_next_dump = t057_now + 5000000000ull;
                    t057_dump("prog");
                }
                t057_t0 = t057_now_ns();
            }
        }        g_t055_dispatch++;
        {
            uint32_t c = 0;
            if (ctx & MSR::IR) c |= 1;
            if (ctx & MSR::DR) c |= 2;
            if (ctx & MSR::PR) c |= 4;
            if (ctx & MSR::LE) c |= 8;
            g_t055_ctx[c]++;
        }
        if ((g_t055_dispatch % 2000000u) == 0) {
            fprintf(stderr, "[T055] disp=%llu trans=%llu flush=%llu native=%llu cache=%zu icyc=%llu ctx=%llu/%llu/%llu/%llu/%llu/%llu/%llu/%llu\n",
                    (unsigned long long)g_t055_dispatch,
                    (unsigned long long)g_t055_translate,
                    (unsigned long long)g_t055_flush,
                    (unsigned long long)g_jit_native_blocks,
                    jit_block_cache().size(),
                    (unsigned long long)g_icycles,
                    (unsigned long long)g_t055_ctx[0], (unsigned long long)g_t055_ctx[1],
                    (unsigned long long)g_t055_ctx[2], (unsigned long long)g_t055_ctx[3],
                    (unsigned long long)g_t055_ctx[4], (unsigned long long)g_t055_ctx[5],
                    (unsigned long long)g_t055_ctx[6], (unsigned long long)g_t055_ctx[7]);
        }

        // Debug/diagnostic switch (DPPC_JIT_NO_CACHE): when set to a non-empty,
        // non-"0" value, bypass the block cache entirely so every dispatched
        // block is re-translated from scratch. This isolates "stale block
        // reuse" from every other possible cause of divergence: if the guest
        // still misbehaves with the cache disabled, the fault is not a stale
        // cached block. The env var is read once (function-local static) and
        // the switch is off by default, so normal behaviour is byte-identical
        // when the variable is unset or "0" (the same convention as
        // DPPC_JIT_NO_INLINE in jit_translate.cpp).
        static const bool no_cache = [] {
            const char* v = std::getenv("DPPC_JIT_NO_CACHE");
            return v != nullptr && v[0] != '\0' && !(v[0] == '0' && v[1] == '\0');
        }();
        if (no_cache) {
            jit_invalidate_all();
        }

        JitBlock* blk = jit_block_cache().lookup(pc, ctx);
        if (blk == nullptr) {
            g_t055_translate++;
            if (t057_at_loop) g_t057_loop_translate++;
            // TEMP t-058 instrumentation (removed before commit).
            uint64_t t058_t0 = t058_now_ns();
            blk = jit_translate_block(backend, jit_block_cache().arena(), pc);
            if (t058_t0) {
                g_t058_translate_ns += t058_now_ns() - t058_t0;
                g_t058_translate_calls++;
            }
            if (blk == nullptr) {
                // Nothing translatable here (e.g. unmapped page): remember it
                // and fall back to the interpreter, which owns the
                // exception/mapping logic.
                jit_block_cache().mark_failed(pc);
                ppc_exec_interpreter();
                return;
            }
            // Defensive: the arena's flush-on-exhaustion path (JitCodeArena::
            // alloc()) retries after flushing the whole cache, so a translated
            // block normally always has code. If even the retry failed (a
            // single block larger than the entire arena) block->code is null;
            // executing it would jump to address 0. Treat it exactly like a
            // translation failure and hand off to the interpreter instead of
            // crashing.
            if (blk->code == nullptr) {
                delete blk;
                jit_block_cache().mark_failed(pc);
                ppc_exec_interpreter();
                return;
            }
            blk->ctx = ctx;
            jit_block_cache().insert(blk);
        }
        if (t057_at_loop) g_t057_lookup_ns += t057_now_ns() - t057_t0;

        // Check the cycle budget *before* running the block as well as after
        // it. The interpreter tests the budget every instruction; a native
        // block may run up to JIT_MAX_BLOCK_INSNS instructions before it
        // returns, so checking only afterwards could delay ppc_process_events()
        // by a whole block. Checking here bounds that latency to one block
        // while leaving the normal fast path untouched (ppc_process_events() is
        // only called when the budget is exhausted or a timer is pending).
        if (g_icycles >= max_cycles || exec_timer) {
            max_cycles = ppc_process_events();
            // process_events() may raise a control flag (e.g. an external
            // interrupt delivered as EXEF_EXCEPTION); service it at the top of
            // the loop before executing anything.
            if (exec_flags != 0) {
                continue;
            }
        }

        // Run the emitted block. It is a plain no-argument function; all guest
        // state is reached through the shared globals.
        // Capture the block start now: `blk` may be freed by the pending
        // invalidation drain below, but the liveness heuristic needs it.
        const uint32_t block_start = blk->guest_start;
        g_jit_native_blocks++;
        {
            static uint32_t seen[512];
            static unsigned nseen = 0;
            static unsigned printed = 0;
            if (pc >= 0xff800000u && printed < 80) {
                bool dup = false;
                for (unsigned si = 0; si < nseen; si++) {
                    if (seen[si] == pc) { dup = true; break; }
                }
                if (!dup) {
                    if (nseen < 512) seen[nseen++] = pc;
                    fprintf(stderr, "[OF] pc=%08x gs=%08x ge=%08x nex=%u",
                            pc, blk->guest_start, blk->guest_end, blk->num_exits);
                    for (uint32_t ei = 0; ei < blk->num_exits; ei++) {
                        fprintf(stderr, " e%u{t=%08x,f=%x%s}", ei,
                                blk->exits[ei].guest_target, blk->exits[ei].flags,
                                (blk->exits[ei].guest_target == blk->guest_start) ? ",SELF" : "");
                    }
                    fprintf(stderr, "\n");
                    printed++;
                }
            }
        }
        // Architectural-state trace (DPPC_JIT_STATE_TRACE): the per-instruction
        // line is emitted from jit_fallback_step(), not here, so that with all
        // inline translation disabled (DPPC_JIT_NO_INLINE=1 plus
        // DPPC_JIT_NO_INLINE_BRANCH=1) the JIT stream is exactly one line per
        // guest instruction.
        uint64_t t057_exec0 = 0;
        if (t057_at_loop) {
            g_t057_loop_native++;
            g_t057_loop_insns += (blk->guest_end - blk->guest_start) / 4 + 1;
            t057_exec0 = t057_now_ns();
        }
        reinterpret_cast<void (*)()>(blk->code)();
        if (t057_at_loop) g_t057_exec_ns += t057_now_ns() - t057_exec0;

        // Cycle accounting: one cycle per guest instruction plus a fixed
        // per-block overhead, mirroring the interpreter's g_icycles++. The
        // block's span must be read *before* the pending invalidation below,
        // because in the common self-modifying-code case the store targeted
        // the page of the block that just ran, so draining frees `blk`.
        const uint32_t block_cycles =
            (blk->guest_end - blk->guest_start) / 4 + 1;

        // Self-modifying code: a guest store executed by the block may have
        // targeted the page holding this (or another) translated block. The
        // store helper only recorded the page; now that the native code has
        // returned it is safe to drop the stale block(s). Do this before the
        // next lookup so the next iteration re-translates instead of reusing
        // the block we just ran. `blk` may be freed here, so it must not be
        // dereferenced afterwards.
        const bool smc_invalidated = jit_pending_invalidate_pending();
        if (smc_invalidated && t057_at_loop) g_t057_loop_drain++;
        uint64_t t057_drain0 = 0;
        if (t057_at_loop) { t057_drain0 = t057_now_ns(); g_t057_drain_calls++; }
        jit_drain_pending_invalidations();
        if (t057_at_loop) g_t057_drain_ns += t057_now_ns() - t057_drain0;

        g_icycles += block_cycles;

        if (g_icycles >= max_cycles || exec_timer) {
            max_cycles = ppc_process_events();
            if (t057_at_loop) g_t057_loop_events++;
        }

        // Flags raised by the block or by ppc_process_events() are serviced at
        // the top of the loop on the next iteration.
        if (exec_flags != 0) {
            continue;
        }

        // A store invalidated translated code: force a fresh lookup so the
        // newly written instructions are translated rather than the stale
        // block being reused (this also covers the common case where the store
        // targeted the page of the block that just ran).
        if (smc_invalidated) {
            if (t057_at_loop) g_t057_loop_smc_continue++;
            continue;
        }

        // A block that left the PC unchanged is *not* necessarily stuck: a
        // taken back-edge to the block's own start (a self-looping block, e.g.
        // a cache-flush loop) legitimately returns to the same PC while its
        // loop counter advances. Only bail to the interpreter once the same
        // block has been re-dispatched many times in a row *without* any
        // observable architectural change -- that is the genuinely stuck case
        // (e.g. a block whose only exit is a dispatch) the guard exists for.
        const uint64_t fp = jit_state_fingerprint();
        if (t057_at_loop) g_t057_loop_fp++;
        if (ppc_state.pc == pc && fp == last_fp && pc == last_pc) {
            if (++stuck >= JIT_MAX_STUCK_REDISPATCH) {
                g_jit_noprogress_bails++;
                if (t057_at_loop) { g_t057_loop_stuck_bail++; g_t057_loop_handoff++; }
                ppc_exec_interpreter();
                return;
            }
        } else {
            stuck = 0;
        }
        last_pc = pc;
        last_fp = fp;

        // Structural self-loop guard. A block that branched back to its own
        // guest_start is a self-loop: the fingerprint path above cannot catch
        // it because a livelocking self-loop keeps mutating architectural state
        // (so `fp` keeps changing and `stuck` never trips). Count consecutive
        // such re-dispatches of the same block and, after a small bound, hand
        // off to the interpreter so the guest can make progress. This is
        // deliberately *not* the old unconditional `pc == block start` bail:
        // a few native iterations are allowed first, and the fingerprint path
        // above still guards genuinely stuck straight-line blocks.
        if (ppc_state.pc == block_start) {
            if (++selfloop_streak >= JIT_MAX_SELFLOOP_REDISPATCH) {
                g_jit_noprogress_bails++;
                if (t057_at_loop) { g_t057_loop_selfloop_bail++; g_t057_loop_handoff++; }
                ppc_exec_interpreter();
                return;
            }
        } else {
            selfloop_streak = 0;
        }
    }

    // Power was switched off. If it was an endianness switch, mirror
    // ppc_exec_interpreter() by re-powering on and letting the interpreter
    // re-enter with the swapped endianness.
    if (power_off_reason == po_endian_switch) {
        power_on = true;
        ppc_exec_interpreter();
    }
    t057_dump("final");
}

/** Fallback for instructions the translator cannot handle.

    The opcode has already been fetched by the caller. This mirrors the tail of
    ppc_exec_inner(): run it through the interpreter and then advance the PC
    according to exec_flags, so the JIT and interpreter agree on control flow.

    Crucially, the control flags are NOT cleared here. EXEF_SLEEP, EXEF_RFI,
    EXEF_OPC_DECODER and EXEF_EXCEPTION must survive so that ppc_jit_exec() can
    service them (sleep loop, block invalidation, in-loop exception
    servicing, ...).
    EXEF_BRANCH is the only bit consumed locally: its target has already been
    written to ppc_state.pc, so it needs no further servicing.
*/
void jit_fallback_step(uint32_t opcode) {
    // TEMP t-057: count fallback executions of the memset-loop opcodes.
    if (ppc_state.pc == T057_LOOP_PC || ppc_state.pc == T057_LOOP_PC + 4 ||
        ppc_state.pc == T057_LOOP_PC + 8) {
        g_t057_loop_fallback++;
    }
    // Architectural-state trace: one line per fallback instruction, emitted
    // before it runs. With DPPC_JIT_NO_INLINE=1 and DPPC_JIT_NO_INLINE_BRANCH=1
    // every guest instruction takes this path, so the stream is exactly one
    // line per guest instruction (see the DPPC_JIT_STATE_TRACE note above).
    ppc_state_trace_emit();
    ppc_main_opcode(ppc_opcode_grabber, opcode);
    // Cycle accounting is owned by the dispatcher: ppc_jit_exec() charges
    // block_cycles = (guest_end - guest_start)/4 + 1 for the whole block, and
    // that span already includes this fallback instruction (block->guest_end
    // is advanced for every instruction, fallback or inline). Incrementing
    // g_icycles here as well double-counted every fallback instruction, so the
    // JIT's cycle counter -- and hence virt_ns and the timebase -- ran ahead of
    // the interpreter's, which charges exactly one cycle per guest instruction
    // (t-012/t-014). Do NOT charge here.

    if (exec_flags) {
        // A branch, exception, RFI, sleep or decoder change redirected control
        // through ppc_next_instruction_address. Apply it and leave the
        // remaining control flags for the dispatcher.
        ppc_state.pc = ppc_next_instruction_address;
        exec_flags  &= ~EXEF_BRANCH;
    } else {
        ppc_state.pc += 4;
    }
}

/** Guest-memory access helpers for JIT-emitted code.

    These are thin wrappers over the canonical MMU accessors so the emitted
    code shares the interpreter's TLB lookup, MMIO dispatch and fault
    generation. They are ordinary C++ functions called through emit_call(),
    which uses the System V AMD64 ABI; the guest state lives in the globals
    (ppc_state, exec_flags), so no extra context has to be threaded through.

    Faulting: mmu_read_vmem()/mmu_write_vmem() raise DSI/alignment exceptions
    through ppc_exception_handler(), which longjmps to the exc_env installed by
    ppc_exec() *before* it enters ppc_jit_exec(). That unwinds the emitted
    block out to ppc_exec(), which applies ppc_next_instruction_address to the
    PC, so a faulting access never returns here and never corrupts guest state.
    A recoverable exception (EXT_INT/DECR) is raised without longjmp'ing:
    ppc_exception_handler() sets exec_flags = EXEF_EXCEPTION, which
    ppc_jit_exec() services in-loop (applying the vector to the PC and clearing
    exec_flags) instead of returning to ppc_exec().

    A width the translator never emits (anything but 1/2/4 bytes) is treated as
    unserviceable: EXEF_EXCEPTION is raised so ppc_jit_exec() services it
    in-loop (applying the vector to the PC) rather than returning a bogus
    value. */
uint32_t jit_mem_read(uint32_t ea, unsigned size, bool is_signed) {
    uint32_t value;

    switch (size) {
    case 1:
        value = mmu_read_vmem<uint8_t>(NO_OPCODE, ea);
        break;
    case 2:
        value = mmu_read_vmem<uint16_t>(NO_OPCODE, ea);
        break;
    case 4:
        value = mmu_read_vmem<uint32_t>(NO_OPCODE, ea);
        break;
    default:
        // Should be unreachable: the translator only emits 1/2/4-byte loads.
        exec_flags |= EXEF_EXCEPTION;
        return 0;
    }

    if (is_signed) {
        // Sign-extend from the access width (used by lha/lhax once translated).
        switch (size) {
        case 1: value = uint32_t(int32_t(int8_t(value)));   break;
        case 2: value = uint32_t(int32_t(int16_t(value)));  break;
        default: break;
        }
    }

    return value;
}

void jit_mem_write(uint32_t ea, unsigned size, uint32_t value) {
    switch (size) {
    case 1:
        mmu_write_vmem<uint8_t>(NO_OPCODE, ea, uint8_t(value));
        break;
    case 2:
        mmu_write_vmem<uint16_t>(NO_OPCODE, ea, uint16_t(value));
        break;
    case 4:
        mmu_write_vmem<uint32_t>(NO_OPCODE, ea, value);
        break;
    default:
        // Should be unreachable: the translator only emits 1/2/4-byte stores.
        exec_flags |= EXEF_EXCEPTION;
        return;
    }

    // Self-modifying code: the store may have overwritten instructions in a
    // page that holds translated code. Record the page for deferred
    // invalidation; the dispatcher applies it once this native block returns.
    // (A faulting store longjmps out of mmu_write_vmem and never reaches here,
    // so only successful stores mark the page.)
    jit_pending_invalidate_page(ea & PPC_PAGE_MASK);
}
