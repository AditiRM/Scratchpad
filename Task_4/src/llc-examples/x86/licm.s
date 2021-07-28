	.text
	.file	"licm.c"
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
	movl	$0, -32(%rbp)
	movl	$17000, -16(%rbp)       # imm = 0x4268
	movl	$0, -12(%rbp)
	movl	$1, -28(%rbp)
	.p2align	4, 0x90
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_9 Depth 3
	addl	$-1, -16(%rbp)
	jae	.LBB0_13
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -12(%rbp)
	movq	$2, -8(%rbp)
	cmpq	$8192, -8(%rbp)         # imm = 0x2000
	jg	.LBB0_5
	.p2align	4, 0x90
.LBB0_4:                                # %for.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movb	$1, main.flags(%rax)
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	cmpq	$8192, -8(%rbp)         # imm = 0x2000
	jle	.LBB0_4
.LBB0_5:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	$2, -8(%rbp)
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_11:                               # %for.end13
                                        #   in Loop: Header=BB0_6 Depth=2
	addl	$1, -12(%rbp)
.LBB0_12:                               # %if.end
                                        #   in Loop: Header=BB0_6 Depth=2
	addq	$1, -8(%rbp)
.LBB0_6:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
	cmpq	$8192, -8(%rbp)         # imm = 0x2000
	jg	.LBB0_1
# %bb.7:                                # %for.body3
                                        #   in Loop: Header=BB0_6 Depth=2
	movq	-8(%rbp), %rax
	cmpb	$0, main.flags(%rax)
	je	.LBB0_12
# %bb.8:                                # %if.then
                                        #   in Loop: Header=BB0_6 Depth=2
	movq	-8(%rbp), %rax
	addq	%rax, %rax
	.p2align	4, 0x90
.LBB0_9:                                # %for.cond7
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%rax, -24(%rbp)
	cmpq	$8192, -24(%rbp)        # imm = 0x2000
	jg	.LBB0_11
# %bb.10:                               # %for.body9
                                        #   in Loop: Header=BB0_9 Depth=3
	movq	-24(%rbp), %rax
	movb	$0, main.flags(%rax)
	addq	-8(%rbp), %rax
	jmp	.LBB0_9
.LBB0_13:                               # %while.end
	movl	-12(%rbp), %esi
	movl	$.L.str, %edi
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
	.asciz	"Count: %d\n"
	.size	.L.str, 11

	.ident	"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"
	.section	".note.GNU-stack","",@progbits
