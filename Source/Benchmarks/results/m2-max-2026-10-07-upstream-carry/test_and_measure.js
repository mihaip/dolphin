const names=['before','after'];
const cores={};
for(const n of names){cores[n]=loadWasm(n);cores[n]._initialize();}
const families=['adde','addic','addc','addme','addze','subfic','subfc','subfe','subfme','subfze','add','subf'];
const CA=0x20000000,OV=0x40000000,SO=0x80000000;
const mask=0xffffffffn;
let rng=0xC0DE1234;
function random(){rng^=rng<<13;rng^=rng>>>17;rng^=rng<<5;return rng>>>0;}
function flagsFor(f){return f===1?[0,1]:f===5?[0]:[0,1,2,3];}
function signed(x){return BigInt(x|0);}
function reference(f,flags,a,b,xer,cr){
    const A=BigInt(a>>>0),C=BigInt(!!(xer&CA));
    const imm=(b<<16)>>16;
    const B=BigInt((f===1||f===5?imm:b)>>>0);
    let sum,s;
    switch(f){
    case 0:sum=A+B+C;s=signed(a)+signed(b)+C;break;
    case 1:case 2:case 10:sum=A+B;s=signed(a)+signed(f===1?imm:b);break;
    case 3:sum=A+C+mask;s=signed(a)+C-1n;break;
    case 4:sum=A+C;s=signed(a)+C;break;
    case 5:case 6:case 11:sum=(mask-A)+B+1n;s=signed(f===5?imm:b)-signed(a);break;
    case 7:sum=(mask-A)+B+C;s=signed(b)-signed(a)+C-1n;break;
    case 8:sum=(mask-A)+C+mask;s=-signed(a)+C-2n;break;
    case 9:sum=(mask-A)+C;s=-signed(a)+C-1n;break;
    }
    const d=Number(sum&mask)>>>0;
    let x=xer>>>0;
    if(f<10)x=((x&~CA)|(Number((sum>>32n)&1n)*CA))>>>0;
    if(flags&2){
        const overflow=s < -2147483648n || s > 2147483647n;
        x=(overflow?(x|OV|SO):(x&~OV))>>>0;
    }
    let c=cr>>>0;
    if(flags&1)c=((c&0x0fffffff)|(d===0?0x20000000:(d|0)<0?0x80000000:0x40000000)|((x&SO)>>>3))>>>0;
    return {d,x,c,packed:BigInt(d)|(BigInt(x)<<32n)};
}
let cases=0;
function check(f,flags,a,b,xer,cr,alias){
    const e=reference(f,flags,a,b,xer,cr);
    for(const n of names){
        const actual=BigInt.asUintN(64,cores[n].check(f,flags,a,b,xer,cr,alias));
        const actualCr=cores[n].get_cr()>>>0;
        if(actual!==e.packed||actualCr!==e.c)
            throw Error(JSON.stringify({n,f:families[f],flags,a,b,xer,cr,alias,
                expected:e.packed.toString(16),actual:actual.toString(16),expectedCr:e.c,actualCr}));
        if(alias!==undefined){
            const ra=alias===3?0:4,rd=alias===1?ra:alias===2?5:3;
            for(let i=0;i<32;++i){
                const expected=i===rd?e.d:i===ra?a>>>0:i===5?b>>>0:(0xA0000000+i)>>>0;
                if((cores[n].get_gpr(i)>>>0)!==expected)throw Error('Unintended register mutation');
            }
        }
    }
    ++cases;
}
const edges=[0,1,2,0x7fff,0x8000,0xffff,0x7fffffff,0x80000000,0xfffffffe,0xffffffff];
for(let f=0;f<12;++f)for(const flags of flagsFor(f)){
    for(const a of edges)for(const b of edges)for(let ca=0;ca<2;++ca)
    for(let ov=0;ov<2;++ov)for(let so=0;so<2;++so)for(let alias=0;alias<4;++alias){
        const xer=(0x1abc1234|(ca?CA:0)|(ov?OV:0)|(so?SO:0))>>>0;
        check(f,flags,a,b,xer,0x12345678,alias);
    }
    for(let i=0;i<5000;++i)check(f,flags,random(),random(),random(),random(),undefined);
}
for(const f of [1,5])for(const flags of flagsFor(f))for(let imm=0;imm<65536;++imm)
    check(f,flags,0x13579bdf,imm,random(),random(),undefined);
emit('Correctness: '+cases+' reference cases per version passed');

const summary={},times={},hashes={};
function median(a){a=[...a].sort((x,y)=>x-y);return (a[5]+a[6])/2;}
for(let f=0;f<12;++f){
    const measuredCores={};
    for(const n of names){measuredCores[n]=loadWasm(n);measuredCores[n]._initialize();}
    summary[families[f]]={};times[families[f]]={};hashes[families[f]]={};
    for(let mode=0;mode<2;++mode){
        const key=mode?'predictable':'random';const t={before:[],after:[]};
        for(let i=0;i<8;++i)for(const n of names)measuredCores[n].run(f,mode,1000000);
        for(let i=0;i<12;++i){
            let referenceHash;
            for(const n of i%2?['after','before']:names){
                const start=nowNs();const hash=measuredCores[n].run(f,mode,5000000)>>>0;
                t[n].push((nowNs()-start)/5000000);
                if(referenceHash!==undefined&&referenceHash!==hash)throw Error('Timed hash mismatch');
                referenceHash=hash;
            }
            hashes[families[f]][key]=referenceHash;
        }
        const before=median(t.before),after=median(t.after);
        summary[families[f]][key]={before_ns:before,after_ns:after,change_percent:100*(after/before-1)};
        times[families[f]][key]=t;
    }
    emit('Measured '+families[f]);
}
const report={engine:engineName,host:'Apple M2 Max, native arm64 runtime',
    compiler:'Emscripten 6.0.11 -O3 -DNDEBUG, no LTO',
    correctness_cases_per_version:cases,handler_invocations_checked:cases*2,
    scope:'Actual affected handlers, indirect calls in Wasm; not a full emulator benchmark or boot',
    protocol:'Fresh module pair per family; 8 x 1M warmup, 12 alternating trials x 5M calls per operand pattern',
    summary,times,hashes};
saveReport(report);
