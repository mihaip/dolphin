const root='./';
function loadWasm(name){return new WebAssembly.Instance(new WebAssembly.Module(readFile(root+name+'-handlers.wasm','binary')),{}).exports;}
function nowNs(){return performance.now()*1000000;}
function emit(message){print(message);}
const engineName='JavaScriptCore shell, macOS 15.7.9';
function saveReport(report){print('REPORT '+JSON.stringify(report));}
load(root+'test_and_measure.js');
