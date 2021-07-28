	.text
	.file	"licm-example.c"
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
	subq	$48, %rsp
	movl	$0, -36(%rbp)
	movl	$17000, -12(%rbp)       # imm = 0x4268
	movl	$0, -8(%rbp)
	movl	$1, -4(%rbp)
	movl	$17000, %eax            # imm = 0x4268
	xorl	%esi, %esi
	movq	-32(%rbp), %rdi
	movl	$1, %edx
	movq	-24(%rbp), %rcx
	.p2align	4, 0x90
.LBB0_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_10 Depth 3
	addl	$-1, %eax
	jae	.LBB0_13
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	leal	1(%rax), %esi
	movl	$2, %edi
	cmpq	$8192, %rdi             # imm = 0x2000
	jg	.LBB0_5
	.p2align	4, 0x90
.LBB0_4:                                # %for.body
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	$1, main.flags(%rdi)
	addq	$1, %rdi
	movl	%esi, %edx
	cmpq	$8192, %rdi             # imm = 0x2000
	jle	.LBB0_4
.LBB0_5:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$2, %edi
	xorl	%esi, %esi
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_11:                               # %for.end13
                                        #   in Loop: Header=BB0_6 Depth=2
	addl	$1, %esi
.LBB0_12:                               # %if.end
                                        #   in Loop: Header=BB0_6 Depth=2
	addq	$1, %rdi
.LBB0_6:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_10 Depth 3
	cmpq	$8192, %rdi             # imm = 0x2000
	jg	.LBB0_1
# %bb.7:                                # %for.body3
                                        #   in Loop: Header=BB0_6 Depth=2
	cmpb	$0, main.flags(%rdi)
	je	.LBB0_12
# %bb.8:                                # %if.then
                                        #   in Loop: Header=BB0_6 Depth=2
	leaq	(%rdi,%rdi), %rcx
	cmpq	$8192, %rcx             # imm = 0x2000
	jg	.LBB0_11
	.p2align	4, 0x90
.LBB0_10:                               # %for.body9
                                        #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movb	$0, main.flags(%rcx)
	addq	%rdi, %rcx
	cmpq	$8192, %rcx             # imm = 0x2000
	jle	.LBB0_10
	jmp	.LBB0_11
.LBB0_13:                               # %while.end
	movl	%eax, -12(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdi, -32(%rbp)
	movl	%edx, -4(%rbp)
	movq	%rcx, -24(%rbp)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$48, %rsp
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

	.ident	"clang version 10.0.1 "
	.section	".note.GNU-stack","",@progbits
