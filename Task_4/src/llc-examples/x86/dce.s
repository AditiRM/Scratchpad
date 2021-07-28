	.text
	.file	"dce.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -16(%rbp)
	movl	$17000, -12(%rbp)       # imm = 0x4268
	movl	$0, -8(%rbp)
	movl	$2, -4(%rbp)
	movq	$17001, -24(%rbp)       # imm = 0x4269
	movl	$.L.str, %edi
	movl	$17001, %esi            # imm = 0x4269
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	main.flags,@object      # @main.flags
	.local	main.flags
	.comm	main.flags,8193,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5

	.ident	"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"
	.section	".note.GNU-stack","",@progbits
