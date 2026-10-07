000000010001f048 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f048: 53156408    	ubfx	w8, w0, #21, #5
10001f04c: 53105009    	ubfx	w9, w0, #16, #5
10001f050: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f054: f00036eb    	adrp	x11, 0x1006fe000 <__MergedGlobals+0x370>
10001f058: 911d416b    	add	x11, x11, #0x750
10001f05c: 9104116c    	add	x12, x11, #0x104
10001f060: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f064: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f068: b941996d    	ldr	w13, [x11, #0x198]
10001f06c: d35d75ae    	ubfx	x14, x13, #29, #1
10001f070: 0b09014f    	add	w15, w10, w9
10001f074: 0b0e01ef    	add	w15, w15, w14
10001f078: 8b090149    	add	x9, x10, x9
10001f07c: 8b0e0129    	add	x9, x9, x14
10001f080: 120279aa    	and	w10, w13, #0xdfffffff
10001f084: d343fd29    	lsr	x9, x9, #3
10001f088: 12030529    	and	w9, w9, #0x60000000
10001f08c: 2a0a0129    	orr	w9, w9, w10
10001f090: b9019969    	str	w9, [x11, #0x198]
10001f094: b828598f    	str	w15, [x12, w8, uxtw #2]
10001f098: d65f03c0    	ret

000000010001f09c <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f09c: 53156408    	ubfx	w8, w0, #21, #5
10001f0a0: 53105009    	ubfx	w9, w0, #16, #5
10001f0a4: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f0a8: f00036eb    	adrp	x11, 0x1006fe000 <__MergedGlobals+0x370>
10001f0ac: 911d416b    	add	x11, x11, #0x750
10001f0b0: 9104116c    	add	x12, x11, #0x104
10001f0b4: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f0b8: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f0bc: b941996d    	ldr	w13, [x11, #0x198]
10001f0c0: d35d75ae    	ubfx	x14, x13, #29, #1
10001f0c4: 0b09014f    	add	w15, w10, w9
10001f0c8: 0b0e01ef    	add	w15, w15, w14
10001f0cc: 8b090150    	add	x16, x10, x9
10001f0d0: 8b0e020e    	add	x14, x16, x14
10001f0d4: 120279ad    	and	w13, w13, #0xdfffffff
10001f0d8: d343fdce    	lsr	x14, x14, #3
10001f0dc: 120305ce    	and	w14, w14, #0x60000000
10001f0e0: 2a0d01cd    	orr	w13, w14, w13
10001f0e4: 4a0a012a    	eor	w10, w9, w10
10001f0e8: 4a0901e9    	eor	w9, w15, w9
10001f0ec: 120179ae    	and	w14, w13, #0xbfffffff
10001f0f0: 320205ad    	orr	w13, w13, #0xc0000000
10001f0f4: 6a2a013f    	bics	wzr, w9, w10
10001f0f8: 1a8eb1a9    	csel	w9, w13, w14, lt
10001f0fc: b9019969    	str	w9, [x11, #0x198]
10001f100: b828598f    	str	w15, [x12, w8, uxtw #2]
10001f104: d65f03c0    	ret

000000010001f108 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f108: 53156408    	ubfx	w8, w0, #21, #5
10001f10c: 53105009    	ubfx	w9, w0, #16, #5
10001f110: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f114: f00036eb    	adrp	x11, 0x1006fe000 <__MergedGlobals+0x370>
10001f118: 911d416b    	add	x11, x11, #0x750
10001f11c: 9104116c    	add	x12, x11, #0x104
10001f120: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f124: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f128: b941996d    	ldr	w13, [x11, #0x198]
10001f12c: d35d75ae    	ubfx	x14, x13, #29, #1
10001f130: 0b09014f    	add	w15, w10, w9
10001f134: 0b0e01ef    	add	w15, w15, w14
10001f138: 8b090149    	add	x9, x10, x9
10001f13c: 8b0e0129    	add	x9, x9, x14
10001f140: 120279aa    	and	w10, w13, #0xdfffffff
10001f144: d343fd29    	lsr	x9, x9, #3
10001f148: 12030529    	and	w9, w9, #0x60000000
10001f14c: 2a0a0129    	orr	w9, w9, w10
10001f150: b9019969    	str	w9, [x11, #0x198]
10001f154: b9418569    	ldr	w9, [x11, #0x184]
10001f158: 52a8000a    	mov	w10, #0x40000000        ; =1073741824
10001f15c: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f160: 710001ff    	cmp	w15, #0x0
10001f164: 1a8ab1ca    	csel	w10, w14, w10, lt
10001f168: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f16c: 1a8a01ca    	csel	w10, w14, w10, eq
10001f170: 12006d29    	and	w9, w9, #0xfffffff
10001f174: 531f7dad    	lsr	w13, w13, #31
10001f178: 2a0d7129    	orr	w9, w9, w13, lsl #28
10001f17c: 2a0a0129    	orr	w9, w9, w10
10001f180: b9018569    	str	w9, [x11, #0x184]
10001f184: b828598f    	str	w15, [x12, w8, uxtw #2]
10001f188: d65f03c0    	ret

000000010001f18c <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f18c: 53156408    	ubfx	w8, w0, #21, #5
10001f190: 53105009    	ubfx	w9, w0, #16, #5
10001f194: f00036ea    	adrp	x10, 0x1006fe000 <__MergedGlobals+0x370>
10001f198: 911d414a    	add	x10, x10, #0x750
10001f19c: 530b3c0b    	ubfx	w11, w0, #11, #5
10001f1a0: 9104114c    	add	x12, x10, #0x104
10001f1a4: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f1a8: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
10001f1ac: b941994d    	ldr	w13, [x10, #0x198]
10001f1b0: d35d75ae    	ubfx	x14, x13, #29, #1
10001f1b4: 0b09016f    	add	w15, w11, w9
10001f1b8: 0b0e01ef    	add	w15, w15, w14
10001f1bc: 8b090170    	add	x16, x11, x9
10001f1c0: 8b0e020e    	add	x14, x16, x14
10001f1c4: 120279ad    	and	w13, w13, #0xdfffffff
10001f1c8: d343fdce    	lsr	x14, x14, #3
10001f1cc: 120305ce    	and	w14, w14, #0x60000000
10001f1d0: 2a0d01cd    	orr	w13, w14, w13
10001f1d4: 4a0b012b    	eor	w11, w9, w11
10001f1d8: 4a0901e9    	eor	w9, w15, w9
10001f1dc: 120179ae    	and	w14, w13, #0xbfffffff
10001f1e0: 320205ad    	orr	w13, w13, #0xc0000000
10001f1e4: 6a2b013f    	bics	wzr, w9, w11
10001f1e8: 1a8eb1a9    	csel	w9, w13, w14, lt
10001f1ec: b9019949    	str	w9, [x10, #0x198]
10001f1f0: b941854b    	ldr	w11, [x10, #0x184]
10001f1f4: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f1f8: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f1fc: 710001ff    	cmp	w15, #0x0
10001f200: 1a8db1cd    	csel	w13, w14, w13, lt
10001f204: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f208: 1a8d01cd    	csel	w13, w14, w13, eq
10001f20c: 33006d6d    	bfxil	w13, w11, #0, #28
10001f210: 531f7d29    	lsr	w9, w9, #31
10001f214: 2a0971a9    	orr	w9, w13, w9, lsl #28
10001f218: b9018549    	str	w9, [x10, #0x184]
10001f21c: b828598f    	str	w15, [x12, w8, uxtw #2]
10001f220: d65f03c0    	ret
