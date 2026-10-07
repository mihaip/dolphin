000000010001ecd4 <void dppc_interpreter::ppc_addic<(field_rc)0>(unsigned int)>:
10001ecd4: 53156408    	ubfx	w8, w0, #21, #5
10001ecd8: 53105009    	ubfx	w9, w0, #16, #5
10001ecdc: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ece0: 911d414a    	add	x10, x10, #0x750
10001ece4: 9104114b    	add	x11, x10, #0x104
10001ece8: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001ecec: 2b20a129    	adds	w9, w9, w0, sxth
10001ecf0: b941994c    	ldr	w12, [x10, #0x198]
10001ecf4: 1202798c    	and	w12, w12, #0xdfffffff
10001ecf8: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001ecfc: 1a9f21ad    	csel	w13, w13, wzr, hs
10001ed00: 2a0c01ac    	orr	w12, w13, w12
10001ed04: b901994c    	str	w12, [x10, #0x198]
10001ed08: b8285969    	str	w9, [x11, w8, uxtw #2]
10001ed0c: d65f03c0    	ret

000000010001ed10 <void dppc_interpreter::ppc_addic<(field_rc)1>(unsigned int)>:
10001ed10: 53156408    	ubfx	w8, w0, #21, #5
10001ed14: 53105009    	ubfx	w9, w0, #16, #5
10001ed18: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ed1c: 911d414a    	add	x10, x10, #0x750
10001ed20: 9104114b    	add	x11, x10, #0x104
10001ed24: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001ed28: 2b20a129    	adds	w9, w9, w0, sxth
10001ed2c: b941994c    	ldr	w12, [x10, #0x198]
10001ed30: 1202798d    	and	w13, w12, #0xdfffffff
10001ed34: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001ed38: 1a9f21cf    	csel	w15, w14, wzr, hs
10001ed3c: 2a0d01ed    	orr	w13, w15, w13
10001ed40: b901994d    	str	w13, [x10, #0x198]
10001ed44: b941854d    	ldr	w13, [x10, #0x184]
10001ed48: 52a8000f    	mov	w15, #0x40000000        ; =1073741824
10001ed4c: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001ed50: 7100013f    	cmp	w9, #0x0
10001ed54: 1a8fb20f    	csel	w15, w16, w15, lt
10001ed58: 1a8f01ce    	csel	w14, w14, w15, eq
10001ed5c: 33037d8e    	bfxil	w14, w12, #3, #29
10001ed60: 33006dae    	bfxil	w14, w13, #0, #28
10001ed64: b901854e    	str	w14, [x10, #0x184]
10001ed68: b8285969    	str	w9, [x11, w8, uxtw #2]
10001ed6c: d65f03c0    	ret

000000010001ed70 <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)0, (field_ov)0>(unsigned int)>:
10001ed70: 53156408    	ubfx	w8, w0, #21, #5
10001ed74: 53105009    	ubfx	w9, w0, #16, #5
10001ed78: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ed7c: 911d414a    	add	x10, x10, #0x750
10001ed80: 9104114a    	add	x10, x10, #0x104
10001ed84: b8695949    	ldr	w9, [x10, w9, uxtw #2]
10001ed88: 530b3c0b    	ubfx	w11, w0, #11, #5
10001ed8c: b86b594b    	ldr	w11, [x10, w11, uxtw #2]
10001ed90: 0b090169    	add	w9, w11, w9
10001ed94: b8285949    	str	w9, [x10, w8, uxtw #2]
10001ed98: d65f03c0    	ret

000000010001ed9c <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)1, (field_ov)0>(unsigned int)>:
10001ed9c: 53156408    	ubfx	w8, w0, #21, #5
10001eda0: 53105009    	ubfx	w9, w0, #16, #5
10001eda4: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001eda8: 911d414a    	add	x10, x10, #0x750
10001edac: 9104114b    	add	x11, x10, #0x104
10001edb0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001edb4: 530b3c0c    	ubfx	w12, w0, #11, #5
10001edb8: b86c596c    	ldr	w12, [x11, w12, uxtw #2]
10001edbc: 0b090189    	add	w9, w12, w9
10001edc0: b941854c    	ldr	w12, [x10, #0x184]
10001edc4: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001edc8: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001edcc: 7100013f    	cmp	w9, #0x0
10001edd0: 1a8db1cd    	csel	w13, w14, w13, lt
10001edd4: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001edd8: 1a8d01cd    	csel	w13, w14, w13, eq
10001eddc: 33006d8d    	bfxil	w13, w12, #0, #28
10001ede0: b941994c    	ldr	w12, [x10, #0x198]
10001ede4: 531f7d8c    	lsr	w12, w12, #31
10001ede8: 2a0c71ac    	orr	w12, w13, w12, lsl #28
10001edec: b901854c    	str	w12, [x10, #0x184]
10001edf0: b8285969    	str	w9, [x11, w8, uxtw #2]
10001edf4: d65f03c0    	ret

000000010001edf8 <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)0, (field_ov)1>(unsigned int)>:
10001edf8: 53105008    	ubfx	w8, w0, #16, #5
10001edfc: 90003689    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001ee00: 911d4129    	add	x9, x9, #0x750
10001ee04: 530b3c0a    	ubfx	w10, w0, #11, #5
10001ee08: 9104112b    	add	x11, x9, #0x104
10001ee0c: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001ee10: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001ee14: 5315640c    	ubfx	w12, w0, #21, #5
10001ee18: 4a0a010d    	eor	w13, w8, w10
10001ee1c: 0b08014a    	add	w10, w10, w8
10001ee20: 4a080148    	eor	w8, w10, w8
10001ee24: b941992e    	ldr	w14, [x9, #0x198]
10001ee28: 120179cf    	and	w15, w14, #0xbfffffff
10001ee2c: 320205ce    	orr	w14, w14, #0xc0000000
10001ee30: 6a2d011f    	bics	wzr, w8, w13
10001ee34: 1a8fb1c8    	csel	w8, w14, w15, lt
10001ee38: b9019928    	str	w8, [x9, #0x198]
10001ee3c: b82c596a    	str	w10, [x11, w12, uxtw #2]
10001ee40: d65f03c0    	ret

000000010001ee44 <void dppc_interpreter::ppc_add<(field_carry)0, (field_rc)1, (field_ov)1>(unsigned int)>:
10001ee44: 53156408    	ubfx	w8, w0, #21, #5
10001ee48: 53105009    	ubfx	w9, w0, #16, #5
10001ee4c: 530b3c0a    	ubfx	w10, w0, #11, #5
10001ee50: 9000368b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001ee54: 911d416b    	add	x11, x11, #0x750
10001ee58: 9104116c    	add	x12, x11, #0x104
10001ee5c: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001ee60: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001ee64: 4a0a012d    	eor	w13, w9, w10
10001ee68: 0b09014a    	add	w10, w10, w9
10001ee6c: 4a090149    	eor	w9, w10, w9
10001ee70: b941996e    	ldr	w14, [x11, #0x198]
10001ee74: 120179cf    	and	w15, w14, #0xbfffffff
10001ee78: 320205ce    	orr	w14, w14, #0xc0000000
10001ee7c: 6a2d013f    	bics	wzr, w9, w13
10001ee80: 1a8fb1c9    	csel	w9, w14, w15, lt
10001ee84: b9019969    	str	w9, [x11, #0x198]
10001ee88: b941856d    	ldr	w13, [x11, #0x184]
10001ee8c: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001ee90: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001ee94: 7100015f    	cmp	w10, #0x0
10001ee98: 1a8eb1ee    	csel	w14, w15, w14, lt
10001ee9c: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001eea0: 1a8e01ee    	csel	w14, w15, w14, eq
10001eea4: 33006dae    	bfxil	w14, w13, #0, #28
10001eea8: 531f7d29    	lsr	w9, w9, #31
10001eeac: 2a0971c9    	orr	w9, w14, w9, lsl #28
10001eeb0: b9018569    	str	w9, [x11, #0x184]
10001eeb4: b828598a    	str	w10, [x12, w8, uxtw #2]
10001eeb8: d65f03c0    	ret

000000010001eebc <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)0, (field_ov)0>(unsigned int)>:
10001eebc: 53156408    	ubfx	w8, w0, #21, #5
10001eec0: 53105009    	ubfx	w9, w0, #16, #5
10001eec4: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001eec8: 911d414a    	add	x10, x10, #0x750
10001eecc: 9104114b    	add	x11, x10, #0x104
10001eed0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001eed4: 530b3c0c    	ubfx	w12, w0, #11, #5
10001eed8: b86c596c    	ldr	w12, [x11, w12, uxtw #2]
10001eedc: 2b090189    	adds	w9, w12, w9
10001eee0: b941994c    	ldr	w12, [x10, #0x198]
10001eee4: 1202798c    	and	w12, w12, #0xdfffffff
10001eee8: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001eeec: 1a9f21ad    	csel	w13, w13, wzr, hs
10001eef0: 2a0c01ac    	orr	w12, w13, w12
10001eef4: b901994c    	str	w12, [x10, #0x198]
10001eef8: b8285969    	str	w9, [x11, w8, uxtw #2]
10001eefc: d65f03c0    	ret

000000010001ef00 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)1, (field_ov)0>(unsigned int)>:
10001ef00: 53156408    	ubfx	w8, w0, #21, #5
10001ef04: 53105009    	ubfx	w9, w0, #16, #5
10001ef08: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ef0c: 911d414a    	add	x10, x10, #0x750
10001ef10: 530b3c0b    	ubfx	w11, w0, #11, #5
10001ef14: 9104114c    	add	x12, x10, #0x104
10001ef18: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001ef1c: b86b598b    	ldr	w11, [x12, w11, uxtw #2]
10001ef20: 2b090169    	adds	w9, w11, w9
10001ef24: b941994b    	ldr	w11, [x10, #0x198]
10001ef28: 1202796d    	and	w13, w11, #0xdfffffff
10001ef2c: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001ef30: 1a9f21cf    	csel	w15, w14, wzr, hs
10001ef34: 2a0d01ed    	orr	w13, w15, w13
10001ef38: b901994d    	str	w13, [x10, #0x198]
10001ef3c: b941854d    	ldr	w13, [x10, #0x184]
10001ef40: 52a8000f    	mov	w15, #0x40000000        ; =1073741824
10001ef44: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001ef48: 7100013f    	cmp	w9, #0x0
10001ef4c: 1a8fb20f    	csel	w15, w16, w15, lt
10001ef50: 1a8f01ce    	csel	w14, w14, w15, eq
10001ef54: 33037d6e    	bfxil	w14, w11, #3, #29
10001ef58: 33006dae    	bfxil	w14, w13, #0, #28
10001ef5c: b901854e    	str	w14, [x10, #0x184]
10001ef60: b8285989    	str	w9, [x12, w8, uxtw #2]
10001ef64: d65f03c0    	ret

000000010001ef68 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)0, (field_ov)1>(unsigned int)>:
10001ef68: 53105008    	ubfx	w8, w0, #16, #5
10001ef6c: 530b3c09    	ubfx	w9, w0, #11, #5
10001ef70: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001ef74: 911d414a    	add	x10, x10, #0x750
10001ef78: 9104114b    	add	x11, x10, #0x104
10001ef7c: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001ef80: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001ef84: b941994c    	ldr	w12, [x10, #0x198]
10001ef88: 1202798c    	and	w12, w12, #0xdfffffff
10001ef8c: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001ef90: 2b08012e    	adds	w14, w9, w8
10001ef94: 4a0801cf    	eor	w15, w14, w8
10001ef98: 1a9f21ad    	csel	w13, w13, wzr, hs
10001ef9c: 2a0c01ac    	orr	w12, w13, w12
10001efa0: 5315640d    	ubfx	w13, w0, #21, #5
10001efa4: 4a090108    	eor	w8, w8, w9
10001efa8: 12017989    	and	w9, w12, #0xbfffffff
10001efac: 3202058c    	orr	w12, w12, #0xc0000000
10001efb0: 6a2801ff    	bics	wzr, w15, w8
10001efb4: 1a89b188    	csel	w8, w12, w9, lt
10001efb8: b9019948    	str	w8, [x10, #0x198]
10001efbc: b82d596e    	str	w14, [x11, w13, uxtw #2]
10001efc0: d65f03c0    	ret

000000010001efc4 <void dppc_interpreter::ppc_add<(field_carry)1, (field_rc)1, (field_ov)1>(unsigned int)>:
10001efc4: 53105008    	ubfx	w8, w0, #16, #5
10001efc8: 530b3c09    	ubfx	w9, w0, #11, #5
10001efcc: 9000368a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001efd0: 911d414a    	add	x10, x10, #0x750
10001efd4: 9104114b    	add	x11, x10, #0x104
10001efd8: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001efdc: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001efe0: b941994c    	ldr	w12, [x10, #0x198]
10001efe4: 1202798c    	and	w12, w12, #0xdfffffff
10001efe8: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001efec: 2b08012e    	adds	w14, w9, w8
10001eff0: 4a0801cf    	eor	w15, w14, w8
10001eff4: 1a9f21b0    	csel	w16, w13, wzr, hs
10001eff8: 2a0c020c    	orr	w12, w16, w12
10001effc: 53156410    	ubfx	w16, w0, #21, #5
10001f000: 4a090108    	eor	w8, w8, w9
10001f004: 12017989    	and	w9, w12, #0xbfffffff
10001f008: 3202058c    	orr	w12, w12, #0xc0000000
10001f00c: 6a2801ff    	bics	wzr, w15, w8
10001f010: 1a89b188    	csel	w8, w12, w9, lt
10001f014: b9019948    	str	w8, [x10, #0x198]
10001f018: b9418549    	ldr	w9, [x10, #0x184]
10001f01c: 52a8000c    	mov	w12, #0x40000000        ; =1073741824
10001f020: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001f024: 710001df    	cmp	w14, #0x0
10001f028: 1a8cb1ec    	csel	w12, w15, w12, lt
10001f02c: 1a8c01ac    	csel	w12, w13, w12, eq
10001f030: 33006d2c    	bfxil	w12, w9, #0, #28
10001f034: 531f7d08    	lsr	w8, w8, #31
10001f038: 2a087188    	orr	w8, w12, w8, lsl #28
10001f03c: b9018548    	str	w8, [x10, #0x184]
10001f040: b830596e    	str	w14, [x11, w16, uxtw #2]
10001f044: d65f03c0    	ret

000000010001f048 <void dppc_interpreter::ppc_adde<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f048: 53105009    	ubfx	w9, w0, #16, #5
10001f04c: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
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
10001f0bc: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
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
10001f134: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
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
10001f1bc: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
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

000000010001f25c <void dppc_interpreter::ppc_addme<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f25c: 53105008    	ubfx	w8, w0, #16, #5
10001f260: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f264: 911d4129    	add	x9, x9, #0x750
10001f268: 9104112a    	add	x10, x9, #0x104
10001f26c: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f270: b941992b    	ldr	w11, [x9, #0x198]
10001f274: 531d7d6c    	lsr	w12, w11, #29
10001f278: 1200018d    	and	w13, w12, #0x1
10001f27c: 0b0d010d    	add	w13, w8, w13
10001f280: 510005ad    	sub	w13, w13, #0x1
10001f284: 6b0801bf    	cmp	w13, w8
10001f288: 1a9f27e8    	cset	w8, lo
10001f28c: 2a080188    	orr	w8, w12, w8
10001f290: 1202796b    	and	w11, w11, #0xdfffffff
10001f294: 7200011f    	tst	w8, #0x1
10001f298: 52a40008    	mov	w8, #0x20000000         ; =536870912
10001f29c: 1a9f1108    	csel	w8, w8, wzr, ne
10001f2a0: 2a0b0108    	orr	w8, w8, w11
10001f2a4: b9019928    	str	w8, [x9, #0x198]
10001f2a8: 53156408    	ubfx	w8, w0, #21, #5
10001f2ac: b828594d    	str	w13, [x10, w8, uxtw #2]
10001f2b0: d65f03c0    	ret

000000010001f2b4 <void dppc_interpreter::ppc_addme<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f2b4: 53105008    	ubfx	w8, w0, #16, #5
10001f2b8: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f2bc: 911d4129    	add	x9, x9, #0x750
10001f2c0: 9104112a    	add	x10, x9, #0x104
10001f2c4: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f2c8: b941992b    	ldr	w11, [x9, #0x198]
10001f2cc: 531d7d6c    	lsr	w12, w11, #29
10001f2d0: 1200018d    	and	w13, w12, #0x1
10001f2d4: 0b0801ad    	add	w13, w13, w8
10001f2d8: 4b0d03ee    	neg	w14, w13
10001f2dc: 510005ad    	sub	w13, w13, #0x1
10001f2e0: 6b0801bf    	cmp	w13, w8
10001f2e4: 1a9f27ef    	cset	w15, lo
10001f2e8: 2a0f018c    	orr	w12, w12, w15
10001f2ec: 1202796b    	and	w11, w11, #0xdfffffff
10001f2f0: 7200019f    	tst	w12, #0x1
10001f2f4: 52a4000c    	mov	w12, #0x20000000        ; =536870912
10001f2f8: 1a9f118c    	csel	w12, w12, wzr, ne
10001f2fc: 2a0b018b    	orr	w11, w12, w11
10001f300: 5315640c    	ubfx	w12, w0, #21, #5
10001f304: 1201796f    	and	w15, w11, #0xbfffffff
10001f308: 3202056b    	orr	w11, w11, #0xc0000000
10001f30c: 6a0e011f    	tst	w8, w14
10001f310: 1a8fb168    	csel	w8, w11, w15, lt
10001f314: b9019928    	str	w8, [x9, #0x198]
10001f318: b82c594d    	str	w13, [x10, w12, uxtw #2]
10001f31c: d65f03c0    	ret

000000010001f320 <void dppc_interpreter::ppc_addme<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f320: 53105008    	ubfx	w8, w0, #16, #5
10001f324: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f328: 911d4129    	add	x9, x9, #0x750
10001f32c: 9104112a    	add	x10, x9, #0x104
10001f330: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f334: b941992b    	ldr	w11, [x9, #0x198]
10001f338: 531d7d6c    	lsr	w12, w11, #29
10001f33c: 1200018d    	and	w13, w12, #0x1
10001f340: 0b0d010d    	add	w13, w8, w13
10001f344: 510005ad    	sub	w13, w13, #0x1
10001f348: 6b0801bf    	cmp	w13, w8
10001f34c: 1a9f27e8    	cset	w8, lo
10001f350: 2a080188    	orr	w8, w12, w8
10001f354: 1202796c    	and	w12, w11, #0xdfffffff
10001f358: 7200011f    	tst	w8, #0x1
10001f35c: 52a40008    	mov	w8, #0x20000000         ; =536870912
10001f360: 1a9f110e    	csel	w14, w8, wzr, ne
10001f364: 2a0c01cc    	orr	w12, w14, w12
10001f368: b901992c    	str	w12, [x9, #0x198]
10001f36c: 5315640c    	ubfx	w12, w0, #21, #5
10001f370: b941852e    	ldr	w14, [x9, #0x184]
10001f374: 52a8000f    	mov	w15, #0x40000000        ; =1073741824
10001f378: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001f37c: 710001bf    	cmp	w13, #0x0
10001f380: 1a8fb20f    	csel	w15, w16, w15, lt
10001f384: 1a8f0108    	csel	w8, w8, w15, eq
10001f388: 12006dce    	and	w14, w14, #0xfffffff
10001f38c: 531f7d6b    	lsr	w11, w11, #31
10001f390: 2a0b71cb    	orr	w11, w14, w11, lsl #28
10001f394: 2a080168    	orr	w8, w11, w8
10001f398: b9018528    	str	w8, [x9, #0x184]
10001f39c: b82c594d    	str	w13, [x10, w12, uxtw #2]
10001f3a0: d65f03c0    	ret

000000010001f3a4 <void dppc_interpreter::ppc_addme<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f3a4: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
10001f3a8: 911d4108    	add	x8, x8, #0x750
10001f3ac: 53105009    	ubfx	w9, w0, #16, #5
10001f3b0: 9104110a    	add	x10, x8, #0x104
10001f3b4: b8695949    	ldr	w9, [x10, w9, uxtw #2]
10001f3b8: b941990b    	ldr	w11, [x8, #0x198]
10001f3bc: 531d7d6c    	lsr	w12, w11, #29
10001f3c0: 1200018d    	and	w13, w12, #0x1
10001f3c4: 0b0901ad    	add	w13, w13, w9
10001f3c8: 4b0d03ee    	neg	w14, w13
10001f3cc: 510005ad    	sub	w13, w13, #0x1
10001f3d0: 6b0901bf    	cmp	w13, w9
10001f3d4: 1a9f27ef    	cset	w15, lo
10001f3d8: 2a0f018c    	orr	w12, w12, w15
10001f3dc: 1202796b    	and	w11, w11, #0xdfffffff
10001f3e0: 7200019f    	tst	w12, #0x1
10001f3e4: 52a4000c    	mov	w12, #0x20000000        ; =536870912
10001f3e8: 1a9f118f    	csel	w15, w12, wzr, ne
10001f3ec: 2a0b01eb    	orr	w11, w15, w11
10001f3f0: 5315640f    	ubfx	w15, w0, #21, #5
10001f3f4: 12017970    	and	w16, w11, #0xbfffffff
10001f3f8: 3202056b    	orr	w11, w11, #0xc0000000
10001f3fc: 6a0e013f    	tst	w9, w14
10001f400: 1a90b169    	csel	w9, w11, w16, lt
10001f404: b9019909    	str	w9, [x8, #0x198]
10001f408: b941850b    	ldr	w11, [x8, #0x184]
10001f40c: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001f410: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001f414: 710001bf    	cmp	w13, #0x0
10001f418: 1a8eb20e    	csel	w14, w16, w14, lt
10001f41c: 1a8e018c    	csel	w12, w12, w14, eq
10001f420: 33006d6c    	bfxil	w12, w11, #0, #28
10001f424: 531f7d29    	lsr	w9, w9, #31
10001f428: 2a097189    	orr	w9, w12, w9, lsl #28
10001f42c: b9018509    	str	w9, [x8, #0x184]
10001f430: b82f594d    	str	w13, [x10, w15, uxtw #2]
10001f434: d65f03c0    	ret

000000010001f438 <void dppc_interpreter::ppc_addze<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f438: 53105008    	ubfx	w8, w0, #16, #5
10001f43c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f440: 911d4129    	add	x9, x9, #0x750
10001f444: 9104112a    	add	x10, x9, #0x104
10001f448: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f44c: b941992b    	ldr	w11, [x9, #0x198]
10001f450: 531d756c    	ubfx	w12, w11, #29, #1
10001f454: 2b080188    	adds	w8, w12, w8
10001f458: 1202796b    	and	w11, w11, #0xdfffffff
10001f45c: 52a4000c    	mov	w12, #0x20000000        ; =536870912
10001f460: 1a9f218c    	csel	w12, w12, wzr, hs
10001f464: 2a0b018b    	orr	w11, w12, w11
10001f468: b901992b    	str	w11, [x9, #0x198]
10001f46c: 53156409    	ubfx	w9, w0, #21, #5
10001f470: b8295948    	str	w8, [x10, w9, uxtw #2]
10001f474: d65f03c0    	ret

000000010001f478 <void dppc_interpreter::ppc_addze<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f478: 53105008    	ubfx	w8, w0, #16, #5
10001f47c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f480: 911d4129    	add	x9, x9, #0x750
10001f484: 9104112a    	add	x10, x9, #0x104
10001f488: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f48c: b941992b    	ldr	w11, [x9, #0x198]
10001f490: 531d756c    	ubfx	w12, w11, #29, #1
10001f494: 2b08018c    	adds	w12, w12, w8
10001f498: 1202796b    	and	w11, w11, #0xdfffffff
10001f49c: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001f4a0: 1a9f21ad    	csel	w13, w13, wzr, hs
10001f4a4: 2a0b01ab    	orr	w11, w13, w11
10001f4a8: 5315640d    	ubfx	w13, w0, #21, #5
10001f4ac: 1201796e    	and	w14, w11, #0xbfffffff
10001f4b0: 3202056b    	orr	w11, w11, #0xc0000000
10001f4b4: 6a28019f    	bics	wzr, w12, w8
10001f4b8: 1a8eb168    	csel	w8, w11, w14, lt
10001f4bc: b9019928    	str	w8, [x9, #0x198]
10001f4c0: b82d594c    	str	w12, [x10, w13, uxtw #2]
10001f4c4: d65f03c0    	ret

000000010001f4c8 <void dppc_interpreter::ppc_addze<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f4c8: 53105008    	ubfx	w8, w0, #16, #5
10001f4cc: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f4d0: 911d4129    	add	x9, x9, #0x750
10001f4d4: 9104112a    	add	x10, x9, #0x104
10001f4d8: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f4dc: b941992b    	ldr	w11, [x9, #0x198]
10001f4e0: 531d756c    	ubfx	w12, w11, #29, #1
10001f4e4: 2b080188    	adds	w8, w12, w8
10001f4e8: 1202796c    	and	w12, w11, #0xdfffffff
10001f4ec: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001f4f0: 1a9f21ae    	csel	w14, w13, wzr, hs
10001f4f4: 2a0c01cc    	orr	w12, w14, w12
10001f4f8: b901992c    	str	w12, [x9, #0x198]
10001f4fc: 5315640c    	ubfx	w12, w0, #21, #5
10001f500: b941852e    	ldr	w14, [x9, #0x184]
10001f504: 52a8000f    	mov	w15, #0x40000000        ; =1073741824
10001f508: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001f50c: 7100011f    	cmp	w8, #0x0
10001f510: 1a8fb20f    	csel	w15, w16, w15, lt
10001f514: 1a8f01ad    	csel	w13, w13, w15, eq
10001f518: 12006dce    	and	w14, w14, #0xfffffff
10001f51c: 531f7d6b    	lsr	w11, w11, #31
10001f520: 2a0b71cb    	orr	w11, w14, w11, lsl #28
10001f524: 2a0d016b    	orr	w11, w11, w13
10001f528: b901852b    	str	w11, [x9, #0x184]
10001f52c: b82c5948    	str	w8, [x10, w12, uxtw #2]
10001f530: d65f03c0    	ret

000000010001f534 <void dppc_interpreter::ppc_addze<(field_rc)1, (field_ov)1>(unsigned int)>:
10001f534: 53105008    	ubfx	w8, w0, #16, #5
10001f538: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f53c: 911d4129    	add	x9, x9, #0x750
10001f540: 9104112a    	add	x10, x9, #0x104
10001f544: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001f548: b941992b    	ldr	w11, [x9, #0x198]
10001f54c: 531d756c    	ubfx	w12, w11, #29, #1
10001f550: 2b08018c    	adds	w12, w12, w8
10001f554: 1202796b    	and	w11, w11, #0xdfffffff
10001f558: 52a4000d    	mov	w13, #0x20000000        ; =536870912
10001f55c: 1a9f21ae    	csel	w14, w13, wzr, hs
10001f560: 2a0b01cb    	orr	w11, w14, w11
10001f564: 5315640e    	ubfx	w14, w0, #21, #5
10001f568: 1201796f    	and	w15, w11, #0xbfffffff
10001f56c: 3202056b    	orr	w11, w11, #0xc0000000
10001f570: 6a28019f    	bics	wzr, w12, w8
10001f574: 1a8fb168    	csel	w8, w11, w15, lt
10001f578: b9019928    	str	w8, [x9, #0x198]
10001f57c: b941852b    	ldr	w11, [x9, #0x184]
10001f580: 52a8000f    	mov	w15, #0x40000000        ; =1073741824
10001f584: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001f588: 7100019f    	cmp	w12, #0x0
10001f58c: 1a8fb20f    	csel	w15, w16, w15, lt
10001f590: 1a8f01ad    	csel	w13, w13, w15, eq
10001f594: 33006d6d    	bfxil	w13, w11, #0, #28
10001f598: 531f7d08    	lsr	w8, w8, #31
10001f59c: 2a0871a8    	orr	w8, w13, w8, lsl #28
10001f5a0: b9018528    	str	w8, [x9, #0x184]
10001f5a4: b82e594c    	str	w12, [x10, w14, uxtw #2]
10001f5a8: d65f03c0    	ret

000000010001f5ac <dppc_interpreter::ppc_subfic(unsigned int)>:
10001f5ac: 53105009    	ubfx	w9, w0, #16, #5
10001f5b0: 53103c0b    	lsl	w11, w0, #16
10001f5b4: 13003c0c    	sxth	w12, w0
10001f5b8: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
10001f5bc: 911d4108    	add	x8, x8, #0x750
10001f5c0: 8b294909    	add	x9, x8, w9, uxtw #2
10001f5c4: b941052a    	ldr	w10, [x9, #0x104]
10001f5c8: 4b0a0189    	sub	w9, w12, w10
10001f5cc: 3140417f    	cmn	w11, #0x10, lsl #12     ; =0x10000
10001f5d0: 54000101    	b.ne	0x10001f5f0 <dppc_interpreter::ppc_subfic(unsigned int)+0x44>
10001f5d4: b941990a    	ldr	w10, [x8, #0x198]
10001f5d8: 3203014a    	orr	w10, w10, #0x20000000
10001f5dc: b901990a    	str	w10, [x8, #0x198]
10001f5e0: 5315640a    	ubfx	w10, w0, #21, #5
10001f5e4: 8b2a4908    	add	x8, x8, w10, uxtw #2
10001f5e8: b9010509    	str	w9, [x8, #0x104]
10001f5ec: d65f03c0    	ret
10001f5f0: 2a2a03ea    	mvn	w10, w10
10001f5f4: 6b0a013f    	cmp	w9, w10
10001f5f8: 1a9f27eb    	cset	w11, lo
10001f5fc: b941990a    	ldr	w10, [x8, #0x198]
10001f600: 3303016a    	bfi	w10, w11, #29, #1
10001f604: b901990a    	str	w10, [x8, #0x198]
10001f608: 5315640a    	ubfx	w10, w0, #21, #5
10001f60c: 8b2a4908    	add	x8, x8, w10, uxtw #2
10001f610: b9010509    	str	w9, [x8, #0x104]
10001f614: d65f03c0    	ret

000000010001f618 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)0, (field_ov)0>(unsigned int)>:
10001f618: 53156408    	ubfx	w8, w0, #21, #5
10001f61c: 53105009    	ubfx	w9, w0, #16, #5
10001f620: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f624: 911d414a    	add	x10, x10, #0x750
10001f628: 9104114a    	add	x10, x10, #0x104
10001f62c: b8695949    	ldr	w9, [x10, w9, uxtw #2]
10001f630: 530b3c0b    	ubfx	w11, w0, #11, #5
10001f634: b86b594b    	ldr	w11, [x10, w11, uxtw #2]
10001f638: 4b090169    	sub	w9, w11, w9
10001f63c: b8285949    	str	w9, [x10, w8, uxtw #2]
10001f640: d65f03c0    	ret

000000010001f644 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)0, (field_ov)1>(unsigned int)>:
10001f644: 53105008    	ubfx	w8, w0, #16, #5
10001f648: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f64c: 911d4129    	add	x9, x9, #0x750
10001f650: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f654: 9104112b    	add	x11, x9, #0x104
10001f658: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f65c: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f660: 5315640c    	ubfx	w12, w0, #21, #5
10001f664: 4a08014d    	eor	w13, w10, w8
10001f668: 4b080148    	sub	w8, w10, w8
10001f66c: 4a0a010a    	eor	w10, w8, w10
10001f670: b941992e    	ldr	w14, [x9, #0x198]
10001f674: 120179cf    	and	w15, w14, #0xbfffffff
10001f678: 320205ce    	orr	w14, w14, #0xc0000000
10001f67c: 6a0d015f    	tst	w10, w13
10001f680: 1a8fb1ca    	csel	w10, w14, w15, lt
10001f684: b901992a    	str	w10, [x9, #0x198]
10001f688: b82c5968    	str	w8, [x11, w12, uxtw #2]
10001f68c: d65f03c0    	ret

000000010001f690 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)1, (field_ov)0>(unsigned int)>:
10001f690: 53105008    	ubfx	w8, w0, #16, #5
10001f694: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f698: 911d4129    	add	x9, x9, #0x750
10001f69c: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f6a0: 9104112b    	add	x11, x9, #0x104
10001f6a4: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f6a8: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f6ac: 6b08014c    	subs	w12, w10, w8
10001f6b0: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f6b4: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f6b8: 7100019f    	cmp	w12, #0x0
10001f6bc: 1a8db1cc    	csel	w12, w14, w13, lt
10001f6c0: 6b080148    	subs	w8, w10, w8
10001f6c4: 5315640a    	ubfx	w10, w0, #21, #5
10001f6c8: b941852d    	ldr	w13, [x9, #0x184]
10001f6cc: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001f6d0: 1a8c01cc    	csel	w12, w14, w12, eq
10001f6d4: 33006dac    	bfxil	w12, w13, #0, #28
10001f6d8: b941992d    	ldr	w13, [x9, #0x198]
10001f6dc: 531f7dad    	lsr	w13, w13, #31
10001f6e0: 2a0d718c    	orr	w12, w12, w13, lsl #28
10001f6e4: b901852c    	str	w12, [x9, #0x184]
10001f6e8: b82a5968    	str	w8, [x11, w10, uxtw #2]
10001f6ec: d65f03c0    	ret

000000010001f6f0 <void dppc_interpreter::ppc_subf<(field_carry)0, (field_rc)1, (field_ov)1>(unsigned int)>:
10001f6f0: 53105008    	ubfx	w8, w0, #16, #5
10001f6f4: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f6f8: 911d4129    	add	x9, x9, #0x750
10001f6fc: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f700: 9104112b    	add	x11, x9, #0x104
10001f704: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f708: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f70c: 6b08014c    	subs	w12, w10, w8
10001f710: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f714: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f718: 7100019f    	cmp	w12, #0x0
10001f71c: 1a8db1cc    	csel	w12, w14, w13, lt
10001f720: 5315640d    	ubfx	w13, w0, #21, #5
10001f724: 4a08014e    	eor	w14, w10, w8
10001f728: 6b080148    	subs	w8, w10, w8
10001f72c: 4a0a010a    	eor	w10, w8, w10
10001f730: b941992f    	ldr	w15, [x9, #0x198]
10001f734: 120179f0    	and	w16, w15, #0xbfffffff
10001f738: 320205ef    	orr	w15, w15, #0xc0000000
10001f73c: 52a40011    	mov	w17, #0x20000000        ; =536870912
10001f740: 1a8c022c    	csel	w12, w17, w12, eq
10001f744: 6a0e015f    	tst	w10, w14
10001f748: 1a90b1ea    	csel	w10, w15, w16, lt
10001f74c: b901992a    	str	w10, [x9, #0x198]
10001f750: b941852e    	ldr	w14, [x9, #0x184]
10001f754: 33006dcc    	bfxil	w12, w14, #0, #28
10001f758: 531f7d4a    	lsr	w10, w10, #31
10001f75c: 2a0a718a    	orr	w10, w12, w10, lsl #28
10001f760: b901852a    	str	w10, [x9, #0x184]
10001f764: b82d5968    	str	w8, [x11, w13, uxtw #2]
10001f768: d65f03c0    	ret

000000010001f76c <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)0, (field_ov)0>(unsigned int)>:
10001f76c: 53156408    	ubfx	w8, w0, #21, #5
10001f770: 53105009    	ubfx	w9, w0, #16, #5
10001f774: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f778: f000366b    	adrp	x11, 0x1006ee000 <__MergedGlobals+0x370>
10001f77c: 911d416b    	add	x11, x11, #0x750
10001f780: 9104116c    	add	x12, x11, #0x104
10001f784: b8695989    	ldr	w9, [x12, w9, uxtw #2]
10001f788: b86a598a    	ldr	w10, [x12, w10, uxtw #2]
10001f78c: 6b090149    	subs	w9, w10, w9
10001f790: 1a9f37ea    	cset	w10, hs
10001f794: b941996d    	ldr	w13, [x11, #0x198]
10001f798: 3303014d    	bfi	w13, w10, #29, #1
10001f79c: b901996d    	str	w13, [x11, #0x198]
10001f7a0: b8285989    	str	w9, [x12, w8, uxtw #2]
10001f7a4: d65f03c0    	ret

000000010001f7a8 <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)0, (field_ov)1>(unsigned int)>:
10001f7a8: 53105008    	ubfx	w8, w0, #16, #5
10001f7ac: 530b3c09    	ubfx	w9, w0, #11, #5
10001f7b0: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f7b4: 911d414a    	add	x10, x10, #0x750
10001f7b8: 9104114b    	add	x11, x10, #0x104
10001f7bc: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f7c0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f7c4: 6b08012c    	subs	w12, w9, w8
10001f7c8: 4a09018d    	eor	w13, w12, w9
10001f7cc: 1a9f37ee    	cset	w14, hs
10001f7d0: b941994f    	ldr	w15, [x10, #0x198]
10001f7d4: 330301cf    	bfi	w15, w14, #29, #1
10001f7d8: 5315640e    	ubfx	w14, w0, #21, #5
10001f7dc: 4a080128    	eor	w8, w9, w8
10001f7e0: 120179e9    	and	w9, w15, #0xbfffffff
10001f7e4: 320205ef    	orr	w15, w15, #0xc0000000
10001f7e8: 6a0801bf    	tst	w13, w8
10001f7ec: 1a89b1e8    	csel	w8, w15, w9, lt
10001f7f0: b9019948    	str	w8, [x10, #0x198]
10001f7f4: b82e596c    	str	w12, [x11, w14, uxtw #2]
10001f7f8: d65f03c0    	ret

000000010001f7fc <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)1, (field_ov)0>(unsigned int)>:
10001f7fc: 53105008    	ubfx	w8, w0, #16, #5
10001f800: 530b3c09    	ubfx	w9, w0, #11, #5
10001f804: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f808: 911d414a    	add	x10, x10, #0x750
10001f80c: 9104114b    	add	x11, x10, #0x104
10001f810: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f814: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f818: 6b08012c    	subs	w12, w9, w8
10001f81c: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f820: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f824: 7100019f    	cmp	w12, #0x0
10001f828: 1a8db1cc    	csel	w12, w14, w13, lt
10001f82c: 6b080128    	subs	w8, w9, w8
10001f830: 53156409    	ubfx	w9, w0, #21, #5
10001f834: 1a9f37ed    	cset	w13, hs
10001f838: b941994e    	ldr	w14, [x10, #0x198]
10001f83c: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001f840: 1a8c01ec    	csel	w12, w15, w12, eq
10001f844: 33037dcc    	bfxil	w12, w14, #3, #29
10001f848: 330301ae    	bfi	w14, w13, #29, #1
10001f84c: b901994e    	str	w14, [x10, #0x198]
10001f850: b941854d    	ldr	w13, [x10, #0x184]
10001f854: 33006dac    	bfxil	w12, w13, #0, #28
10001f858: b901854c    	str	w12, [x10, #0x184]
10001f85c: b8295968    	str	w8, [x11, w9, uxtw #2]
10001f860: d65f03c0    	ret

000000010001f864 <void dppc_interpreter::ppc_subf<(field_carry)1, (field_rc)1, (field_ov)1>(unsigned int)>:
10001f864: 53105008    	ubfx	w8, w0, #16, #5
10001f868: 530b3c09    	ubfx	w9, w0, #11, #5
10001f86c: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001f870: 911d414a    	add	x10, x10, #0x750
10001f874: 9104114b    	add	x11, x10, #0x104
10001f878: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f87c: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f880: 6b08012c    	subs	w12, w9, w8
10001f884: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001f888: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001f88c: 7100019f    	cmp	w12, #0x0
10001f890: 1a8db1cc    	csel	w12, w14, w13, lt
10001f894: 5315640d    	ubfx	w13, w0, #21, #5
10001f898: 6b08012e    	subs	w14, w9, w8
10001f89c: 4a0901cf    	eor	w15, w14, w9
10001f8a0: 1a9f37f0    	cset	w16, hs
10001f8a4: b9419951    	ldr	w17, [x10, #0x198]
10001f8a8: 33030211    	bfi	w17, w16, #29, #1
10001f8ac: 4a080128    	eor	w8, w9, w8
10001f8b0: 12017a29    	and	w9, w17, #0xbfffffff
10001f8b4: 32020630    	orr	w16, w17, #0xc0000000
10001f8b8: 52a40011    	mov	w17, #0x20000000        ; =536870912
10001f8bc: 1a8c022c    	csel	w12, w17, w12, eq
10001f8c0: 6a0801ff    	tst	w15, w8
10001f8c4: 1a89b208    	csel	w8, w16, w9, lt
10001f8c8: b9019948    	str	w8, [x10, #0x198]
10001f8cc: b9418549    	ldr	w9, [x10, #0x184]
10001f8d0: 33006d2c    	bfxil	w12, w9, #0, #28
10001f8d4: 531f7d08    	lsr	w8, w8, #31
10001f8d8: 2a087188    	orr	w8, w12, w8, lsl #28
10001f8dc: b9018548    	str	w8, [x10, #0x184]
10001f8e0: b82d596e    	str	w14, [x11, w13, uxtw #2]
10001f8e4: d65f03c0    	ret

000000010001f8e8 <void dppc_interpreter::ppc_subfe<(field_rc)0, (field_ov)0>(unsigned int)>:
10001f8e8: 53105009    	ubfx	w9, w0, #16, #5
10001f8ec: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
10001f8f0: 911d4108    	add	x8, x8, #0x750
10001f8f4: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f8f8: 9104110b    	add	x11, x8, #0x104
10001f8fc: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f900: b86a596c    	ldr	w12, [x11, w10, uxtw #2]
10001f904: b941990a    	ldr	w10, [x8, #0x198]
10001f908: 1203014d    	and	w13, w10, #0x20000000
10001f90c: 2a2903eb    	mvn	w11, w9
10001f910: 0b0b0189    	add	w9, w12, w11
10001f914: 0b4d7529    	add	w9, w9, w13, lsr #29
10001f918: 36e800ea    	tbz	w10, #0x1d, 0x10001f934 <void dppc_interpreter::ppc_subfe<(field_rc)0, (field_ov)0>(unsigned int)+0x4c>
10001f91c: 3100059f    	cmn	w12, #0x1
10001f920: 540000a1    	b.ne	0x10001f934 <void dppc_interpreter::ppc_subfe<(field_rc)0, (field_ov)0>(unsigned int)+0x4c>
10001f924: 5315640a    	ubfx	w10, w0, #21, #5
10001f928: 8b2a4908    	add	x8, x8, w10, uxtw #2
10001f92c: b9010509    	str	w9, [x8, #0x104]
10001f930: d65f03c0    	ret
10001f934: 6b0b013f    	cmp	w9, w11
10001f938: 1a9f27eb    	cset	w11, lo
10001f93c: 3303016a    	bfi	w10, w11, #29, #1
10001f940: b901990a    	str	w10, [x8, #0x198]
10001f944: 5315640a    	ubfx	w10, w0, #21, #5
10001f948: 8b2a4908    	add	x8, x8, w10, uxtw #2
10001f94c: b9010509    	str	w9, [x8, #0x104]
10001f950: d65f03c0    	ret

000000010001f954 <void dppc_interpreter::ppc_subfe<(field_rc)0, (field_ov)1>(unsigned int)>:
10001f954: 53105008    	ubfx	w8, w0, #16, #5
10001f958: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001f95c: 911d4129    	add	x9, x9, #0x750
10001f960: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f964: 9104112b    	add	x11, x9, #0x104
10001f968: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001f96c: b86a596a    	ldr	w10, [x11, w10, uxtw #2]
10001f970: b941992c    	ldr	w12, [x9, #0x198]
10001f974: 531d758d    	ubfx	w13, w12, #29, #1
10001f978: 2a2803ee    	mvn	w14, w8
10001f97c: 0b0d014f    	add	w15, w10, w13
10001f980: 0b0e01ef    	add	w15, w15, w14
10001f984: 6b0e01ff    	cmp	w15, w14
10001f988: 1a9f27ee    	cset	w14, lo
10001f98c: 3100055f    	cmn	w10, #0x1
10001f990: 1a9f17f0    	cset	w16, eq
10001f994: aa0c03f1    	mov	x17, x12
10001f998: 330301d1    	bfi	w17, w14, #29, #1
10001f99c: 6a1001bf    	tst	w13, w16
10001f9a0: 1a91118c    	csel	w12, w12, w17, ne
10001f9a4: 5315640d    	ubfx	w13, w0, #21, #5
10001f9a8: 4a080148    	eor	w8, w10, w8
10001f9ac: 4a0a01ea    	eor	w10, w15, w10
10001f9b0: 1201798e    	and	w14, w12, #0xbfffffff
10001f9b4: 3202058c    	orr	w12, w12, #0xc0000000
10001f9b8: 6a08015f    	tst	w10, w8
10001f9bc: 1a8eb188    	csel	w8, w12, w14, lt
10001f9c0: b9019928    	str	w8, [x9, #0x198]
10001f9c4: b82d596f    	str	w15, [x11, w13, uxtw #2]
10001f9c8: d65f03c0    	ret

000000010001f9cc <void dppc_interpreter::ppc_subfe<(field_rc)1, (field_ov)0>(unsigned int)>:
10001f9cc: 53105009    	ubfx	w9, w0, #16, #5
10001f9d0: f0003668    	adrp	x8, 0x1006ee000 <__MergedGlobals+0x370>
10001f9d4: 911d4108    	add	x8, x8, #0x750
10001f9d8: 530b3c0a    	ubfx	w10, w0, #11, #5
10001f9dc: 9104110b    	add	x11, x8, #0x104
10001f9e0: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001f9e4: b86a596c    	ldr	w12, [x11, w10, uxtw #2]
10001f9e8: b941990a    	ldr	w10, [x8, #0x198]
10001f9ec: 1203014d    	and	w13, w10, #0x20000000
10001f9f0: 2a2903eb    	mvn	w11, w9
10001f9f4: 0b0b0189    	add	w9, w12, w11
10001f9f8: 0b4d7529    	add	w9, w9, w13, lsr #29
10001f9fc: 36e8006a    	tbz	w10, #0x1d, 0x10001fa08 <void dppc_interpreter::ppc_subfe<(field_rc)1, (field_ov)0>(unsigned int)+0x3c>
10001fa00: 3100059f    	cmn	w12, #0x1
10001fa04: 540000a0    	b.eq	0x10001fa18 <void dppc_interpreter::ppc_subfe<(field_rc)1, (field_ov)0>(unsigned int)+0x4c>
10001fa08: 6b0b013f    	cmp	w9, w11
10001fa0c: 1a9f27eb    	cset	w11, lo
10001fa10: 3303016a    	bfi	w10, w11, #29, #1
10001fa14: b901990a    	str	w10, [x8, #0x198]
10001fa18: 5315640b    	ubfx	w11, w0, #21, #5
10001fa1c: b941850c    	ldr	w12, [x8, #0x184]
10001fa20: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001fa24: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001fa28: 7100013f    	cmp	w9, #0x0
10001fa2c: 1a8db1cd    	csel	w13, w14, w13, lt
10001fa30: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001fa34: 1a8d01cd    	csel	w13, w14, w13, eq
10001fa38: 33006d8d    	bfxil	w13, w12, #0, #28
10001fa3c: 531f7d4a    	lsr	w10, w10, #31
10001fa40: 2a0a71aa    	orr	w10, w13, w10, lsl #28
10001fa44: b901850a    	str	w10, [x8, #0x184]
10001fa48: 8b2b4908    	add	x8, x8, w11, uxtw #2
10001fa4c: b9010509    	str	w9, [x8, #0x104]
10001fa50: d65f03c0    	ret

000000010001fa54 <void dppc_interpreter::ppc_subfe<(field_rc)1, (field_ov)1>(unsigned int)>:
10001fa54: 53105008    	ubfx	w8, w0, #16, #5
10001fa58: 530b3c09    	ubfx	w9, w0, #11, #5
10001fa5c: f000366a    	adrp	x10, 0x1006ee000 <__MergedGlobals+0x370>
10001fa60: 911d414a    	add	x10, x10, #0x750
10001fa64: 9104114b    	add	x11, x10, #0x104
10001fa68: b8685968    	ldr	w8, [x11, w8, uxtw #2]
10001fa6c: b8695969    	ldr	w9, [x11, w9, uxtw #2]
10001fa70: b941994c    	ldr	w12, [x10, #0x198]
10001fa74: 531d758d    	ubfx	w13, w12, #29, #1
10001fa78: 2a2803ee    	mvn	w14, w8
10001fa7c: 0b0d012f    	add	w15, w9, w13
10001fa80: 0b0e01ef    	add	w15, w15, w14
10001fa84: 6b0e01ff    	cmp	w15, w14
10001fa88: 1a9f27ee    	cset	w14, lo
10001fa8c: 3100053f    	cmn	w9, #0x1
10001fa90: 1a9f17f0    	cset	w16, eq
10001fa94: aa0c03f1    	mov	x17, x12
10001fa98: 330301d1    	bfi	w17, w14, #29, #1
10001fa9c: 6a1001bf    	tst	w13, w16
10001faa0: 1a91118c    	csel	w12, w12, w17, ne
10001faa4: 5315640d    	ubfx	w13, w0, #21, #5
10001faa8: 4a080128    	eor	w8, w9, w8
10001faac: 4a0901e9    	eor	w9, w15, w9
10001fab0: 1201798e    	and	w14, w12, #0xbfffffff
10001fab4: 3202058c    	orr	w12, w12, #0xc0000000
10001fab8: 6a08013f    	tst	w9, w8
10001fabc: 1a8eb188    	csel	w8, w12, w14, lt
10001fac0: b9019948    	str	w8, [x10, #0x198]
10001fac4: b9418549    	ldr	w9, [x10, #0x184]
10001fac8: 52a8000c    	mov	w12, #0x40000000        ; =1073741824
10001facc: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001fad0: 710001ff    	cmp	w15, #0x0
10001fad4: 1a8cb1cc    	csel	w12, w14, w12, lt
10001fad8: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001fadc: 1a8c01cc    	csel	w12, w14, w12, eq
10001fae0: 33006d2c    	bfxil	w12, w9, #0, #28
10001fae4: 531f7d08    	lsr	w8, w8, #31
10001fae8: 2a087188    	orr	w8, w12, w8, lsl #28
10001faec: b9018548    	str	w8, [x10, #0x184]
10001faf0: b82d596f    	str	w15, [x11, w13, uxtw #2]
10001faf4: d65f03c0    	ret

000000010001faf8 <void dppc_interpreter::ppc_subfme<(field_rc)0, (field_ov)0>(unsigned int)>:
10001faf8: 53105008    	ubfx	w8, w0, #16, #5
10001fafc: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fb00: 911d4129    	add	x9, x9, #0x750
10001fb04: 9104112a    	add	x10, x9, #0x104
10001fb08: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fb0c: b941992b    	ldr	w11, [x9, #0x198]
10001fb10: 3203016c    	orr	w12, w11, #0x20000000
10001fb14: 3100051f    	cmn	w8, #0x1
10001fb18: 1a8c016c    	csel	w12, w11, w12, eq
10001fb1c: b901992c    	str	w12, [x9, #0x198]
10001fb20: 531d7569    	ubfx	w9, w11, #29, #1
10001fb24: 4b080128    	sub	w8, w9, w8
10001fb28: 51000908    	sub	w8, w8, #0x2
10001fb2c: 53156409    	ubfx	w9, w0, #21, #5
10001fb30: b8295948    	str	w8, [x10, w9, uxtw #2]
10001fb34: d65f03c0    	ret

000000010001fb38 <void dppc_interpreter::ppc_subfme<(field_rc)0, (field_ov)1>(unsigned int)>:
10001fb38: 53105008    	ubfx	w8, w0, #16, #5
10001fb3c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fb40: 911d4129    	add	x9, x9, #0x750
10001fb44: 9104112a    	add	x10, x9, #0x104
10001fb48: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fb4c: b941992b    	ldr	w11, [x9, #0x198]
10001fb50: 531d756c    	ubfx	w12, w11, #29, #1
10001fb54: 4b08018c    	sub	w12, w12, w8
10001fb58: 5100098c    	sub	w12, w12, #0x2
10001fb5c: 3203016d    	orr	w13, w11, #0x20000000
10001fb60: 3100051f    	cmn	w8, #0x1
10001fb64: 1a8d016b    	csel	w11, w11, w13, eq
10001fb68: 7100019f    	cmp	w12, #0x0
10001fb6c: 7a48c180    	ccmp	w12, w8, #0x0, gt
10001fb70: 12017968    	and	w8, w11, #0xbfffffff
10001fb74: 3202056b    	orr	w11, w11, #0xc0000000
10001fb78: 1a880168    	csel	w8, w11, w8, eq
10001fb7c: b9019928    	str	w8, [x9, #0x198]
10001fb80: 53156408    	ubfx	w8, w0, #21, #5
10001fb84: b828594c    	str	w12, [x10, w8, uxtw #2]
10001fb88: d65f03c0    	ret

000000010001fb8c <void dppc_interpreter::ppc_subfme<(field_rc)1, (field_ov)0>(unsigned int)>:
10001fb8c: 53105008    	ubfx	w8, w0, #16, #5
10001fb90: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fb94: 911d4129    	add	x9, x9, #0x750
10001fb98: 9104112a    	add	x10, x9, #0x104
10001fb9c: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fba0: b941992b    	ldr	w11, [x9, #0x198]
10001fba4: 3203016c    	orr	w12, w11, #0x20000000
10001fba8: 3100051f    	cmn	w8, #0x1
10001fbac: 1a8c016c    	csel	w12, w11, w12, eq
10001fbb0: b901992c    	str	w12, [x9, #0x198]
10001fbb4: 531d756b    	ubfx	w11, w11, #29, #1
10001fbb8: 4b080168    	sub	w8, w11, w8
10001fbbc: 51000908    	sub	w8, w8, #0x2
10001fbc0: 5315640b    	ubfx	w11, w0, #21, #5
10001fbc4: b941852d    	ldr	w13, [x9, #0x184]
10001fbc8: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001fbcc: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001fbd0: 7100011f    	cmp	w8, #0x0
10001fbd4: 1a8eb1ee    	csel	w14, w15, w14, lt
10001fbd8: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001fbdc: 1a8e01ee    	csel	w14, w15, w14, eq
10001fbe0: 12006dad    	and	w13, w13, #0xfffffff
10001fbe4: 531f7d8c    	lsr	w12, w12, #31
10001fbe8: 2a0c71ac    	orr	w12, w13, w12, lsl #28
10001fbec: 2a0e018c    	orr	w12, w12, w14
10001fbf0: b901852c    	str	w12, [x9, #0x184]
10001fbf4: b82b5948    	str	w8, [x10, w11, uxtw #2]
10001fbf8: d65f03c0    	ret

000000010001fbfc <void dppc_interpreter::ppc_subfme<(field_rc)1, (field_ov)1>(unsigned int)>:
10001fbfc: 53105008    	ubfx	w8, w0, #16, #5
10001fc00: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fc04: 911d4129    	add	x9, x9, #0x750
10001fc08: 9104112a    	add	x10, x9, #0x104
10001fc0c: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fc10: b941992b    	ldr	w11, [x9, #0x198]
10001fc14: 531d756c    	ubfx	w12, w11, #29, #1
10001fc18: 4b08018c    	sub	w12, w12, w8
10001fc1c: 5100098c    	sub	w12, w12, #0x2
10001fc20: 3203016d    	orr	w13, w11, #0x20000000
10001fc24: 3100051f    	cmn	w8, #0x1
10001fc28: 1a8d016b    	csel	w11, w11, w13, eq
10001fc2c: 52a8000d    	mov	w13, #0x40000000        ; =1073741824
10001fc30: 52b0000e    	mov	w14, #-0x80000000       ; =-2147483648
10001fc34: 7100019f    	cmp	w12, #0x0
10001fc38: 1a8db1cd    	csel	w13, w14, w13, lt
10001fc3c: 52a4000e    	mov	w14, #0x20000000        ; =536870912
10001fc40: 1a8d01cd    	csel	w13, w14, w13, eq
10001fc44: 7100019f    	cmp	w12, #0x0
10001fc48: 7a48c180    	ccmp	w12, w8, #0x0, gt
10001fc4c: 12017968    	and	w8, w11, #0xbfffffff
10001fc50: 3202056b    	orr	w11, w11, #0xc0000000
10001fc54: 1a880168    	csel	w8, w11, w8, eq
10001fc58: b9019928    	str	w8, [x9, #0x198]
10001fc5c: 5315640b    	ubfx	w11, w0, #21, #5
10001fc60: b941852e    	ldr	w14, [x9, #0x184]
10001fc64: 33006dcd    	bfxil	w13, w14, #0, #28
10001fc68: 531f7d08    	lsr	w8, w8, #31
10001fc6c: 2a0871a8    	orr	w8, w13, w8, lsl #28
10001fc70: b9018528    	str	w8, [x9, #0x184]
10001fc74: b82b594c    	str	w12, [x10, w11, uxtw #2]
10001fc78: d65f03c0    	ret

000000010001fc7c <void dppc_interpreter::ppc_subfze<(field_rc)0, (field_ov)0>(unsigned int)>:
10001fc7c: 53105008    	ubfx	w8, w0, #16, #5
10001fc80: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fc84: 911d4129    	add	x9, x9, #0x750
10001fc88: 9104112a    	add	x10, x9, #0x104
10001fc8c: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fc90: b941992b    	ldr	w11, [x9, #0x198]
10001fc94: 531d756c    	ubfx	w12, w11, #29, #1
10001fc98: 2a2803e8    	mvn	w8, w8
10001fc9c: 2b080188    	adds	w8, w12, w8
10001fca0: 1202796c    	and	w12, w11, #0xdfffffff
10001fca4: 1a8c016b    	csel	w11, w11, w12, eq
10001fca8: b901992b    	str	w11, [x9, #0x198]
10001fcac: 53156409    	ubfx	w9, w0, #21, #5
10001fcb0: b8295948    	str	w8, [x10, w9, uxtw #2]
10001fcb4: d65f03c0    	ret

000000010001fcb8 <void dppc_interpreter::ppc_subfze<(field_rc)0, (field_ov)1>(unsigned int)>:
10001fcb8: 53105008    	ubfx	w8, w0, #16, #5
10001fcbc: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fcc0: 911d4129    	add	x9, x9, #0x750
10001fcc4: 9104112a    	add	x10, x9, #0x104
10001fcc8: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fccc: b941992b    	ldr	w11, [x9, #0x198]
10001fcd0: 531d756c    	ubfx	w12, w11, #29, #1
10001fcd4: 2a2803ed    	mvn	w13, w8
10001fcd8: 2b0d018c    	adds	w12, w12, w13
10001fcdc: 1202796d    	and	w13, w11, #0xdfffffff
10001fce0: 1a8d016b    	csel	w11, w11, w13, eq
10001fce4: 6b08019f    	cmp	w12, w8
10001fce8: 7a400984    	ccmp	w12, #0x0, #0x4, eq
10001fcec: 12017968    	and	w8, w11, #0xbfffffff
10001fcf0: 3202056b    	orr	w11, w11, #0xc0000000
10001fcf4: 1a881168    	csel	w8, w11, w8, ne
10001fcf8: b9019928    	str	w8, [x9, #0x198]
10001fcfc: 53156408    	ubfx	w8, w0, #21, #5
10001fd00: b828594c    	str	w12, [x10, w8, uxtw #2]
10001fd04: d65f03c0    	ret

000000010001fd08 <void dppc_interpreter::ppc_subfze<(field_rc)1, (field_ov)0>(unsigned int)>:
10001fd08: 53105008    	ubfx	w8, w0, #16, #5
10001fd0c: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fd10: 911d4129    	add	x9, x9, #0x750
10001fd14: 9104112a    	add	x10, x9, #0x104
10001fd18: b8685948    	ldr	w8, [x10, w8, uxtw #2]
10001fd1c: b941992b    	ldr	w11, [x9, #0x198]
10001fd20: 531d756c    	ubfx	w12, w11, #29, #1
10001fd24: 2a2803e8    	mvn	w8, w8
10001fd28: 0b080188    	add	w8, w12, w8
10001fd2c: 1202796c    	and	w12, w11, #0xdfffffff
10001fd30: 7100011f    	cmp	w8, #0x0
10001fd34: 1a8c016b    	csel	w11, w11, w12, eq
10001fd38: b901992b    	str	w11, [x9, #0x198]
10001fd3c: 5315640c    	ubfx	w12, w0, #21, #5
10001fd40: b941852d    	ldr	w13, [x9, #0x184]
10001fd44: 52a8000e    	mov	w14, #0x40000000        ; =1073741824
10001fd48: 52b0000f    	mov	w15, #-0x80000000       ; =-2147483648
10001fd4c: 1a8eb1ee    	csel	w14, w15, w14, lt
10001fd50: 52a4000f    	mov	w15, #0x20000000        ; =536870912
10001fd54: 1a8e01ee    	csel	w14, w15, w14, eq
10001fd58: 33006dae    	bfxil	w14, w13, #0, #28
10001fd5c: 531f7d6b    	lsr	w11, w11, #31
10001fd60: 2a0b71cb    	orr	w11, w14, w11, lsl #28
10001fd64: b901852b    	str	w11, [x9, #0x184]
10001fd68: b82c5948    	str	w8, [x10, w12, uxtw #2]
10001fd6c: d65f03c0    	ret

000000010001fd70 <void dppc_interpreter::ppc_subfze<(field_rc)1, (field_ov)1>(unsigned int)>:
10001fd70: 53105008    	ubfx	w8, w0, #16, #5
10001fd74: f0003669    	adrp	x9, 0x1006ee000 <__MergedGlobals+0x370>
10001fd78: 911d4129    	add	x9, x9, #0x750
10001fd7c: 8b284928    	add	x8, x9, w8, uxtw #2
10001fd80: b9410508    	ldr	w8, [x8, #0x104]
10001fd84: b941992a    	ldr	w10, [x9, #0x198]
10001fd88: 531d754b    	ubfx	w11, w10, #29, #1
10001fd8c: 2a2803ec    	mvn	w12, w8
10001fd90: 0b0c016b    	add	w11, w11, w12
10001fd94: 1202794c    	and	w12, w10, #0xdfffffff
10001fd98: b941852d    	ldr	w13, [x9, #0x184]
10001fd9c: 7100017f    	cmp	w11, #0x0
10001fda0: 1a8c014a    	csel	w10, w10, w12, eq
10001fda4: 1201794e    	and	w14, w10, #0xbfffffff
10001fda8: 52a8000f    	mov	w15, #0x40000000        ; =1073741824
10001fdac: 52b00010    	mov	w16, #-0x80000000       ; =-2147483648
10001fdb0: 1a8fb20f    	csel	w15, w16, w15, lt
10001fdb4: 52a40010    	mov	w16, #0x20000000        ; =536870912
10001fdb8: 1a8f020f    	csel	w15, w16, w15, eq
10001fdbc: 33037d4f    	bfxil	w15, w10, #3, #29
10001fdc0: 33006daf    	bfxil	w15, w13, #0, #28
10001fdc4: 3202058a    	orr	w10, w12, #0xc0000000
10001fdc8: 52aa000c    	mov	w12, #0x50000000        ; =1342177280
10001fdcc: 52b20010    	mov	w16, #-0x70000000       ; =-1879048192
10001fdd0: 7100011f    	cmp	w8, #0x0
10001fdd4: 1a8cb20c    	csel	w12, w16, w12, lt
10001fdd8: 33006dac    	bfxil	w12, w13, #0, #28
10001fddc: 7100017f    	cmp	w11, #0x0
10001fde0: 7a481160    	ccmp	w11, w8, #0x0, ne
10001fde4: 1a8a11c8    	csel	w8, w14, w10, ne
10001fde8: 1a8c11ea    	csel	w10, w15, w12, ne
10001fdec: b9019928    	str	w8, [x9, #0x198]
10001fdf0: b901852a    	str	w10, [x9, #0x184]
10001fdf4: 53156408    	ubfx	w8, w0, #21, #5
10001fdf8: 8b284928    	add	x8, x9, w8, uxtw #2
10001fdfc: b901050b    	str	w11, [x8, #0x104]
10001fe00: d65f03c0    	ret
