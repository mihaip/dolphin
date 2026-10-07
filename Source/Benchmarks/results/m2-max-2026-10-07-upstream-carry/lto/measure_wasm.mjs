import {readFileSync,writeFileSync} from 'node:fs';
import vm from 'node:vm';
const root=new URL('.',import.meta.url);
globalThis.loadWasm=(name)=>new WebAssembly.Instance(new WebAssembly.Module(readFileSync(new URL(name+'-handlers.wasm',root))),{}).exports;
globalThis.nowNs=()=>Number(process.hrtime.bigint());
globalThis.emit=console.log;
globalThis.engineName='Node '+process.version+' / V8 '+process.versions.v8;
globalThis.saveReport=(report)=>{writeFileSync(new URL('wasm-node.json',root),JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report.summary,null,2));};
vm.runInThisContext(readFileSync(new URL('test_and_measure.js',root),'utf8'));
