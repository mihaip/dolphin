000000010001f048 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f048: 53105009    	ubfx	w9, w0, #16, #5
10001f04c: f00036e8    	adrp	x8, 0x1006fe000 <__MergedGlobals+0x370>
10001f050: 911d4108    	add	x8, x8, #0x750
10001f054: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f058: 9104110c    	add	x12, x8, #0x104
10001f05c: b869598b    	ldr	w11, [x12, w9, uxtw #2]
10001f060: b86a5989    	ldr	w9, [x12, w10, uxtw #2]
10001f064: b941990a    	ldr	w10, [x8, #0x198]
10001f068: 1203014c    	and	w12, w10, #0x20000000
10001f06c: 0b0b0129    	add	w9, w9, w11
10001f070: 0b4c7529    	add	w9, w9, w12, lsr #29
10001f074: 6b0b013f    	cmp	w9, w11
10001f078: 54000143    	b.lo	0x10001f0a0 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)+0x58>
10001f07c: 7100019f    	cmp	w12, #0x0
10001f080: 7a4b1120    	ccmp	w9, w11, #0x0, ne
10001f084: 540000e0    	b.eq	0x10001f0a0 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)+0x58>
10001f088: 1202794a    	and	w10, w10, #0xdfffffff
10001f08c: b901990a    	str	w10, [x8, #0x198]
10001f090: 5315640a    	ubfx	w10, w0, #21, #5
10001f094: 8b2a4908    	add	x8, x8, w10, uxtw #2
10001f098: b9010509    	str	w9, [x8, #0x104]
10001f09c: d65f03c0    	ret
10001f0a0: 3203014a    	orr	w10, w10, #0x20000000
10001f0a4: b901990a    	str	w10, [x8, #0x198]
10001f0a8: 5315640a    	ubfx	w10, w0, #21, #5
10001f0ac: 8b2a4908    	add	x8, x8, w10, uxtw #2
10001f0b0: b9010509    	str	w9, [x8, #0x104]
10001f0b4: d65f03c0    	ret

000000010001f0b8 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f0b8: 53105009    	ubfx	w9, w0, #16, #5
10001f0bc: f00036e8    	adrp	x8, 0x1006fe000 <__MergedGlobals+0x370>
10001f0c0: 911d4108    	add	x8, x8, #0x750
10001f0c4: 530b3c0b    	ubfx	w11, w0, #11, #5
10001f0c8: 9104110c    	add	x12, x8, #0x104
10001f0cc: b869598a    	ldr	w10, [x12, w9, uxtw #2]
10001f0d0: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
10001f0d4: b941990c    	ldr	w12, [x8, #0x198]
10001f0d8: 1203018d    	and	w13, w12, #0x20000000
10001f0dc: 0b0a0169    	add	w9, w11, w10
10001f0e0: 0b4d7529    	add	w9, w9, w13, lsr #29
10001f0e4: 6b0a013f    	cmp	w9, w10
10001f0e8: 540000c3    	b.lo	0x10001f100 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)+0x48>
10001f0ec: 710001bf    	cmp	w13, #0x0
10001f0f0: 7a4a1120    	ccmp	w9, w10, #0x0, ne
10001f0f4: 54000060    	b.eq	0x10001f100 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)+0x48>
10001f0f8: 1202798c    	and	w12, w12, #0xdfffffff
10001f0fc: 14000002    	b	0x10001f104 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)+0x4c>
10001f100: 3203018c    	orr	w12, w12, #0x20000000
10001f104: 5315640d    	ubfx	w13, w0, #21, #5
10001f108: 4a0b014b    	eor	w11, w10, w11
10001f10c: 4a0a012a    	eor	w10, w9, w10
10001f110: 1201798e    	and	w14, w12, #0xbfffffff
10001f114: 3202058c    	orr	w12, w12, #0xc0000000
10001f118: 6a2b015f    	bics	wzr, w10, w11
10001f11c: 1a8eb18a    	csel	w10, w12, w14, lt
10001f120: b901990a    	str	w10, [x8, #0x198]
10001f124: 8b2d4908    	add	x8, x8, w13, uxtw #2
10001f128: b9010509    	str	w9, [x8, #0x104]
10001f12c: d65f03c0    	ret

000000010001f130 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f130: 53105009    	ubfx	w9, w0, #16, #5
10001f134: f00036e8    	adrp	x8, 0x1006fe000 <__MergedGlobals+0x370>
10001f138: 911d4108    	add	x8, x8, #0x750
10001f13c: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f140: 9104110c    	add	x12, x8, #0x104
10001f144: b869598b    	ldr	w11, [x12, w9, uxtw #2]
10001f148: b86a5989    	ldr	w9, [x12, w10, uxtw #2]
10001f14c: b941990a    	ldr	w10, [x8, #0x198]
10001f150: 1203014c    	and	w12, w10, #0x20000000
10001f154: 0b0b0129    	add	w9, w9, w11
10001f158: 0b4c7529    	add	w9, w9, w12, lsr #29
10001f15c: 6b0b013f    	cmp	w9, w11
10001f160: 540000c3    	b.lo	0x10001f178 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)+0x48>
10001f164: 7100019f    	cmp	w12, #0x0
10001f168: 7a4b1120    	ccmp	w9, w11, #0x0, ne
10001f16c: 54000060    	b.eq	0x10001f178 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)+0x48>
10001f170: 1202794a    	and	w10, w10, #0xdfffffff
10001f174: 14000002    	b	0x10001f17c <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)+0x4c>
10001f178: 3203014a    	orr	w10, w10, #0x20000000
10001f17c: b901990a    	str	w10, [x8, #0x198]
10001f180: 5315640b    	ubfx	w11, w0, #21, #5
10001f184: b941850c    	ldr	w12, [x8, #0x184]
10001f188: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f18c: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f190: 7100013f    	cmp	w9, #0x0
10001f194: 1a8db1cd    	csel	w13, w14, w13, lt
10001f198: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f19c: 1a8d01cd    	csel	w13, w14, w13, eq
10001f1a0: 33037d4d    	bfxil	w13, w10, #3, #29
10001f1a4: 33006d8d    	bfxil	w13, w12, #0, #28
10001f1a8: b901850d    	str	w13, [x8, #0x184]
10001f1ac: 8b2b4908    	add	x8, x8, w11, uxtw #2
10001f1b0: b9010509    	str	w9, [x8, #0x104]
10001f1b4: d65f03c0    	ret

000000010001f1b8 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f1b8: 53105009    	ubfx	w9, w0, #16, #5
10001f1bc: f00036e8    	adrp	x8, 0x1006fe000 <__MergedGlobals+0x370>
10001f1c0: 911d4108    	add	x8, x8, #0x750
10001f1c4: 530b3c0b    	ubfx	w11, w0, #11, #5
10001f1c8: 9104110c    	add	x12, x8, #0x104
10001f1cc: b869598a    	ldr	w10, [x12, w9, uxtw #2]
10001f1d0: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
10001f1d4: b941990c    	ldr	w12, [x8, #0x198]
10001f1d8: 1203018d    	and	w13, w12, #0x20000000
10001f1dc: 0b0a0169    	add	w9, w11, w10
10001f1e0: 0b4d7529    	add	w9, w9, w13, lsr #29
10001f1e4: 6b0a013f    	cmp	w9, w10
10001f1e8: 540000c3    	b.lo	0x10001f200 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)+0x48>
10001f1ec: 710001bf    	cmp	w13, #0x0
10001f1f0: 7a4a1120    	ccmp	w9, w10, #0x0, ne
10001f1f4: 54000060    	b.eq	0x10001f200 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)+0x48>
10001f1f8: 1202798c    	and	w12, w12, #0xdfffffff
10001f1fc: 14000002    	b	0x10001f204 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)+0x4c>
10001f200: 3203018c    	orr	w12, w12, #0x20000000
10001f204: 5315640d    	ubfx	w13, w0, #21, #5
10001f208: 4a0b014b    	eor	w11, w10, w11
10001f20c: 4a0a012a    	eor	w10, w9, w10
10001f210: 1201798e    	and	w14, w12, #0xbfffffff
10001f214: 3202058c    	orr	w12, w12, #0xc0000000
10001f218: 6a2b015f    	bics	wzr, w10, w11
10001f21c: 1a8eb18a    	csel	w10, w12, w14, lt
10001f220: b901990a    	str	w10, [x8, #0x198]
10001f224: b941850b    	ldr	w11, [x8, #0x184]
10001f228: 52a8000c    	mov	w12, #0x40000000        ; =1073741824
10001f22c: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f230: 7100013f    	cmp	w9, #0x0
10001f234: 1a8cb1cc    	csel	w12, w14, w12, lt
10001f238: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f23c: 1a8c01cc    	csel	w12, w14, w12, eq
10001f240: 33006d6c    	bfxil	w12, w11, #0, #28
10001f244: 531f7d4a    	lsr	w10, w10, #31
10001f248: 2a0a718a    	orr	w10, w12, w10, lsl #28
10001f24c: b901850a    	str	w10, [x8, #0x184]
10001f250: 8b2d4908    	add	x8, x8, w13, uxtw #2
10001f254: b9010509    	str	w9, [x8, #0x104]
10001f258: d65f03c0    	ret
