000000010001ecd4 <void dppc_interpreter::ppc_addic<(field_rc)0>(unsigned int)>:
10001ecd4: 53156408    	ubfx	w8, w0, #21, #5
10001ecd8: 53105009    	ubfx	w9, w0, #16, #5
10001ecdc: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ece0: 911d414a    	add	x10, x10, #0x750
10001ece4: 13003c0b    	sxth	w11, w0
10001ece8: 9104114c    	add	x12, x10, #0x104
10001ecec: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001ecf0: 8b0b0129    	add	x9, x9, x11
10001ecf4: b941994b    	ldr	w11, [x10, #0x198]
10001ecf8: d343fd2d    	lsr	x13, x9, #3
10001ecfc: 531d7dad    	lsr	w13, w13, #29
10001ed00: 330301ab    	bfi	w11, w13, #29, #1
10001ed04: b901994b    	str	w11, [x10, #0x198]
10001ed08: b8285989    	str	w9, [x12, w8, uxtw #2]
10001ed0c: d65f03c0    	ret

000000010001ed10 <void dppc_interpreter::ppc_addic<(field_rc)1>(unsigned int)>:
10001ed10: 53156408    	ubfx	w8, w0, #21, #5
10001ed14: 53105009    	ubfx	w9, w0, #16, #5
10001ed18: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ed1c: 911d414a    	add	x10, x10, #0x750
10001ed20: 13003c0b    	sxth	w11, w0
10001ed24: 9104114c    	add	x12, x10, #0x104
10001ed28: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001ed2c: 8b0b0129    	add	x9, x9, x11
10001ed30: b941994b    	ldr	w11, [x10, #0x198]
10001ed34: d343fd2d    	lsr	x13, x9, #3
10001ed38: 531d7dad    	lsr	w13, w13, #29
10001ed3c: 531f7d6e    	lsr	w14, w11, #31
10001ed40: 330301ab    	bfi	w11, w13, #29, #1
10001ed44: b901994b    	str	w11, [x10, #0x198]
10001ed48: b941854b    	ldr	w11, [x10, #0x184]
10001ed4c: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001ed50: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001ed54: 7100013f    	cmp	w9, #0x0
10001ed58: 1a8db1ed    	csel	w13, w15, w13, lt
10001ed5c: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001ed60: 1a8d01ed    	csel	w13, w15, w13, eq
10001ed64: 12006d6b    	and	w11, w11, #0xfffffff
10001ed68: 2a0e716b    	orr	w11, w11, w14, lsl #28
10001ed6c: 2a0d016b    	orr	w11, w11, w13
10001ed70: b901854b    	str	w11, [x10, #0x184]
10001ed74: b8285989    	str	w9, [x12, w8, uxtw #2]
10001ed78: d65f03c0    	ret

000000010001ed7c <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)0, (field_ov)0>(unsigned int)>:
10001ed7c: 53156408    	ubfx	w8, w0, #21, #5
10001ed80: 53105009    	ubfx	w9, w0, #16, #5
10001ed84: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ed88: 911d414a    	add	x10, x10, #0x750
10001ed8c: 9104114a    	add	x10, x10, #0x104
10001ed90: b8695949    	ldr	w9, [x10, w9, uxtw #2]
10001ed94: 530b3c0b    	ubfx	w11, w0, #11, #5
10001ed98: b86b594b    	ldr	w11, [x10, w11, uxtw #2]
10001ed9c: 0b090169    	add	w9, w11, w9
10001eda0: b8285949    	str	w9, [x10, w8, uxtw #2]
10001eda4: d65f03c0    	ret

000000010001eda8 <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)1, (field_ov)0>(unsigned int)>:
10001eda8: 53156408    	ubfx	w8, w0, #21, #5
10001edac: 53105009    	ubfx	w9, w0, #16, #5
10001edb0: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001edb4: 911d414a    	add	x10, x10, #0x750
10001edb8: 9104114b    	add	x11, x10, #0x104
10001edbc: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001edc0: 530b3c0c    	ubfx	w12, w0, #11, #5
10001edc4: b86c596c    	ldr	w12, [x11, w12, uxtw #2]
10001edc8: 0b090189    	add	w9, w12, w9
10001edcc: b941854c    	ldr	w12, [x10, #0x184]
10001edd0: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001edd4: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001edd8: 7100013f    	cmp	w9, #0x0
10001eddc: 1a8db1cd    	csel	w13, w14, w13, lt
10001ede0: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001ede4: 1a8d01cd    	csel	w13, w14, w13, eq
10001ede8: 33006d8d    	bfxil	w13, w12, #0, #28
10001edec: b941994c    	ldr	w12, [x10, #0x198]
10001edf0: 531f7d8c    	lsr	w12, w12, #31
10001edf4: 2a0c71ac    	orr	w12, w13, w12, lsl #28
10001edf8: b901854c    	str	w12, [x10, #0x184]
10001edfc: b8285969    	str	w9, [x11, w8, uxtw #2]
10001ee00: d65f03c0    	ret

000000010001ee04 <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)0, (field_ov)1>(unsigned int)>:
10001ee04: 53105008    	ubfx	w8, w0, #16, #5
10001ee08: 90003689    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001ee0c: 911d4129    	add	x9, x9, #0x750
10001ee10: 530b3c0a    	ubfx	w10, w0, #11, #5
10001ee14: 9104112b    	add	x11, x9, #0x104
10001ee18: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001ee1c: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001ee20: 5315640c    	ubfx	w12, w0, #21, #5
10001ee24: 4a0a010d    	eor	w13, w8, w10
10001ee28: 0b08014a    	add	w10, w10, w8
10001ee2c: 4a080148    	eor	w8, w10, w8
10001ee30: b941992e    	ldr	w14, [x9, #0x198]
10001ee34: 120179cf    	and	w15, w14, #0xbfffffff
10001ee38: 320205ce    	orr	w14, w14, #0xc0000000
10001ee3c: 6a2d011f    	bics	wzr, w8, w13
10001ee40: 1a8fb1c8    	csel	w8, w14, w15, lt
10001ee44: b9019928    	str	w8, [x9, #0x198]
10001ee48: b82c596a    	str	w10, [x11, w12, uxtw #2]
10001ee4c: d65f03c0    	ret

000000010001ee50 <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)1, (field_ov)1>(unsigned int)>:
10001ee50: 53156408    	ubfx	w8, w0, #21, #5
10001ee54: 53105009    	ubfx	w9, w0, #16, #5
10001ee58: 530b3c0a    	ubfx	w10, w0, #11, #5
10001ee5c: 9000368b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001ee60: 911d416b    	add	x11, x11, #0x750
10001ee64: 9104116c    	add	x12, x11, #0x104
10001ee68: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001ee6c: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001ee70: 4a0a012d    	eor	w13, w9, w10
10001ee74: 0b09014a    	add	w10, w10, w9
10001ee78: 4a090149    	eor	w9, w10, w9
10001ee7c: b941996e    	ldr	w14, [x11, #0x198]
10001ee80: 120179cf    	and	w15, w14, #0xbfffffff
10001ee84: 320205ce    	orr	w14, w14, #0xc0000000
10001ee88: 6a2d013f    	bics	wzr, w9, w13
10001ee8c: 1a8fb1c9    	csel	w9, w14, w15, lt
10001ee90: b9019969    	str	w9, [x11, #0x198]
10001ee94: b941856d    	ldr	w13, [x11, #0x184]
10001ee98: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001ee9c: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001eea0: 7100015f    	cmp	w10, #0x0
10001eea4: 1a8eb1ee    	csel	w14, w15, w14, lt
10001eea8: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001eeac: 1a8e01ee    	csel	w14, w15, w14, eq
10001eeb0: 33006dae    	bfxil	w14, w13, #0, #28
10001eeb4: 531f7d29    	lsr	w9, w9, #31
10001eeb8: 2a0971c9    	orr	w9, w14, w9, lsl #28
10001eebc: b9018569    	str	w9, [x11, #0x184]
10001eec0: b828598a    	str	w10, [x12, w8, uxtw #2]
10001eec4: d65f03c0    	ret

000000010001eec8 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)0, (field_ov)0>(unsigned int)>:
10001eec8: 53156408    	ubfx	w8, w0, #21, #5
10001eecc: 53105009    	ubfx	w9, w0, #16, #5
10001eed0: 530b3c0a    	ubfx	w10, w0, #11, #5
10001eed4: 9000368b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001eed8: 911d416b    	add	x11, x11, #0x750
10001eedc: 9104116c    	add	x12, x11, #0x104
10001eee0: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001eee4: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001eee8: 8b090149    	add	x9, x10, x9
10001eeec: b941996a    	ldr	w10, [x11, #0x198]
10001eef0: d343fd2d    	lsr	x13, x9, #3
10001eef4: 531d7dad    	lsr	w13, w13, #29
10001eef8: 330301aa    	bfi	w10, w13, #29, #1
10001eefc: b901996a    	str	w10, [x11, #0x198]
10001ef00: b8285989    	str	w9, [x12, w8, uxtw #2]
10001ef04: d65f03c0    	ret

000000010001ef08 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)1, (field_ov)0>(unsigned int)>:
10001ef08: 53156408    	ubfx	w8, w0, #21, #5
10001ef0c: 53105009    	ubfx	w9, w0, #16, #5
10001ef10: 530b3c0a    	ubfx	w10, w0, #11, #5
10001ef14: 9000368b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001ef18: 911d416b    	add	x11, x11, #0x750
10001ef1c: 9104116c    	add	x12, x11, #0x104
10001ef20: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001ef24: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001ef28: 8b090149    	add	x9, x10, x9
10001ef2c: b941996a    	ldr	w10, [x11, #0x198]
10001ef30: d343fd2d    	lsr	x13, x9, #3
10001ef34: 531d7dad    	lsr	w13, w13, #29
10001ef38: 531f7d4e    	lsr	w14, w10, #31
10001ef3c: 330301aa    	bfi	w10, w13, #29, #1
10001ef40: b901996a    	str	w10, [x11, #0x198]
10001ef44: b941856a    	ldr	w10, [x11, #0x184]
10001ef48: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001ef4c: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001ef50: 7100013f    	cmp	w9, #0x0
10001ef54: 1a8db1ed    	csel	w13, w15, w13, lt
10001ef58: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001ef5c: 1a8d01ed    	csel	w13, w15, w13, eq
10001ef60: 12006d4a    	and	w10, w10, #0xfffffff
10001ef64: 2a0e714a    	orr	w10, w10, w14, lsl #28
10001ef68: 2a0d014a    	orr	w10, w10, w13
10001ef6c: b901856a    	str	w10, [x11, #0x184]
10001ef70: b8285989    	str	w9, [x12, w8, uxtw #2]
10001ef74: d65f03c0    	ret

000000010001ef78 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)0, (field_ov)1>(unsigned int)>:
10001ef78: 53105008    	ubfx	w8, w0, #16, #5
10001ef7c: 90003689    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001ef80: 911d4129    	add	x9, x9, #0x750
10001ef84: 9104112a    	add	x10, x9, #0x104
10001ef88: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001ef8c: 530b3c0b    	ubfx	w11, w0, #11, #5
10001ef90: b86b594b    	ldr	w11, [x10, w11, uxtw #2]
10001ef94: b941992c    	ldr	w12, [x9, #0x198]
10001ef98: 8b08016d    	add	x13, x11, x8
10001ef9c: 4a0d010e    	eor	w14, w8, w13
10001efa0: d343fdaf    	lsr	x15, x13, #3
10001efa4: 531d7def    	lsr	w15, w15, #29
10001efa8: 330301ec    	bfi	w12, w15, #29, #1
10001efac: 5315640f    	ubfx	w15, w0, #21, #5
10001efb0: 4a0b0108    	eor	w8, w8, w11
10001efb4: 1201798b    	and	w11, w12, #0xbfffffff
10001efb8: 3202058c    	orr	w12, w12, #0xc0000000
10001efbc: 6a2801df    	bics	wzr, w14, w8
10001efc0: 1a8bb188    	csel	w8, w12, w11, lt
10001efc4: b9019928    	str	w8, [x9, #0x198]
10001efc8: b82f594d    	str	w13, [x10, w15, uxtw #2]
10001efcc: d65f03c0    	ret

000000010001efd0 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)1, (field_ov)1>(unsigned int)>:
10001efd0: 53105008    	ubfx	w8, w0, #16, #5
10001efd4: 530b3c09    	ubfx	w9, w0, #11, #5
10001efd8: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001efdc: 911d414a    	add	x10, x10, #0x750
10001efe0: 9104114b    	add	x11, x10, #0x104
10001efe4: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001efe8: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001efec: b941994c    	ldr	w12, [x10, #0x198]
10001eff0: 8b08012d    	add	x13, x9, x8
10001eff4: 4a0d010e    	eor	w14, w8, w13
10001eff8: d343fdaf    	lsr	x15, x13, #3
10001effc: 531d7def    	lsr	w15, w15, #29
10001f000: 330301ec    	bfi	w12, w15, #29, #1
10001f004: 5315640f    	ubfx	w15, w0, #21, #5
10001f008: 4a090108    	eor	w8, w8, w9
10001f00c: 12017989    	and	w9, w12, #0xbfffffff
10001f010: 3202058c    	orr	w12, w12, #0xc0000000
10001f014: 6a2801df    	bics	wzr, w14, w8
10001f018: 1a89b188    	csel	w8, w12, w9, lt
10001f01c: b9019948    	str	w8, [x10, #0x198]
10001f020: b9418549    	ldr	w9, [x10, #0x184]
10001f024: 52a8000c    	mov	w12, #0x40000000        ; =1073741824
10001f028: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f02c: 710001bf    	cmp	w13, #0x0
10001f030: 1a8cb1cc    	csel	w12, w14, w12, lt
10001f034: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f038: 1a8c01cc    	csel	w12, w14, w12, eq
10001f03c: 33006d2c    	bfxil	w12, w9, #0, #28
10001f040: 531f7d08    	lsr	w8, w8, #31
10001f044: 2a087188    	orr	w8, w12, w8, lsl #28
10001f048: b9018548    	str	w8, [x10, #0x184]
10001f04c: b82f596d    	str	w13, [x11, w15, uxtw #2]
10001f050: d65f03c0    	ret

000000010001f054 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f054: 53156408    	ubfx	w8, w0, #21, #5
10001f058: 53105009    	ubfx	w9, w0, #16, #5
10001f05c: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f060: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f064: 911d416b    	add	x11, x11, #0x750
10001f068: 9104116c    	add	x12, x11, #0x104
10001f06c: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f070: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f074: b941996d    	ldr	w13, [x11, #0x198]
10001f078: d35d75ae    	ubfx	x14, x13, #29, #1
10001f07c: 8b090149    	add	x9, x10, x9
10001f080: 8b0e0129    	add	x9, x9, x14
10001f084: d343fd2a    	lsr	x10, x9, #3
10001f088: 531d7d4a    	lsr	w10, w10, #29
10001f08c: 3303014d    	bfi	w13, w10, #29, #1
10001f090: b901996d    	str	w13, [x11, #0x198]
10001f094: b8285989    	str	w9, [x12, w8, uxtw #2]
10001f098: d65f03c0    	ret

000000010001f09c <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f09c: 53156408    	ubfx	w8, w0, #21, #5
10001f0a0: 53105009    	ubfx	w9, w0, #16, #5
10001f0a4: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f0a8: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f0ac: 911d416b    	add	x11, x11, #0x750
10001f0b0: 9104116c    	add	x12, x11, #0x104
10001f0b4: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f0b8: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f0bc: b941996d    	ldr	w13, [x11, #0x198]
10001f0c0: d35d75ae    	ubfx	x14, x13, #29, #1
10001f0c4: 8b09014f    	add	x15, x10, x9
10001f0c8: 8b0e01ee    	add	x14, x15, x14
10001f0cc: d343fdcf    	lsr	x15, x14, #3
10001f0d0: 531d7def    	lsr	w15, w15, #29
10001f0d4: 330301ed    	bfi	w13, w15, #29, #1
10001f0d8: 4a0a012a    	eor	w10, w9, w10
10001f0dc: 4a0e0129    	eor	w9, w9, w14
10001f0e0: 120179af    	and	w15, w13, #0xbfffffff
10001f0e4: 320205ad    	orr	w13, w13, #0xc0000000
10001f0e8: 6a2a013f    	bics	wzr, w9, w10
10001f0ec: 1a8fb1a9    	csel	w9, w13, w15, lt
10001f0f0: b9019969    	str	w9, [x11, #0x198]
10001f0f4: b828598e    	str	w14, [x12, w8, uxtw #2]
10001f0f8: d65f03c0    	ret

000000010001f0fc <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f0fc: 53156408    	ubfx	w8, w0, #21, #5
10001f100: 53105009    	ubfx	w9, w0, #16, #5
10001f104: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f108: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f10c: 911d416b    	add	x11, x11, #0x750
10001f110: 9104116c    	add	x12, x11, #0x104
10001f114: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f118: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f11c: b941996d    	ldr	w13, [x11, #0x198]
10001f120: d35d75ae    	ubfx	x14, x13, #29, #1
10001f124: 8b090149    	add	x9, x10, x9
10001f128: 8b0e0129    	add	x9, x9, x14
10001f12c: d343fd2a    	lsr	x10, x9, #3
10001f130: 531d7d4a    	lsr	w10, w10, #29
10001f134: 531f7dae    	lsr	w14, w13, #31
10001f138: 3303014d    	bfi	w13, w10, #29, #1
10001f13c: b901996d    	str	w13, [x11, #0x198]
10001f140: b941856a    	ldr	w10, [x11, #0x184]
10001f144: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f148: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f14c: 7100013f    	cmp	w9, #0x0
10001f150: 1a8db1ed    	csel	w13, w15, w13, lt
10001f154: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f158: 1a8d01ed    	csel	w13, w15, w13, eq
10001f15c: 12006d4a    	and	w10, w10, #0xfffffff
10001f160: 2a0e714a    	orr	w10, w10, w14, lsl #28
10001f164: 2a0d014a    	orr	w10, w10, w13
10001f168: b901856a    	str	w10, [x11, #0x184]
10001f16c: b8285989    	str	w9, [x12, w8, uxtw #2]
10001f170: d65f03c0    	ret

000000010001f174 <void dppc_interpreter::ppc_adde<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f174: 53156408    	ubfx	w8, w0, #21, #5
10001f178: 53105009    	ubfx	w9, w0, #16, #5
10001f17c: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f180: 911d414a    	add	x10, x10, #0x750
10001f184: 9104114b    	add	x11, x10, #0x104
10001f188: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f18c: 530b3c0c    	ubfx	w12, w0, #11, #5
10001f190: b86c596c    	ldr	w12, [x11, w12, uxtw #2]
10001f194: b941994d    	ldr	w13, [x10, #0x198]
10001f198: d35d75ae    	ubfx	x14, x13, #29, #1
10001f19c: 8b09018f    	add	x15, x12, x9
10001f1a0: 8b0e01ee    	add	x14, x15, x14
10001f1a4: d343fdcf    	lsr	x15, x14, #3
10001f1a8: 531d7def    	lsr	w15, w15, #29
10001f1ac: 330301ed    	bfi	w13, w15, #29, #1
10001f1b0: 4a0c012c    	eor	w12, w9, w12
10001f1b4: 4a0e0129    	eor	w9, w9, w14
10001f1b8: 120179af    	and	w15, w13, #0xbfffffff
10001f1bc: 320205ad    	orr	w13, w13, #0xc0000000
10001f1c0: 6a2c013f    	bics	wzr, w9, w12
10001f1c4: 1a8fb1a9    	csel	w9, w13, w15, lt
10001f1c8: b9019949    	str	w9, [x10, #0x198]
10001f1cc: b941854c    	ldr	w12, [x10, #0x184]
10001f1d0: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f1d4: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f1d8: 710001df    	cmp	w14, #0x0
10001f1dc: 1a8db1ed    	csel	w13, w15, w13, lt
10001f1e0: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f1e4: 1a8d01ed    	csel	w13, w15, w13, eq
10001f1e8: 33006d8d    	bfxil	w13, w12, #0, #28
10001f1ec: 531f7d29    	lsr	w9, w9, #31
10001f1f0: 2a0971a9    	orr	w9, w13, w9, lsl #28
10001f1f4: b9018549    	str	w9, [x10, #0x184]
10001f1f8: b828596e    	str	w14, [x11, w8, uxtw #2]
10001f1fc: d65f03c0    	ret

000000010001f200 <void dppc_interpreter::ppc_addme<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f200: 53105008    	ubfx	w8, w0, #16, #5
10001f204: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f208: 911d4129    	add	x9, x9, #0x750
10001f20c: 9104112a    	add	x10, x9, #0x104
10001f210: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f214: 5315640b    	ubfx	w11, w0, #21, #5
10001f218: b941992c    	ldr	w12, [x9, #0x198]
10001f21c: d35d758d    	ubfx	x13, x12, #29, #1
10001f220: 1280000e    	mov	w14, #-0x1              ; =-1
10001f224: 8b0d0108    	add	x8, x8, x13
10001f228: 8b0e0108    	add	x8, x8, x14
10001f22c: d343fd0d    	lsr	x13, x8, #3
10001f230: 531d7dad    	lsr	w13, w13, #29
10001f234: 330301ac    	bfi	w12, w13, #29, #1
10001f238: b901992c    	str	w12, [x9, #0x198]
10001f23c: b82b5948    	str	w8, [x10, w11, uxtw #2]
10001f240: d65f03c0    	ret

000000010001f244 <void dppc_interpreter::ppc_addme<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f244: 53156408    	ubfx	w8, w0, #21, #5
10001f248: 53105009    	ubfx	w9, w0, #16, #5
10001f24c: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f250: 911d414a    	add	x10, x10, #0x750
10001f254: 9104114b    	add	x11, x10, #0x104
10001f258: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f25c: b941994c    	ldr	w12, [x10, #0x198]
10001f260: d35d758d    	ubfx	x13, x12, #29, #1
10001f264: 1280000e    	mov	w14, #-0x1              ; =-1
10001f268: 8b0d012d    	add	x13, x9, x13
10001f26c: 8b0e01ad    	add	x13, x13, x14
10001f270: d343fdae    	lsr	x14, x13, #3
10001f274: 531d7dce    	lsr	w14, w14, #29
10001f278: 330301cc    	bfi	w12, w14, #29, #1
10001f27c: 1201798e    	and	w14, w12, #0xbfffffff
10001f280: 3202058c    	orr	w12, w12, #0xc0000000
10001f284: 6a2d013f    	bics	wzr, w9, w13
10001f288: 1a8eb189    	csel	w9, w12, w14, lt
10001f28c: b9019949    	str	w9, [x10, #0x198]
10001f290: b828596d    	str	w13, [x11, w8, uxtw #2]
10001f294: d65f03c0    	ret

000000010001f298 <void dppc_interpreter::ppc_addme<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f298: 53105008    	ubfx	w8, w0, #16, #5
10001f29c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f2a0: 911d4129    	add	x9, x9, #0x750
10001f2a4: 9104112a    	add	x10, x9, #0x104
10001f2a8: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f2ac: 5315640b    	ubfx	w11, w0, #21, #5
10001f2b0: b941992c    	ldr	w12, [x9, #0x198]
10001f2b4: d35d758d    	ubfx	x13, x12, #29, #1
10001f2b8: 1280000e    	mov	w14, #-0x1              ; =-1
10001f2bc: 8b0d0108    	add	x8, x8, x13
10001f2c0: 8b0e0108    	add	x8, x8, x14
10001f2c4: d343fd0d    	lsr	x13, x8, #3
10001f2c8: 531d7dad    	lsr	w13, w13, #29
10001f2cc: 531f7d8e    	lsr	w14, w12, #31
10001f2d0: 330301ac    	bfi	w12, w13, #29, #1
10001f2d4: b901992c    	str	w12, [x9, #0x198]
10001f2d8: b941852c    	ldr	w12, [x9, #0x184]
10001f2dc: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f2e0: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f2e4: 7100011f    	cmp	w8, #0x0
10001f2e8: 1a8db1ed    	csel	w13, w15, w13, lt
10001f2ec: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f2f0: 1a8d01ed    	csel	w13, w15, w13, eq
10001f2f4: 12006d8c    	and	w12, w12, #0xfffffff
10001f2f8: 2a0e718c    	orr	w12, w12, w14, lsl #28
10001f2fc: 2a0d018c    	orr	w12, w12, w13
10001f300: b901852c    	str	w12, [x9, #0x184]
10001f304: b82b5948    	str	w8, [x10, w11, uxtw #2]
10001f308: d65f03c0    	ret

000000010001f30c <void dppc_interpreter::ppc_addme<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f30c: 53156408    	ubfx	w8, w0, #21, #5
10001f310: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f314: 911d4129    	add	x9, x9, #0x750
10001f318: 5310500a    	ubfx	w10, w0, #16, #5
10001f31c: 9104112b    	add	x11, x9, #0x104
10001f320: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f324: b941992c    	ldr	w12, [x9, #0x198]
10001f328: d35d758d    	ubfx	x13, x12, #29, #1
10001f32c: 1280000e    	mov	w14, #-0x1              ; =-1
10001f330: 8b0d014d    	add	x13, x10, x13
10001f334: 8b0e01ad    	add	x13, x13, x14
10001f338: d343fdae    	lsr	x14, x13, #3
10001f33c: 531d7dce    	lsr	w14, w14, #29
10001f340: 330301cc    	bfi	w12, w14, #29, #1
10001f344: 1201798e    	and	w14, w12, #0xbfffffff
10001f348: 3202058c    	orr	w12, w12, #0xc0000000
10001f34c: 6a2d015f    	bics	wzr, w10, w13
10001f350: 1a8eb18a    	csel	w10, w12, w14, lt
10001f354: b901992a    	str	w10, [x9, #0x198]
10001f358: b941852c    	ldr	w12, [x9, #0x184]
10001f35c: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001f360: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f364: 710001bf    	cmp	w13, #0x0
10001f368: 1a8eb1ee    	csel	w14, w15, w14, lt
10001f36c: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f370: 1a8e01ee    	csel	w14, w15, w14, eq
10001f374: 33006d8e    	bfxil	w14, w12, #0, #28
10001f378: 531f7d4a    	lsr	w10, w10, #31
10001f37c: 2a0a71ca    	orr	w10, w14, w10, lsl #28
10001f380: b901852a    	str	w10, [x9, #0x184]
10001f384: b828596d    	str	w13, [x11, w8, uxtw #2]
10001f388: d65f03c0    	ret

000000010001f38c <void dppc_interpreter::ppc_addze<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f38c: 53156408    	ubfx	w8, w0, #21, #5
10001f390: 53105009    	ubfx	w9, w0, #16, #5
10001f394: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f398: 911d414a    	add	x10, x10, #0x750
10001f39c: 9104114b    	add	x11, x10, #0x104
10001f3a0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f3a4: b941994c    	ldr	w12, [x10, #0x198]
10001f3a8: d35d758d    	ubfx	x13, x12, #29, #1
10001f3ac: 8b0901a9    	add	x9, x13, x9
10001f3b0: d343fd2d    	lsr	x13, x9, #3
10001f3b4: 531d7dad    	lsr	w13, w13, #29
10001f3b8: 330301ac    	bfi	w12, w13, #29, #1
10001f3bc: b901994c    	str	w12, [x10, #0x198]
10001f3c0: b8285969    	str	w9, [x11, w8, uxtw #2]
10001f3c4: d65f03c0    	ret

000000010001f3c8 <void dppc_interpreter::ppc_addze<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f3c8: 53156408    	ubfx	w8, w0, #21, #5
10001f3cc: 53105009    	ubfx	w9, w0, #16, #5
10001f3d0: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f3d4: 911d414a    	add	x10, x10, #0x750
10001f3d8: 9104114b    	add	x11, x10, #0x104
10001f3dc: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f3e0: b941994c    	ldr	w12, [x10, #0x198]
10001f3e4: d35d758d    	ubfx	x13, x12, #29, #1
10001f3e8: 8b0901ad    	add	x13, x13, x9
10001f3ec: d343fdae    	lsr	x14, x13, #3
10001f3f0: 531d7dce    	lsr	w14, w14, #29
10001f3f4: 330301cc    	bfi	w12, w14, #29, #1
10001f3f8: 1201798e    	and	w14, w12, #0xbfffffff
10001f3fc: 3202058c    	orr	w12, w12, #0xc0000000
10001f400: 6a2901bf    	bics	wzr, w13, w9
10001f404: 1a8eb189    	csel	w9, w12, w14, lt
10001f408: b9019949    	str	w9, [x10, #0x198]
10001f40c: b828596d    	str	w13, [x11, w8, uxtw #2]
10001f410: d65f03c0    	ret

000000010001f414 <void dppc_interpreter::ppc_addze<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f414: 53156408    	ubfx	w8, w0, #21, #5
10001f418: 53105009    	ubfx	w9, w0, #16, #5
10001f41c: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f420: 911d414a    	add	x10, x10, #0x750
10001f424: 9104114b    	add	x11, x10, #0x104
10001f428: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f42c: b941994c    	ldr	w12, [x10, #0x198]
10001f430: d35d758d    	ubfx	x13, x12, #29, #1
10001f434: 8b0901a9    	add	x9, x13, x9
10001f438: d343fd2d    	lsr	x13, x9, #3
10001f43c: 531d7dad    	lsr	w13, w13, #29
10001f440: 531f7d8e    	lsr	w14, w12, #31
10001f444: 330301ac    	bfi	w12, w13, #29, #1
10001f448: b901994c    	str	w12, [x10, #0x198]
10001f44c: b941854c    	ldr	w12, [x10, #0x184]
10001f450: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f454: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f458: 7100013f    	cmp	w9, #0x0
10001f45c: 1a8db1ed    	csel	w13, w15, w13, lt
10001f460: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f464: 1a8d01ed    	csel	w13, w15, w13, eq
10001f468: 12006d8c    	and	w12, w12, #0xfffffff
10001f46c: 2a0e718c    	orr	w12, w12, w14, lsl #28
10001f470: 2a0d018c    	orr	w12, w12, w13
10001f474: b901854c    	str	w12, [x10, #0x184]
10001f478: b8285969    	str	w9, [x11, w8, uxtw #2]
10001f47c: d65f03c0    	ret

000000010001f480 <void dppc_interpreter::ppc_addze<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f480: 53156408    	ubfx	w8, w0, #21, #5
10001f484: 53105009    	ubfx	w9, w0, #16, #5
10001f488: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f48c: 911d414a    	add	x10, x10, #0x750
10001f490: 9104114b    	add	x11, x10, #0x104
10001f494: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f498: b941994c    	ldr	w12, [x10, #0x198]
10001f49c: d35d758d    	ubfx	x13, x12, #29, #1
10001f4a0: 8b0901ad    	add	x13, x13, x9
10001f4a4: d343fdae    	lsr	x14, x13, #3
10001f4a8: 531d7dce    	lsr	w14, w14, #29
10001f4ac: 330301cc    	bfi	w12, w14, #29, #1
10001f4b0: 1201798e    	and	w14, w12, #0xbfffffff
10001f4b4: 3202058c    	orr	w12, w12, #0xc0000000
10001f4b8: 6a2901bf    	bics	wzr, w13, w9
10001f4bc: 1a8eb189    	csel	w9, w12, w14, lt
10001f4c0: b9019949    	str	w9, [x10, #0x198]
10001f4c4: b941854c    	ldr	w12, [x10, #0x184]
10001f4c8: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001f4cc: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f4d0: 710001bf    	cmp	w13, #0x0
10001f4d4: 1a8eb1ee    	csel	w14, w15, w14, lt
10001f4d8: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f4dc: 1a8e01ee    	csel	w14, w15, w14, eq
10001f4e0: 33006d8e    	bfxil	w14, w12, #0, #28
10001f4e4: 531f7d29    	lsr	w9, w9, #31
10001f4e8: 2a0971c9    	orr	w9, w14, w9, lsl #28
10001f4ec: b9018549    	str	w9, [x10, #0x184]
10001f4f0: b828596d    	str	w13, [x11, w8, uxtw #2]
10001f4f4: d65f03c0    	ret

000000010001f4f8 <dppc_interpreter::ppc_subfic(unsigned int)>:
10001f4f8: 53156408    	ubfx	w8, w0, #21, #5
10001f4fc: 53105009    	ubfx	w9, w0, #16, #5
10001f500: 13003c0a    	sxth	w10, w0
10001f504: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f508: 911d416b    	add	x11, x11, #0x750
10001f50c: 9104116c    	add	x12, x11, #0x104
10001f510: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f514: 2a2903e9    	mvn	w9, w9
10001f518: 8b090149    	add	x9, x10, x9
10001f51c: 91000529    	add	x9, x9, #0x1
10001f520: b941996a    	ldr	w10, [x11, #0x198]
10001f524: d343fd2d    	lsr	x13, x9, #3
10001f528: 531d7dad    	lsr	w13, w13, #29
10001f52c: 330301aa    	bfi	w10, w13, #29, #1
10001f530: b901996a    	str	w10, [x11, #0x198]
10001f534: b8285989    	str	w9, [x12, w8, uxtw #2]
10001f538: d65f03c0    	ret

000000010001f53c <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)0, (field_ov)0>(unsigned int)>:
10001f53c: 53156408    	ubfx	w8, w0, #21, #5
10001f540: 53105009    	ubfx	w9, w0, #16, #5
10001f544: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f548: 911d414a    	add	x10, x10, #0x750
10001f54c: 9104114a    	add	x10, x10, #0x104
10001f550: b8695949    	ldr	w9, [x10, w9, uxtw #2]
10001f554: 530b3c0b    	ubfx	w11, w0, #11, #5
10001f558: b86b594b    	ldr	w11, [x10, w11, uxtw #2]
10001f55c: 4b090169    	sub	w9, w11, w9
10001f560: b8285949    	str	w9, [x10, w8, uxtw #2]
10001f564: d65f03c0    	ret

000000010001f568 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)0, (field_ov)1>(unsigned int)>:
10001f568: 53105008    	ubfx	w8, w0, #16, #5
10001f56c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f570: 911d4129    	add	x9, x9, #0x750
10001f574: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f578: 9104112b    	add	x11, x9, #0x104
10001f57c: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f580: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f584: 5315640c    	ubfx	w12, w0, #21, #5
10001f588: 4a08014d    	eor	w13, w10, w8
10001f58c: 4b080148    	sub	w8, w10, w8
10001f590: 4a0a010a    	eor	w10, w8, w10
10001f594: b941992e    	ldr	w14, [x9, #0x198]
10001f598: 120179cf    	and	w15, w14, #0xbfffffff
10001f59c: 320205ce    	orr	w14, w14, #0xc0000000
10001f5a0: 6a0d015f    	tst	w10, w13
10001f5a4: 1a8fb1ca    	csel	w10, w14, w15, lt
10001f5a8: b901992a    	str	w10, [x9, #0x198]
10001f5ac: b82c5968    	str	w8, [x11, w12, uxtw #2]
10001f5b0: d65f03c0    	ret

000000010001f5b4 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)1, (field_ov)0>(unsigned int)>:
10001f5b4: 53105008    	ubfx	w8, w0, #16, #5
10001f5b8: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f5bc: 911d4129    	add	x9, x9, #0x750
10001f5c0: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f5c4: 9104112b    	add	x11, x9, #0x104
10001f5c8: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f5cc: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f5d0: 6b08014c    	subs	w12, w10, w8
10001f5d4: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f5d8: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f5dc: 7100019f    	cmp	w12, #0x0
10001f5e0: 1a8db1cc    	csel	w12, w14, w13, lt
10001f5e4: 6b080148    	subs	w8, w10, w8
10001f5e8: 5315640a    	ubfx	w10, w0, #21, #5
10001f5ec: b941852d    	ldr	w13, [x9, #0x184]
10001f5f0: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f5f4: 1a8c01cc    	csel	w12, w14, w12, eq
10001f5f8: 33006dac    	bfxil	w12, w13, #0, #28
10001f5fc: b941992d    	ldr	w13, [x9, #0x198]
10001f600: 531f7dad    	lsr	w13, w13, #31
10001f604: 2a0d718c    	orr	w12, w12, w13, lsl #28
10001f608: b901852c    	str	w12, [x9, #0x184]
10001f60c: b82a5968    	str	w8, [x11, w10, uxtw #2]
10001f610: d65f03c0    	ret

000000010001f614 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)1, (field_ov)1>(unsigned int)>:
10001f614: 53105008    	ubfx	w8, w0, #16, #5
10001f618: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f61c: 911d4129    	add	x9, x9, #0x750
10001f620: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f624: 9104112b    	add	x11, x9, #0x104
10001f628: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f62c: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f630: 6b08014c    	subs	w12, w10, w8
10001f634: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f638: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f63c: 7100019f    	cmp	w12, #0x0
10001f640: 1a8db1cc    	csel	w12, w14, w13, lt
10001f644: 5315640d    	ubfx	w13, w0, #21, #5
10001f648: 4a08014e    	eor	w14, w10, w8
10001f64c: 6b080148    	subs	w8, w10, w8
10001f650: 4a0a010a    	eor	w10, w8, w10
10001f654: b941992f    	ldr	w15, [x9, #0x198]
10001f658: 120179f0    	and	w16, w15, #0xbfffffff
10001f65c: 320205ef    	orr	w15, w15, #0xc0000000
10001f660: 52a40011    	mov	w17, #0x20000000        ; =536870912
10001f664: 1a8c022c    	csel	w12, w17, w12, eq
10001f668: 6a0e015f    	tst	w10, w14
10001f66c: 1a90b1ea    	csel	w10, w15, w16, lt
10001f670: b901992a    	str	w10, [x9, #0x198]
10001f674: b941852e    	ldr	w14, [x9, #0x184]
10001f678: 33006dcc    	bfxil	w12, w14, #0, #28
10001f67c: 531f7d4a    	lsr	w10, w10, #31
10001f680: 2a0a718a    	orr	w10, w12, w10, lsl #28
10001f684: b901852a    	str	w10, [x9, #0x184]
10001f688: b82d5968    	str	w8, [x11, w13, uxtw #2]
10001f68c: d65f03c0    	ret

000000010001f690 <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)0, (field_ov)0>(unsigned int)>:
10001f690: 53156408    	ubfx	w8, w0, #21, #5
10001f694: 53105009    	ubfx	w9, w0, #16, #5
10001f698: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f69c: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f6a0: 911d416b    	add	x11, x11, #0x750
10001f6a4: 9104116c    	add	x12, x11, #0x104
10001f6a8: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f6ac: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f6b0: 2a2903e9    	mvn	w9, w9
10001f6b4: 8b0a0129    	add	x9, x9, x10
10001f6b8: 91000529    	add	x9, x9, #0x1
10001f6bc: b941996a    	ldr	w10, [x11, #0x198]
10001f6c0: d343fd2d    	lsr	x13, x9, #3
10001f6c4: 531d7dad    	lsr	w13, w13, #29
10001f6c8: 330301aa    	bfi	w10, w13, #29, #1
10001f6cc: b901996a    	str	w10, [x11, #0x198]
10001f6d0: b8285989    	str	w9, [x12, w8, uxtw #2]
10001f6d4: d65f03c0    	ret

000000010001f6d8 <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)0, (field_ov)1>(unsigned int)>:
10001f6d8: 53156408    	ubfx	w8, w0, #21, #5
10001f6dc: 53105009    	ubfx	w9, w0, #16, #5
10001f6e0: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f6e4: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f6e8: 911d416b    	add	x11, x11, #0x750
10001f6ec: 9104116c    	add	x12, x11, #0x104
10001f6f0: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f6f4: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f6f8: 2a2903ed    	mvn	w13, w9
10001f6fc: 8b0a01ad    	add	x13, x13, x10
10001f700: 910005ad    	add	x13, x13, #0x1
10001f704: b941996e    	ldr	w14, [x11, #0x198]
10001f708: d343fdaf    	lsr	x15, x13, #3
10001f70c: 531d7def    	lsr	w15, w15, #29
10001f710: 330301ee    	bfi	w14, w15, #29, #1
10001f714: 4a090149    	eor	w9, w10, w9
10001f718: 4a0d014a    	eor	w10, w10, w13
10001f71c: 120179cf    	and	w15, w14, #0xbfffffff
10001f720: 320205ce    	orr	w14, w14, #0xc0000000
10001f724: 6a09015f    	tst	w10, w9
10001f728: 1a8fb1c9    	csel	w9, w14, w15, lt
10001f72c: b9019969    	str	w9, [x11, #0x198]
10001f730: b828598d    	str	w13, [x12, w8, uxtw #2]
10001f734: d65f03c0    	ret

000000010001f738 <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)1, (field_ov)0>(unsigned int)>:
10001f738: 53156408    	ubfx	w8, w0, #21, #5
10001f73c: 53105009    	ubfx	w9, w0, #16, #5
10001f740: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f744: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f748: 911d416b    	add	x11, x11, #0x750
10001f74c: 9104116c    	add	x12, x11, #0x104
10001f750: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f754: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f758: 2a2903e9    	mvn	w9, w9
10001f75c: 8b0a0129    	add	x9, x9, x10
10001f760: 91000529    	add	x9, x9, #0x1
10001f764: b941996a    	ldr	w10, [x11, #0x198]
10001f768: d343fd2d    	lsr	x13, x9, #3
10001f76c: 531d7dad    	lsr	w13, w13, #29
10001f770: 531f7d4e    	lsr	w14, w10, #31
10001f774: 330301aa    	bfi	w10, w13, #29, #1
10001f778: b901996a    	str	w10, [x11, #0x198]
10001f77c: b941856a    	ldr	w10, [x11, #0x184]
10001f780: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f784: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f788: 7100013f    	cmp	w9, #0x0
10001f78c: 1a8db1ed    	csel	w13, w15, w13, lt
10001f790: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f794: 1a8d01ed    	csel	w13, w15, w13, eq
10001f798: 12006d4a    	and	w10, w10, #0xfffffff
10001f79c: 2a0e714a    	orr	w10, w10, w14, lsl #28
10001f7a0: 2a0d014a    	orr	w10, w10, w13
10001f7a4: b901856a    	str	w10, [x11, #0x184]
10001f7a8: b8285989    	str	w9, [x12, w8, uxtw #2]
10001f7ac: d65f03c0    	ret

000000010001f7b0 <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)1, (field_ov)1>(unsigned int)>:
10001f7b0: 53156408    	ubfx	w8, w0, #21, #5
10001f7b4: 53105009    	ubfx	w9, w0, #16, #5
10001f7b8: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f7bc: 911d414a    	add	x10, x10, #0x750
10001f7c0: 9104114b    	add	x11, x10, #0x104
10001f7c4: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f7c8: 530b3c0c    	ubfx	w12, w0, #11, #5
10001f7cc: b86c596c    	ldr	w12, [x11, w12, uxtw #2]
10001f7d0: 2a2903ed    	mvn	w13, w9
10001f7d4: 8b0c01ad    	add	x13, x13, x12
10001f7d8: 910005ad    	add	x13, x13, #0x1
10001f7dc: b941994e    	ldr	w14, [x10, #0x198]
10001f7e0: d343fdaf    	lsr	x15, x13, #3
10001f7e4: 531d7def    	lsr	w15, w15, #29
10001f7e8: 330301ee    	bfi	w14, w15, #29, #1
10001f7ec: 4a090189    	eor	w9, w12, w9
10001f7f0: 4a0d018c    	eor	w12, w12, w13
10001f7f4: 120179cf    	and	w15, w14, #0xbfffffff
10001f7f8: 320205ce    	orr	w14, w14, #0xc0000000
10001f7fc: 6a09019f    	tst	w12, w9
10001f800: 1a8fb1c9    	csel	w9, w14, w15, lt
10001f804: b9019949    	str	w9, [x10, #0x198]
10001f808: b941854c    	ldr	w12, [x10, #0x184]
10001f80c: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001f810: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f814: 710001bf    	cmp	w13, #0x0
10001f818: 1a8eb1ee    	csel	w14, w15, w14, lt
10001f81c: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f820: 1a8e01ee    	csel	w14, w15, w14, eq
10001f824: 33006d8e    	bfxil	w14, w12, #0, #28
10001f828: 531f7d29    	lsr	w9, w9, #31
10001f82c: 2a0971c9    	orr	w9, w14, w9, lsl #28
10001f830: b9018549    	str	w9, [x10, #0x184]
10001f834: b828596d    	str	w13, [x11, w8, uxtw #2]
10001f838: d65f03c0    	ret

000000010001f83c <void dppc_interpreter::ppc_subfe<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f83c: 53105008    	ubfx	w8, w0, #16, #5
10001f840: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f844: 911d4129    	add	x9, x9, #0x750
10001f848: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f84c: 9104112b    	add	x11, x9, #0x104
10001f850: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f854: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f858: 5315640c    	ubfx	w12, w0, #21, #5
10001f85c: b941992d    	ldr	w13, [x9, #0x198]
10001f860: d35d75ae    	ubfx	x14, x13, #29, #1
10001f864: 2a2803e8    	mvn	w8, w8
10001f868: 8b0e014a    	add	x10, x10, x14
10001f86c: 8b080148    	add	x8, x10, x8
10001f870: d343fd0a    	lsr	x10, x8, #3
10001f874: 531d7d4a    	lsr	w10, w10, #29
10001f878: 3303014d    	bfi	w13, w10, #29, #1
10001f87c: b901992d    	str	w13, [x9, #0x198]
10001f880: b82c5968    	str	w8, [x11, w12, uxtw #2]
10001f884: d65f03c0    	ret

000000010001f888 <void dppc_interpreter::ppc_subfe<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f888: 53105008    	ubfx	w8, w0, #16, #5
10001f88c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f890: 911d4129    	add	x9, x9, #0x750
10001f894: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f898: 9104112b    	add	x11, x9, #0x104
10001f89c: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f8a0: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f8a4: 5315640c    	ubfx	w12, w0, #21, #5
10001f8a8: b941992d    	ldr	w13, [x9, #0x198]
10001f8ac: d35d75ae    	ubfx	x14, x13, #29, #1
10001f8b0: 2a2803ef    	mvn	w15, w8
10001f8b4: 8b0e014e    	add	x14, x10, x14
10001f8b8: 8b0f01ce    	add	x14, x14, x15
10001f8bc: d343fdcf    	lsr	x15, x14, #3
10001f8c0: 531d7def    	lsr	w15, w15, #29
10001f8c4: 330301ed    	bfi	w13, w15, #29, #1
10001f8c8: 4a080148    	eor	w8, w10, w8
10001f8cc: 4a0e014a    	eor	w10, w10, w14
10001f8d0: 120179af    	and	w15, w13, #0xbfffffff
10001f8d4: 320205ad    	orr	w13, w13, #0xc0000000
10001f8d8: 6a08015f    	tst	w10, w8
10001f8dc: 1a8fb1a8    	csel	w8, w13, w15, lt
10001f8e0: b9019928    	str	w8, [x9, #0x198]
10001f8e4: b82c596e    	str	w14, [x11, w12, uxtw #2]
10001f8e8: d65f03c0    	ret

000000010001f8ec <void dppc_interpreter::ppc_subfe<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f8ec: 53105008    	ubfx	w8, w0, #16, #5
10001f8f0: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f8f4: 911d4129    	add	x9, x9, #0x750
10001f8f8: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f8fc: 9104112b    	add	x11, x9, #0x104
10001f900: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f904: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f908: 5315640c    	ubfx	w12, w0, #21, #5
10001f90c: b941992d    	ldr	w13, [x9, #0x198]
10001f910: d35d75ae    	ubfx	x14, x13, #29, #1
10001f914: 2a2803e8    	mvn	w8, w8
10001f918: 8b0e014a    	add	x10, x10, x14
10001f91c: 8b080148    	add	x8, x10, x8
10001f920: d343fd0a    	lsr	x10, x8, #3
10001f924: 531d7d4a    	lsr	w10, w10, #29
10001f928: 531f7dae    	lsr	w14, w13, #31
10001f92c: 3303014d    	bfi	w13, w10, #29, #1
10001f930: b901992d    	str	w13, [x9, #0x198]
10001f934: b941852a    	ldr	w10, [x9, #0x184]
10001f938: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f93c: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f940: 7100011f    	cmp	w8, #0x0
10001f944: 1a8db1ed    	csel	w13, w15, w13, lt
10001f948: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f94c: 1a8d01ed    	csel	w13, w15, w13, eq
10001f950: 12006d4a    	and	w10, w10, #0xfffffff
10001f954: 2a0e714a    	orr	w10, w10, w14, lsl #28
10001f958: 2a0d014a    	orr	w10, w10, w13
10001f95c: b901852a    	str	w10, [x9, #0x184]
10001f960: b82c5968    	str	w8, [x11, w12, uxtw #2]
10001f964: d65f03c0    	ret

000000010001f968 <void dppc_interpreter::ppc_subfe<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f968: 53156408    	ubfx	w8, w0, #21, #5
10001f96c: 53105009    	ubfx	w9, w0, #16, #5
10001f970: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f974: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f978: 911d416b    	add	x11, x11, #0x750
10001f97c: 9104116c    	add	x12, x11, #0x104
10001f980: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f984: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f988: b941996d    	ldr	w13, [x11, #0x198]
10001f98c: d35d75ae    	ubfx	x14, x13, #29, #1
10001f990: 2a2903ef    	mvn	w15, w9
10001f994: 8b0e014e    	add	x14, x10, x14
10001f998: 8b0f01ce    	add	x14, x14, x15
10001f99c: d343fdcf    	lsr	x15, x14, #3
10001f9a0: 531d7def    	lsr	w15, w15, #29
10001f9a4: 330301ed    	bfi	w13, w15, #29, #1
10001f9a8: 4a090149    	eor	w9, w10, w9
10001f9ac: 4a0e014a    	eor	w10, w10, w14
10001f9b0: 120179af    	and	w15, w13, #0xbfffffff
10001f9b4: 320205ad    	orr	w13, w13, #0xc0000000
10001f9b8: 6a09015f    	tst	w10, w9
10001f9bc: 1a8fb1a9    	csel	w9, w13, w15, lt
10001f9c0: b9019969    	str	w9, [x11, #0x198]
10001f9c4: b941856a    	ldr	w10, [x11, #0x184]
10001f9c8: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f9cc: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f9d0: 710001df    	cmp	w14, #0x0
10001f9d4: 1a8db1ed    	csel	w13, w15, w13, lt
10001f9d8: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f9dc: 1a8d01ed    	csel	w13, w15, w13, eq
10001f9e0: 33006d4d    	bfxil	w13, w10, #0, #28
10001f9e4: 531f7d29    	lsr	w9, w9, #31
10001f9e8: 2a0971a9    	orr	w9, w13, w9, lsl #28
10001f9ec: b9018569    	str	w9, [x11, #0x184]
10001f9f0: b828598e    	str	w14, [x12, w8, uxtw #2]
10001f9f4: d65f03c0    	ret

000000010001f9f8 <void dppc_interpreter::ppc_subfme<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f9f8: 53156408    	ubfx	w8, w0, #21, #5
10001f9fc: 53105009    	ubfx	w9, w0, #16, #5
10001fa00: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001fa04: 911d414a    	add	x10, x10, #0x750
10001fa08: 9104114b    	add	x11, x10, #0x104
10001fa0c: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001fa10: b941994c    	ldr	w12, [x10, #0x198]
10001fa14: d35d758d    	ubfx	x13, x12, #29, #1
10001fa18: 2a2903e9    	mvn	w9, w9
10001fa1c: 1280000e    	mov	w14, #-0x1              ; =-1
10001fa20: 8b0e01ad    	add	x13, x13, x14
10001fa24: 8b0d0129    	add	x9, x9, x13
10001fa28: d343fd2d    	lsr	x13, x9, #3
10001fa2c: 531d7dad    	lsr	w13, w13, #29
10001fa30: 330301ac    	bfi	w12, w13, #29, #1
10001fa34: b901994c    	str	w12, [x10, #0x198]
10001fa38: b8285969    	str	w9, [x11, w8, uxtw #2]
10001fa3c: d65f03c0    	ret

000000010001fa40 <void dppc_interpreter::ppc_subfme<(field_rc)0, (field_ov)1>(unsigned int)>:
10001fa40: 53105008    	ubfx	w8, w0, #16, #5
10001fa44: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fa48: 911d4129    	add	x9, x9, #0x750
10001fa4c: 9104112a    	add	x10, x9, #0x104
10001fa50: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fa54: b941992b    	ldr	w11, [x9, #0x198]
10001fa58: d35d756c    	ubfx	x12, x11, #29, #1
10001fa5c: 2a2803ed    	mvn	w13, w8
10001fa60: 1280000e    	mov	w14, #-0x1              ; =-1
10001fa64: 8b0e018c    	add	x12, x12, x14
10001fa68: 8b0c01ac    	add	x12, x13, x12
10001fa6c: d343fd8d    	lsr	x13, x12, #3
10001fa70: 531d7dad    	lsr	w13, w13, #29
10001fa74: 330301ab    	bfi	w11, w13, #29, #1
10001fa78: 7100019f    	cmp	w12, #0x0
10001fa7c: 7a4cc100    	ccmp	w8, w12, #0x0, gt
10001fa80: 12017968    	and	w8, w11, #0xbfffffff
10001fa84: 3202056b    	orr	w11, w11, #0xc0000000
10001fa88: 1a880168    	csel	w8, w11, w8, eq
10001fa8c: b9019928    	str	w8, [x9, #0x198]
10001fa90: 53156408    	ubfx	w8, w0, #21, #5
10001fa94: b828594c    	str	w12, [x10, w8, uxtw #2]
10001fa98: d65f03c0    	ret

000000010001fa9c <void dppc_interpreter::ppc_subfme<(field_rc)1, (field_ov)0>(unsigned int)>:
10001fa9c: 53156408    	ubfx	w8, w0, #21, #5
10001faa0: 53105009    	ubfx	w9, w0, #16, #5
10001faa4: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001faa8: 911d414a    	add	x10, x10, #0x750
10001faac: 9104114b    	add	x11, x10, #0x104
10001fab0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001fab4: b941994c    	ldr	w12, [x10, #0x198]
10001fab8: d35d758d    	ubfx	x13, x12, #29, #1
10001fabc: 2a2903e9    	mvn	w9, w9
10001fac0: 1280000e    	mov	w14, #-0x1              ; =-1
10001fac4: 8b0e01ad    	add	x13, x13, x14
10001fac8: 8b0d0129    	add	x9, x9, x13
10001facc: d343fd2d    	lsr	x13, x9, #3
10001fad0: 531d7dad    	lsr	w13, w13, #29
10001fad4: 531f7d8e    	lsr	w14, w12, #31
10001fad8: 330301ac    	bfi	w12, w13, #29, #1
10001fadc: b901994c    	str	w12, [x10, #0x198]
10001fae0: b941854c    	ldr	w12, [x10, #0x184]
10001fae4: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001fae8: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001faec: 7100013f    	cmp	w9, #0x0
10001faf0: 1a8db1ed    	csel	w13, w15, w13, lt
10001faf4: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001faf8: 1a8d01ed    	csel	w13, w15, w13, eq
10001fafc: 12006d8c    	and	w12, w12, #0xfffffff
10001fb00: 2a0e718c    	orr	w12, w12, w14, lsl #28
10001fb04: 2a0d018c    	orr	w12, w12, w13
10001fb08: b901854c    	str	w12, [x10, #0x184]
10001fb0c: b8285969    	str	w9, [x11, w8, uxtw #2]
10001fb10: d65f03c0    	ret

000000010001fb14 <void dppc_interpreter::ppc_subfme<(field_rc)1, (field_ov)1>(unsigned int)>:
10001fb14: 53105008    	ubfx	w8, w0, #16, #5
10001fb18: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fb1c: 911d4129    	add	x9, x9, #0x750
10001fb20: 9104112a    	add	x10, x9, #0x104
10001fb24: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fb28: b941992b    	ldr	w11, [x9, #0x198]
10001fb2c: d35d756c    	ubfx	x12, x11, #29, #1
10001fb30: 2a2803ed    	mvn	w13, w8
10001fb34: 1280000e    	mov	w14, #-0x1              ; =-1
10001fb38: 8b0e018c    	add	x12, x12, x14
10001fb3c: 8b0c01ac    	add	x12, x13, x12
10001fb40: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001fb44: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001fb48: 7100019f    	cmp	w12, #0x0
10001fb4c: 1a8db1cd    	csel	w13, w14, w13, lt
10001fb50: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001fb54: 1a8d01cd    	csel	w13, w14, w13, eq
10001fb58: 7100019f    	cmp	w12, #0x0
10001fb5c: d343fd8e    	lsr	x14, x12, #3
10001fb60: 531d7dce    	lsr	w14, w14, #29
10001fb64: 330301cb    	bfi	w11, w14, #29, #1
10001fb68: 7a4cc100    	ccmp	w8, w12, #0x0, gt
10001fb6c: 12017968    	and	w8, w11, #0xbfffffff
10001fb70: 3202056b    	orr	w11, w11, #0xc0000000
10001fb74: 1a880168    	csel	w8, w11, w8, eq
10001fb78: b9019928    	str	w8, [x9, #0x198]
10001fb7c: 5315640b    	ubfx	w11, w0, #21, #5
10001fb80: b941852e    	ldr	w14, [x9, #0x184]
10001fb84: 33006dcd    	bfxil	w13, w14, #0, #28
10001fb88: 531f7d08    	lsr	w8, w8, #31
10001fb8c: 2a0871a8    	orr	w8, w13, w8, lsl #28
10001fb90: b9018528    	str	w8, [x9, #0x184]
10001fb94: b82b594c    	str	w12, [x10, w11, uxtw #2]
10001fb98: d65f03c0    	ret

000000010001fb9c <void dppc_interpreter::ppc_subfze<(field_rc)0, (field_ov)0>(unsigned int)>:
10001fb9c: 53156408    	ubfx	w8, w0, #21, #5
10001fba0: 53105009    	ubfx	w9, w0, #16, #5
10001fba4: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001fba8: 911d414a    	add	x10, x10, #0x750
10001fbac: 9104114b    	add	x11, x10, #0x104
10001fbb0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001fbb4: b941994c    	ldr	w12, [x10, #0x198]
10001fbb8: d35d758d    	ubfx	x13, x12, #29, #1
10001fbbc: 2a2903e9    	mvn	w9, w9
10001fbc0: 8b0901a9    	add	x9, x13, x9
10001fbc4: d343fd2d    	lsr	x13, x9, #3
10001fbc8: 531d7dad    	lsr	w13, w13, #29
10001fbcc: 330301ac    	bfi	w12, w13, #29, #1
10001fbd0: b901994c    	str	w12, [x10, #0x198]
10001fbd4: b8285969    	str	w9, [x11, w8, uxtw #2]
10001fbd8: d65f03c0    	ret

000000010001fbdc <void dppc_interpreter::ppc_subfze<(field_rc)0, (field_ov)1>(unsigned int)>:
10001fbdc: 53105008    	ubfx	w8, w0, #16, #5
10001fbe0: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fbe4: 911d4129    	add	x9, x9, #0x750
10001fbe8: 9104112a    	add	x10, x9, #0x104
10001fbec: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fbf0: b941992b    	ldr	w11, [x9, #0x198]
10001fbf4: d35d756c    	ubfx	x12, x11, #29, #1
10001fbf8: 2a2803ed    	mvn	w13, w8
10001fbfc: 8b0d018c    	add	x12, x12, x13
10001fc00: 6b0c011f    	cmp	w8, w12
10001fc04: d343fd88    	lsr	x8, x12, #3
10001fc08: 531d7d08    	lsr	w8, w8, #29
10001fc0c: 3303010b    	bfi	w11, w8, #29, #1
10001fc10: 7a400984    	ccmp	w12, #0x0, #0x4, eq
10001fc14: 12017968    	and	w8, w11, #0xbfffffff
10001fc18: 3202056b    	orr	w11, w11, #0xc0000000
10001fc1c: 1a881168    	csel	w8, w11, w8, ne
10001fc20: b9019928    	str	w8, [x9, #0x198]
10001fc24: 53156408    	ubfx	w8, w0, #21, #5
10001fc28: b828594c    	str	w12, [x10, w8, uxtw #2]
10001fc2c: d65f03c0    	ret

000000010001fc30 <void dppc_interpreter::ppc_subfze<(field_rc)1, (field_ov)0>(unsigned int)>:
10001fc30: 53156408    	ubfx	w8, w0, #21, #5
10001fc34: 53105009    	ubfx	w9, w0, #16, #5
10001fc38: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001fc3c: 911d414a    	add	x10, x10, #0x750
10001fc40: 9104114b    	add	x11, x10, #0x104
10001fc44: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001fc48: b941994c    	ldr	w12, [x10, #0x198]
10001fc4c: d35d758d    	ubfx	x13, x12, #29, #1
10001fc50: 2a2903e9    	mvn	w9, w9
10001fc54: 8b0901a9    	add	x9, x13, x9
10001fc58: d343fd2d    	lsr	x13, x9, #3
10001fc5c: 531d7dad    	lsr	w13, w13, #29
10001fc60: 531f7d8e    	lsr	w14, w12, #31
10001fc64: 330301ac    	bfi	w12, w13, #29, #1
10001fc68: b901994c    	str	w12, [x10, #0x198]
10001fc6c: b941854c    	ldr	w12, [x10, #0x184]
10001fc70: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001fc74: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001fc78: 7100013f    	cmp	w9, #0x0
10001fc7c: 1a8db1ed    	csel	w13, w15, w13, lt
10001fc80: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001fc84: 1a8d01ed    	csel	w13, w15, w13, eq
10001fc88: 12006d8c    	and	w12, w12, #0xfffffff
10001fc8c: 2a0e718c    	orr	w12, w12, w14, lsl #28
10001fc90: 2a0d018c    	orr	w12, w12, w13
10001fc94: b901854c    	str	w12, [x10, #0x184]
10001fc98: b8285969    	str	w9, [x11, w8, uxtw #2]
10001fc9c: d65f03c0    	ret

000000010001fca0 <void dppc_interpreter::ppc_subfze<(field_rc)1, (field_ov)1>(unsigned int)>:
10001fca0: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
10001fca4: 911d4108    	add	x8, x8, #0x750
10001fca8: 53105009    	ubfx	w9, w0, #16, #5
10001fcac: 8b294909    	add	x9, x8, w9, uxtw #2
10001fcb0: b9410529    	ldr	w9, [x9, #0x104]
10001fcb4: b941990a    	ldr	w10, [x8, #0x198]
10001fcb8: d35d754b    	ubfx	x11, x10, #29, #1
10001fcbc: 2a2903ec    	mvn	w12, w9
10001fcc0: 8b0c016b    	add	x11, x11, x12
10001fcc4: d343fd6c    	lsr	x12, x11, #3
10001fcc8: 531d7d8c    	lsr	w12, w12, #29
10001fccc: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001fcd0: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001fcd4: 7100017f    	cmp	w11, #0x0
10001fcd8: 1a8db1cd    	csel	w13, w14, w13, lt
10001fcdc: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001fce0: 1a8d01cd    	csel	w13, w14, w13, eq
10001fce4: 33037d4d    	bfxil	w13, w10, #3, #29
10001fce8: 3303018a    	bfi	w10, w12, #29, #1
10001fcec: b941850c    	ldr	w12, [x8, #0x184]
10001fcf0: 1201794e    	and	w14, w10, #0xbfffffff
10001fcf4: 33006d8d    	bfxil	w13, w12, #0, #28
10001fcf8: 3202054a    	orr	w10, w10, #0xc0000000
10001fcfc: 52aa000f    	mov	w15, #0x50000000        ; =1342177280
10001fd00: 52b20010    	mov	w16, #-0x70000000       ; =-1879048192
10001fd04: 7100013f    	cmp	w9, #0x0
10001fd08: 1a8fb20f    	csel	w15, w16, w15, lt
10001fd0c: 33006d8f    	bfxil	w15, w12, #0, #28
10001fd10: 7100017f    	cmp	w11, #0x0
10001fd14: 7a4b1120    	ccmp	w9, w11, #0x0, ne
10001fd18: 1a8a11c9    	csel	w9, w14, w10, ne
10001fd1c: 1a8f11aa    	csel	w10, w13, w15, ne
10001fd20: b9019909    	str	w9, [x8, #0x198]
10001fd24: b901850a    	str	w10, [x8, #0x184]
10001fd28: 53156409    	ubfx	w9, w0, #21, #5
10001fd2c: 8b294908    	add	x8, x8, w9, uxtw #2
10001fd30: b901050b    	str	w11, [x8, #0x104]
10001fd34: d65f03c0    	ret
