from pathlib import Path
import shutil,subprocess,os,json,signal
repo=Path(os.environ.get('DPPC_REPO', '/Users/mihai/Developer/source/infinite-mac/dingusppc'));root=Path(os.environ.get('BOOT_RESULTS', '/tmp/dppc-carry-10.1'))

files=['main.cpp','devices/video/videoctrl.h','devices/video/videoctrl.cpp','cpu/ppc/ppcopcodes.cpp']
orig={f:(repo/f).read_bytes() for f in files}
def write(f,s):
 (repo/f).write_bytes(s.replace('\n','\r\n').encode() if b'\r\n' in orig[f] else s.encode())
try:
 s=orig[files[1]].decode().replace('\r\n','\n').replace('    void update_screen(void);','    void update_screen(void);\n    void diag_capture(const char* path);')
 write(files[1],s)
 s=orig[files[2]].decode().replace('\r\n','\n').replace('#include <cinttypes>','#include <cinttypes>\n#include <cstdio>\n#include <vector>')
 s+='''
void VideoCtrlBase::diag_capture(const char* path) {
    std::vector<uint8_t> pixels(active_width*active_height*4);
    convert_fb_cb(pixels.data(),active_width*4);
    FILE* f = std::fopen(path,"wb");
    std::fprintf(f,"P6\\n%d %d\\n255\\n",active_width,active_height);
    for (int i=0;i<active_width*active_height;++i) {
        uint8_t rgb[3]={pixels[i*4+2],pixels[i*4+1],pixels[i*4]};
        std::fwrite(rgb,1,3,f);
    }
    std::fclose(f);
}
''';write(files[2],s)
 s=orig[files[0]].decode().replace('\r\n','\n').replace('#include <main.h>','#include <main.h>\n#include <devices/video/atirage.h>')
 marker='            LOG_F(INFO, "TS=%016llu PC=0x%08x executing %s", get_virt_time_ns(), ppc_state.pc, op_name.c_str());'
 s=s.replace(marker,marker+'''
            static bool captured = false;
            if (!captured && get_virt_time_ns() >= 160000000000ULL) {
                auto* video = static_cast<ATIRage*>(gMachineObj->get_comp_by_name("AtiRageGT@pci_GPU"));
                video->diag_capture("framebuffer.ppm");
                captured = true;
            }
''');write(files[0],s)
 for name in ['screenbase2','screencandidate2']:
  if name=='screencandidate2':
   s=orig[files[3]].decode().replace('\r\n','\n')
   old='''    if ((ppc_result_d < ppc_result_a) || (xer_ca && (ppc_result_d == ppc_result_a))) {
        ppc_state.spr[SPR::XER] |= XER::CA;
    } else {
        ppc_state.spr[SPR::XER] &= ~XER::CA;
    }'''
   new='''    uint64_t sum = uint64_t(ppc_result_a) + ppc_result_b + xer_ca;
    ppc_state.spr[SPR::XER] = (ppc_state.spr[SPR::XER] & ~XER::CA) |
                             (uint32_t(sum >> 32) * XER::CA);'''
   assert s.count(old)==1;write(files[3],s.replace(old,new))
  with (root/('build-'+name+'.log')).open('w') as log:subprocess.run(['cmake','--build','build-xcode','--config','Release','--target','dingusppc','--parallel','8'],cwd=repo,stdout=log,stderr=subprocess.STDOUT,check=True)
  shutil.copytree(repo/'build-xcode/bin/Release/dingusppc.app',root/(name+'.app'));print('Built',name,flush=True)
finally:
 for f,b in orig.items():(repo/f).write_bytes(b)
 with (root/'build-restored-screens.log').open('w') as log:subprocess.run(['cmake','--build','build-xcode','--config','Release','--target','dingusppc','--parallel','8'],cwd=repo,stdout=log,stderr=subprocess.STDOUT,check=True)
