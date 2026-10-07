0000000100067fa8 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
100067fa8: 53105009    	ubfx	w9, w0, #16, #5
100067fac: f0003748    	adrp	x8, 0x100752000 <__MergedGlobals+0x110>
100067fb0: 91306108    	add	x8, x8, #0xc18
100067fb4: 530b3c0a    	ubfx	w10, w0, #11, #5
100067fb8: 9104110c    	add	x12, x8, #0x104
100067fbc: b869598b    	ldr	w11, [x12, w9, uxtw #2]
100067fc0: b86a5989    	ldr	w9, [x12, w10, uxtw #2]
100067fc4: b941990a    	ldr	w10, [x8, #0x198]
100067fc8: 1203014c    	and	w12, w10, #0x20000000
100067fcc: 0b0b0129    	add	w9, w9, w11
100067fd0: 0b4c7529    	add	w9, w9, w12, lsr #29
100067fd4: 6b0b013f    	cmp	w9, w11
100067fd8: 54000143    	b.lo	0x100068000 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)+0x58>
100067fdc: 7100019f    	cmp	w12, #0x0
100067fe0: 7a4b1120    	ccmp	w9, w11, #0x0, ne
100067fe4: 540000e0    	b.eq	0x100068000 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)+0x58>
100067fe8: 1202794a    	and	w10, w10, #0xdfffffff
100067fec: b901990a    	str	w10, [x8, #0x198]
100067ff0: 5315640a    	ubfx	w10, w0, #21, #5
100067ff4: 8b2a4908    	add	x8, x8, w10, uxtw #2
100067ff8: b9010509    	str	w9, [x8, #0x104]
100067ffc: d65f03c0    	ret
100068000: 3203014a    	orr	w10, w10, #0x20000000
100068004: b901990a    	str	w10, [x8, #0x198]
100068008: 5315640a    	ubfx	w10, w0, #21, #5
10006800c: 8b2a4908    	add	x8, x8, w10, uxtw #2
100068010: b9010509    	str	w9, [x8, #0x104]
100068014: d65f03c0    	ret

0000000100068018 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)>:
100068018: 53105009    	ubfx	w9, w0, #16, #5
10006801c: d0003748    	adrp	x8, 0x100752000 <__MergedGlobals+0x110>
100068020: 91306108    	add	x8, x8, #0xc18
100068024: 530b3c0b    	ubfx	w11, w0, #11, #5
100068028: 9104110c    	add	x12, x8, #0x104
10006802c: b869598a    	ldr	w10, [x12, w9, uxtw #2]
100068030: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
100068034: b941990c    	ldr	w12, [x8, #0x198]
100068038: 1203018d    	and	w13, w12, #0x20000000
10006803c: 0b0a0169    	add	w9, w11, w10
100068040: 0b4d7529    	add	w9, w9, w13, lsr #29
100068044: 6b0a013f    	cmp	w9, w10
100068048: 540000c3    	b.lo	0x100068060 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)+0x48>
10006804c: 710001bf    	cmp	w13, #0x0
100068050: 7a4a1120    	ccmp	w9, w10, #0x0, ne
100068054: 54000060    	b.eq	0x100068060 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)+0x48>
100068058: 1202798c    	and	w12, w12, #0xdfffffff
10006805c: 14000002    	b	0x100068064 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)+0x4c>
100068060: 3203018c    	orr	w12, w12, #0x20000000
100068064: 5315640d    	ubfx	w13, w0, #21, #5
100068068: 4a0b014b    	eor	w11, w10, w11
10006806c: 4a0a012a    	eor	w10, w9, w10
100068070: 1201798e    	and	w14, w12, #0xbfffffff
100068074: 3202058c    	orr	w12, w12, #0xc0000000
100068078: 6a2b015f    	bics	wzr, w10, w11
10006807c: 1a8eb18a    	csel	w10, w12, w14, lt
100068080: b901990a    	str	w10, [x8, #0x198]
100068084: 8b2d4908    	add	x8, x8, w13, uxtw #2
100068088: b9010509    	str	w9, [x8, #0x104]
10006808c: d65f03c0    	ret

0000000100068090 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)>:
100068090: 53105009    	ubfx	w9, w0, #16, #5
100068094: d0003748    	adrp	x8, 0x100752000 <__MergedGlobals+0x110>
100068098: 91306108    	add	x8, x8, #0xc18
10006809c: 530b3c0a    	ubfx	w10, w0, #11, #5
1000680a0: 9104110c    	add	x12, x8, #0x104
1000680a4: b869598b    	ldr	w11, [x12, w9, uxtw #2]
1000680a8: b86a5989    	ldr	w9, [x12, w10, uxtw #2]
1000680ac: b941990a    	ldr	w10, [x8, #0x198]
1000680b0: 1203014c    	and	w12, w10, #0x20000000
1000680b4: 0b0b0129    	add	w9, w9, w11
1000680b8: 0b4c7529    	add	w9, w9, w12, lsr #29
1000680bc: 6b0b013f    	cmp	w9, w11
1000680c0: 540000c3    	b.lo	0x1000680d8 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)+0x48>
1000680c4: 7100019f    	cmp	w12, #0x0
1000680c8: 7a4b1120    	ccmp	w9, w11, #0x0, ne
1000680cc: 54000060    	b.eq	0x1000680d8 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)+0x48>
1000680d0: 1202794a    	and	w10, w10, #0xdfffffff
1000680d4: 14000002    	b	0x1000680dc <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)+0x4c>
1000680d8: 3203014a    	orr	w10, w10, #0x20000000
1000680dc: b901990a    	str	w10, [x8, #0x198]
1000680e0: 5315640b    	ubfx	w11, w0, #21, #5
1000680e4: b941850c    	ldr	w12, [x8, #0x184]
1000680e8: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
1000680ec: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
1000680f0: 7100013f    	cmp	w9, #0x0
1000680f4: 1a8db1cd    	csel	w13, w14, w13, lt
1000680f8: 52a4000e    	mov	w14, #0x20000000        ; =536870912
1000680fc: 1a8d01cd    	csel	w13, w14, w13, eq
100068100: 33037d4d    	bfxil	w13, w10, #3, #29
100068104: 33006d8d    	bfxil	w13, w12, #0, #28
100068108: b901850d    	str	w13, [x8, #0x184]
10006810c: 8b2b4908    	add	x8, x8, w11, uxtw #2
100068110: b9010509    	str	w9, [x8, #0x104]
100068114: d65f03c0    	ret

0000000100068118 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)>:
100068118: 53105009    	ubfx	w9, w0, #16, #5
10006811c: d0003748    	adrp	x8, 0x100752000 <__MergedGlobals+0x110>
100068120: 91306108    	add	x8, x8, #0xc18
100068124: 530b3c0b    	ubfx	w11, w0, #11, #5
100068128: 9104110c    	add	x12, x8, #0x104
10006812c: b869598a    	ldr	w10, [x12, w9, uxtw #2]
100068130: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
100068134: b941990c    	ldr	w12, [x8, #0x198]
100068138: 1203018d    	and	w13, w12, #0x20000000
10006813c: 0b0a0169    	add	w9, w11, w10
100068140: 0b4d7529    	add	w9, w9, w13, lsr #29
100068144: 6b0a013f    	cmp	w9, w10
100068148: 540000c3    	b.lo	0x100068160 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)+0x48>
10006814c: 710001bf    	cmp	w13, #0x0
100068150: 7a4a1120    	ccmp	w9, w10, #0x0, ne
100068154: 54000060    	b.eq	0x100068160 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)+0x48>
100068158: 1202798c    	and	w12, w12, #0xdfffffff
10006815c: 14000002    	b	0x100068164 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)+0x4c>
100068160: 3203018c    	orr	w12, w12, #0x20000000
100068164: 5315640d    	ubfx	w13, w0, #21, #5
100068168: 4a0b014b    	eor	w11, w10, w11
10006816c: 4a0a012a    	eor	w10, w9, w10
100068170: 1201798e    	and	w14, w12, #0xbfffffff
100068174: 3202058c    	orr	w12, w12, #0xc0000000
100068178: 6a2b015f    	bics	wzr, w10, w11
10006817c: 1a8eb18a    	csel	w10, w12, w14, lt
100068180: b901990a    	str	w10, [x8, #0x198]
100068184: b941850b    	ldr	w11, [x8, #0x184]
100068188: 52a8000c    	mov	w12, #0x40000000        ; =1073741824
10006818c: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
100068190: 7100013f    	cmp	w9, #0x0
100068194: 1a8cb1cc    	csel	w12, w14, w12, lt
100068198: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10006819c: 1a8c01cc    	csel	w12, w14, w12, eq
1000681a0: 33006d6c    	bfxil	w12, w11, #0, #28
1000681a4: 531f7d4a    	lsr	w10, w10, #31
1000681a8: 2a0a718a    	orr	w10, w12, w10, lsl #28
1000681ac: b901850a    	str	w10, [x8, #0x184]
1000681b0: 8b2d4908    	add	x8, x8, w13, uxtw #2
1000681b4: b9010509    	str	w9, [x8, #0x104]
1000681b8: d65f03c0    	ret
