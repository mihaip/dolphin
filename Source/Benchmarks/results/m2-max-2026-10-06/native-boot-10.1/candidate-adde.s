0000000100067fa8 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
100067fa8: 53156408    	ubfx	w8, w0, #21, #5
100067fac: 53105009    	ubfx	w9, w0, #16, #5
100067fb0: 530b3c0a    	ubfx	w10, w0, #11, #5
100067fb4: f000374b    	adrp	x11, 0x100752000 <__MergedGlobals+0x110>
100067fb8: 9130616b    	add	x11, x11, #0xc18
100067fbc: 9104116c    	add	x12, x11, #0x104
100067fc0: b8695989    	ldr	w9, [x12, w9, uxtw #2]
100067fc4: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
100067fc8: b941996d    	ldr	w13, [x11, #0x198]
100067fcc: d35d75ae    	ubfx	x14, x13, #29, #1
100067fd0: 0b09014f    	add	w15, w10, w9
100067fd4: 0b0e01ef    	add	w15, w15, w14
100067fd8: 8b090149    	add	x9, x10, x9
100067fdc: 8b0e0129    	add	x9, x9, x14
100067fe0: 120279aa    	and	w10, w13, #0xdfffffff
100067fe4: d343fd29    	lsr	x9, x9, #3
100067fe8: 12030529    	and	w9, w9, #0x60000000
100067fec: 2a0a0129    	orr	w9, w9, w10
100067ff0: b9019969    	str	w9, [x11, #0x198]
100067ff4: b828598f    	str	w15, [x12, w8, uxtw #2]
100067ff8: d65f03c0    	ret

0000000100067ffc <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)>:
100067ffc: 53156408    	ubfx	w8, w0, #21, #5
100068000: 53105009    	ubfx	w9, w0, #16, #5
100068004: 530b3c0a    	ubfx	w10, w0, #11, #5
100068008: d000374b    	adrp	x11, 0x100752000 <__MergedGlobals+0x110>
10006800c: 9130616b    	add	x11, x11, #0xc18
100068010: 9104116c    	add	x12, x11, #0x104
100068014: b8695989    	ldr	w9, [x12, w9, uxtw #2]
100068018: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10006801c: b941996d    	ldr	w13, [x11, #0x198]
100068020: d35d75ae    	ubfx	x14, x13, #29, #1
100068024: 0b09014f    	add	w15, w10, w9
100068028: 0b0e01ef    	add	w15, w15, w14
10006802c: 8b090150    	add	x16, x10, x9
100068030: 8b0e020e    	add	x14, x16, x14
100068034: 120279ad    	and	w13, w13, #0xdfffffff
100068038: d343fdce    	lsr	x14, x14, #3
10006803c: 120305ce    	and	w14, w14, #0x60000000
100068040: 2a0d01cd    	orr	w13, w14, w13
100068044: 4a0a012a    	eor	w10, w9, w10
100068048: 4a0901e9    	eor	w9, w15, w9
10006804c: 120179ae    	and	w14, w13, #0xbfffffff
100068050: 320205ad    	orr	w13, w13, #0xc0000000
100068054: 6a2a013f    	bics	wzr, w9, w10
100068058: 1a8eb1a9    	csel	w9, w13, w14, lt
10006805c: b9019969    	str	w9, [x11, #0x198]
100068060: b828598f    	str	w15, [x12, w8, uxtw #2]
100068064: d65f03c0    	ret

0000000100068068 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)>:
100068068: 53156408    	ubfx	w8, w0, #21, #5
10006806c: 53105009    	ubfx	w9, w0, #16, #5
100068070: 530b3c0a    	ubfx	w10, w0, #11, #5
100068074: d000374b    	adrp	x11, 0x100752000 <__MergedGlobals+0x110>
100068078: 9130616b    	add	x11, x11, #0xc18
10006807c: 9104116c    	add	x12, x11, #0x104
100068080: b8695989    	ldr	w9, [x12, w9, uxtw #2]
100068084: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
100068088: b941996d    	ldr	w13, [x11, #0x198]
10006808c: d35d75ae    	ubfx	x14, x13, #29, #1
100068090: 0b09014f    	add	w15, w10, w9
100068094: 0b0e01ef    	add	w15, w15, w14
100068098: 8b090149    	add	x9, x10, x9
10006809c: 8b0e0129    	add	x9, x9, x14
1000680a0: 120279aa    	and	w10, w13, #0xdfffffff
1000680a4: d343fd29    	lsr	x9, x9, #3
1000680a8: 12030529    	and	w9, w9, #0x60000000
1000680ac: 2a0a0129    	orr	w9, w9, w10
1000680b0: b9019969    	str	w9, [x11, #0x198]
1000680b4: b9418569    	ldr	w9, [x11, #0x184]
1000680b8: 52a8000a    	mov	w10, #0x40000000        ; =1073741824
1000680bc: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
1000680c0: 710001ff    	cmp	w15, #0x0
1000680c4: 1a8ab1ca    	csel	w10, w14, w10, lt
1000680c8: 52a4000e    	mov	w14, #0x20000000        ; =536870912
1000680cc: 1a8a01ca    	csel	w10, w14, w10, eq
1000680d0: 12006d29    	and	w9, w9, #0xfffffff
1000680d4: 531f7dad    	lsr	w13, w13, #31
1000680d8: 2a0d7129    	orr	w9, w9, w13, lsl #28
1000680dc: 2a0a0129    	orr	w9, w9, w10
1000680e0: b9018569    	str	w9, [x11, #0x184]
1000680e4: b828598f    	str	w15, [x12, w8, uxtw #2]
1000680e8: d65f03c0    	ret

00000001000680ec <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)>:
1000680ec: 53156408    	ubfx	w8, w0, #21, #5
1000680f0: 53105009    	ubfx	w9, w0, #16, #5
1000680f4: d000374a    	adrp	x10, 0x100752000 <__MergedGlobals+0x110>
1000680f8: 9130614a    	add	x10, x10, #0xc18
1000680fc: 530b3c0b    	ubfx	w11, w0, #11, #5
100068100: 9104114c    	add	x12, x10, #0x104
100068104: b8695989    	ldr	w9, [x12, w9, uxtw #2]
100068108: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
10006810c: b941994d    	ldr	w13, [x10, #0x198]
100068110: d35d75ae    	ubfx	x14, x13, #29, #1
100068114: 0b09016f    	add	w15, w11, w9
100068118: 0b0e01ef    	add	w15, w15, w14
10006811c: 8b090170    	add	x16, x11, x9
100068120: 8b0e020e    	add	x14, x16, x14
100068124: 120279ad    	and	w13, w13, #0xdfffffff
100068128: d343fdce    	lsr	x14, x14, #3
10006812c: 120305ce    	and	w14, w14, #0x60000000
100068130: 2a0d01cd    	orr	w13, w14, w13
100068134: 4a0b012b    	eor	w11, w9, w11
100068138: 4a0901e9    	eor	w9, w15, w9
10006813c: 120179ae    	and	w14, w13, #0xbfffffff
100068140: 320205ad    	orr	w13, w13, #0xc0000000
100068144: 6a2b013f    	bics	wzr, w9, w11
100068148: 1a8eb1a9    	csel	w9, w13, w14, lt
10006814c: b9019949    	str	w9, [x10, #0x198]
100068150: b941854b    	ldr	w11, [x10, #0x184]
100068154: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
100068158: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10006815c: 710001ff    	cmp	w15, #0x0
100068160: 1a8db1cd    	csel	w13, w14, w13, lt
100068164: 52a4000e    	mov	w14, #0x20000000        ; =536870912
100068168: 1a8d01cd    	csel	w13, w14, w13, eq
10006816c: 33006d6d    	bfxil	w13, w11, #0, #28
100068170: 531f7d29    	lsr	w9, w9, #31
100068174: 2a0971a9    	orr	w9, w13, w9, lsl #28
100068178: b9018549    	str	w9, [x10, #0x184]
10006817c: b828598f    	str	w15, [x12, w8, uxtw #2]
100068180: d65f03c0    	ret
