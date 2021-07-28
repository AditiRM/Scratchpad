	.text
	.file	"licm.c"
	.globl	main                    // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %entry
	sub	sp, sp, #48             // =48
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w10, #17000
	str	wzr, [sp, #4]
	mov	w8, #1
	mov	w9, #2
	stp	w10, wzr, [x29, #-8]
	str	w8, [sp]
	adrp	x10, main.flags
	add	x10, x10, :lo12:main.flags
.LBB0_1:                                // %while.cond
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_3 Depth 2
                                        //     Child Loop BB0_8 Depth 2
                                        //       Child Loop BB0_11 Depth 3
	ldur	w11, [x29, #-8]
	subs	w11, w11, #1            // =1
	stur	w11, [x29, #-8]
	b.lo	.LBB0_13
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB0_1 Depth=1
	str	wzr, [sp, #4]
	str	x9, [sp, #16]
.LBB0_3:                                // %for.cond
                                        //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x11, [sp, #16]
	cmp	x11, #2, lsl #12        // =8192
	b.gt	.LBB0_5
// %bb.4:                               // %for.body
                                        //   in Loop: Header=BB0_3 Depth=2
	ldur	w11, [x29, #-8]
	ldr	x12, [sp, #16]
	add	w11, w11, #1            // =1
	strb	w8, [x10, x12]
	add	x12, x12, #1            // =1
	str	w11, [sp]
	str	x12, [sp, #16]
	b	.LBB0_3
.LBB0_5:                                // %for.end
                                        //   in Loop: Header=BB0_1 Depth=1
	str	x9, [sp, #16]
	b	.LBB0_8
.LBB0_6:                                // %for.end13
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	w11, [sp, #4]
	add	w11, w11, #1            // =1
	str	w11, [sp, #4]
.LBB0_7:                                // %for.inc15
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	x11, [sp, #16]
	add	x11, x11, #1            // =1
	str	x11, [sp, #16]
.LBB0_8:                                // %for.cond1
                                        //   Parent Loop BB0_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_11 Depth 3
	ldr	x11, [sp, #16]
	cmp	x11, #2, lsl #12        // =8192
	b.gt	.LBB0_1
// %bb.9:                               // %for.body3
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	x11, [sp, #16]
	ldrb	w11, [x10, x11]
	cbz	w11, .LBB0_7
// %bb.10:                              // %if.then
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	x11, [sp, #16]
	add	x11, x11, x11
.LBB0_11:                               // %for.cond7
                                        //   Parent Loop BB0_1 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	str	x11, [sp, #8]
	cmp	x11, #2, lsl #12        // =8192
	b.gt	.LBB0_6
// %bb.12:                              // %for.body9
                                        //   in Loop: Header=BB0_11 Depth=3
	ldp	x11, x12, [sp, #8]
	strb	wzr, [x10, x11]
	add	x11, x11, x12
	b	.LBB0_11
.LBB0_13:                               // %while.end
	ldr	w1, [sp, #4]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.type	main.flags,@object      // @main.flags
	.local	main.flags
	.comm	main.flags,8193,16
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Count: %d\n"
	.size	.L.str, 11

	.ident	"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"
	.section	".note.GNU-stack","",@progbits
