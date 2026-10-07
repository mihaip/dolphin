000000010001f048 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f048: 53105008    	ubfx	w8, w0, #16, #5
10001f04c: f00036e9    	adrp	x9, 0x1006fe000 <__MergedGlobals+0x370>
10001f050: 911d4129    	add	x9, x9, #0x750
10001f054: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f058: 9104112b    	add	x11, x9, #0x104
10001f05c: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f060: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f064: 5315640c    	ubfx	w12, w0, #21, #5
10001f068: b941992d    	ldr	w13, [x9, #0x198]
10001f06c: d35d75ae    	ubfx	x14, x13, #29, #1
10001f070: 8b080148    	add	x8, x10, x8
10001f074: 8b0e0108    	add	x8, x8, x14
10001f078: 120279aa    	and	w10, w13, #0xdfffffff
10001f07c: d343fd0d    	lsr	x13, x8, #3
10001f080: 120305ad    	and	w13, w13, #0x60000000
10001f084: 2a0a01aa    	orr	w10, w13, w10
10001f088: b901992a    	str	w10, [x9, #0x198]
10001f08c: b82c5968    	str	w8, [x11, w12, uxtw #2]
10001f090: d65f03c0    	ret

000000010001f094 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f094: 53105008    	ubfx	w8, w0, #16, #5
10001f098: f00036e9    	adrp	x9, 0x1006fe000 <__MergedGlobals+0x370>
10001f09c: 911d4129    	add	x9, x9, #0x750
10001f0a0: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f0a4: 9104112b    	add	x11, x9, #0x104
10001f0a8: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f0ac: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f0b0: 5315640c    	ubfx	w12, w0, #21, #5
10001f0b4: b941992d    	ldr	w13, [x9, #0x198]
10001f0b8: d35d75ae    	ubfx	x14, x13, #29, #1
10001f0bc: 8b08014f    	add	x15, x10, x8
10001f0c0: 8b0e01ee    	add	x14, x15, x14
10001f0c4: 120279ad    	and	w13, w13, #0xdfffffff
10001f0c8: d343fdcf    	lsr	x15, x14, #3
10001f0cc: 120305ef    	and	w15, w15, #0x60000000
10001f0d0: 2a0d01ed    	orr	w13, w15, w13
10001f0d4: 4a0a010a    	eor	w10, w8, w10
10001f0d8: 4a0e0108    	eor	w8, w8, w14
10001f0dc: 120179af    	and	w15, w13, #0xbfffffff
10001f0e0: 320205ad    	orr	w13, w13, #0xc0000000
10001f0e4: 6a2a011f    	bics	wzr, w8, w10
10001f0e8: 1a8fb1a8    	csel	w8, w13, w15, lt
10001f0ec: b9019928    	str	w8, [x9, #0x198]
10001f0f0: b82c596e    	str	w14, [x11, w12, uxtw #2]
10001f0f4: d65f03c0    	ret

000000010001f0f8 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f0f8: 53105008    	ubfx	w8, w0, #16, #5
10001f0fc: f00036e9    	adrp	x9, 0x1006fe000 <__MergedGlobals+0x370>
10001f100: 911d4129    	add	x9, x9, #0x750
10001f104: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f108: 9104112b    	add	x11, x9, #0x104
10001f10c: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f110: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f114: 5315640c    	ubfx	w12, w0, #21, #5
10001f118: b941992d    	ldr	w13, [x9, #0x198]
10001f11c: d35d75ae    	ubfx	x14, x13, #29, #1
10001f120: 8b080148    	add	x8, x10, x8
10001f124: 8b0e0108    	add	x8, x8, x14
10001f128: 120279aa    	and	w10, w13, #0xdfffffff
10001f12c: d343fd0e    	lsr	x14, x8, #3
10001f130: 120305ce    	and	w14, w14, #0x60000000
10001f134: 2a0a01ca    	orr	w10, w14, w10
10001f138: b901992a    	str	w10, [x9, #0x198]
10001f13c: b941852a    	ldr	w10, [x9, #0x184]
10001f140: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001f144: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f148: 7100011f    	cmp	w8, #0x0
10001f14c: 1a8eb1ee    	csel	w14, w15, w14, lt
10001f150: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f154: 1a8e01ee    	csel	w14, w15, w14, eq
10001f158: 12006d4a    	and	w10, w10, #0xfffffff
10001f15c: 531f7dad    	lsr	w13, w13, #31
10001f160: 2a0d714a    	orr	w10, w10, w13, lsl #28
10001f164: 2a0e014a    	orr	w10, w10, w14
10001f168: b901852a    	str	w10, [x9, #0x184]
10001f16c: b82c5968    	str	w8, [x11, w12, uxtw #2]
10001f170: d65f03c0    	ret

000000010001f174 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f174: 53156408    	ubfx	w8, w0, #21, #5
10001f178: 53105009    	ubfx	w9, w0, #16, #5
10001f17c: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f180: f00036eb    	adrp	x11, 0x1006fe000 <__MergedGlobals+0x370>
10001f184: 911d416b    	add	x11, x11, #0x750
10001f188: 9104116c    	add	x12, x11, #0x104
10001f18c: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f190: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f194: b941996d    	ldr	w13, [x11, #0x198]
10001f198: d35d75ae    	ubfx	x14, x13, #29, #1
10001f19c: 8b09014f    	add	x15, x10, x9
10001f1a0: 8b0e01ee    	add	x14, x15, x14
10001f1a4: 120279ad    	and	w13, w13, #0xdfffffff
10001f1a8: d343fdcf    	lsr	x15, x14, #3
10001f1ac: 120305ef    	and	w15, w15, #0x60000000
10001f1b0: 2a0d01ed    	orr	w13, w15, w13
10001f1b4: 4a0a012a    	eor	w10, w9, w10
10001f1b8: 4a0e0129    	eor	w9, w9, w14
10001f1bc: 120179af    	and	w15, w13, #0xbfffffff
10001f1c0: 320205ad    	orr	w13, w13, #0xc0000000
10001f1c4: 6a2a013f    	bics	wzr, w9, w10
10001f1c8: 1a8fb1a9    	csel	w9, w13, w15, lt
10001f1cc: b9019969    	str	w9, [x11, #0x198]
10001f1d0: b941856a    	ldr	w10, [x11, #0x184]
10001f1d4: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f1d8: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f1dc: 710001df    	cmp	w14, #0x0
10001f1e0: 1a8db1ed    	csel	w13, w15, w13, lt
10001f1e4: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f1e8: 1a8d01ed    	csel	w13, w15, w13, eq
10001f1ec: 33006d4d    	bfxil	w13, w10, #0, #28
10001f1f0: 531f7d29    	lsr	w9, w9, #31
10001f1f4: 2a0971a9    	orr	w9, w13, w9, lsl #28
10001f1f8: b9018569    	str	w9, [x11, #0x184]
10001f1fc: b828598e    	str	w14, [x12, w8, uxtw #2]
10001f200: d65f03c0    	ret
