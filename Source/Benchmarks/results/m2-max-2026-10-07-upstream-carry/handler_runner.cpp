#include "cpu/ppc/ppcemu.h"

SetPRS ppc_state{};
#define FOUR(fn) &dppc_interpreter::fn<RC0,OV0>, &dppc_interpreter::fn<RC1,OV0>, \
                 &dppc_interpreter::fn<RC0,OV1>, &dppc_interpreter::fn<RC1,OV1>
#define FOUR_C(fn,c) &dppc_interpreter::fn<c,RC0,OV0>, &dppc_interpreter::fn<c,RC1,OV0>, \
                     &dppc_interpreter::fn<c,RC0,OV1>, &dppc_interpreter::fn<c,RC1,OV1>
static PPCOpcode const handlers[][4] = {
    {FOUR(ppc_adde)},
    {&dppc_interpreter::ppc_addic<RC0>, &dppc_interpreter::ppc_addic<RC1>,
     &dppc_interpreter::ppc_addic<RC0>, &dppc_interpreter::ppc_addic<RC1>},
    {FOUR_C(ppc_add,CARRY1)},
    {FOUR(ppc_addme)},
    {FOUR(ppc_addze)},
    {dppc_interpreter::ppc_subfic, dppc_interpreter::ppc_subfic,
     dppc_interpreter::ppc_subfic, dppc_interpreter::ppc_subfic},
    {FOUR_C(ppc_subf,CARRY1)},
    {FOUR(ppc_subfe)},
    {FOUR(ppc_subfme)},
    {FOUR(ppc_subfze)},
    {FOUR_C(ppc_add,CARRY0)},
    {FOUR_C(ppc_subf,CARRY0)},
};
PPCOpcode volatile handler;

extern "C" uint64_t check(unsigned family,unsigned flags,unsigned a,unsigned b,
                          unsigned xer,unsigned cr,unsigned alias) {
    for(unsigned i=0;i<32;++i) ppc_state.gpr[i]=0xA0000000u+i;
    unsigned ra=alias==3?0:4;
    unsigned rd=alias==1?ra:alias==2?5:3;
    ppc_state.gpr[ra]=a; ppc_state.gpr[5]=b;
    ppc_state.spr[SPR::XER]=xer; ppc_state.cr=cr;
    uint32_t opcode=(rd<<21)|(ra<<16)|(5u<<11);
    if(family==1 || family==5) opcode=(rd<<21)|(ra<<16)|uint16_t(b);
    handlers[family][flags](opcode);
    return uint64_t(ppc_state.gpr[rd]) | (uint64_t(ppc_state.spr[SPR::XER])<<32);
}
extern "C" unsigned get_cr() {return ppc_state.cr;}
extern "C" unsigned get_gpr(unsigned i) {return ppc_state.gpr[i];}

extern "C" unsigned run(unsigned family,unsigned mode,unsigned count) {
    unsigned rng=0xCAFE1234,hash=0;
    ppc_state.spr[SPR::XER]=0;
    handler=handlers[family][0];
    for(unsigned i=0;i<count;++i) {
        rng^=rng<<13; rng^=rng>>17; rng^=rng<<5;
        unsigned a=mode?(i&255):rng;
        unsigned b=mode?3:((rng<<16)|(rng>>16));
        ppc_state.gpr[4]=a; ppc_state.gpr[5]=b;
        unsigned opcode=(3u<<21)|(4u<<16)|(5u<<11);
        if(family==1 || family==5) opcode=(3u<<21)|(4u<<16)|uint16_t(b);
        handler(opcode);
        hash^=ppc_state.gpr[3]+ppc_state.spr[SPR::XER];
    }
    return hash;
}
