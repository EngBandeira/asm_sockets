	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)# aloca 4 bytes para o rax
	xorl	%eax, %eax
	movl	$17 51 67 11 38, -13(%rbp) # aloca 6 bytes
	movb	$0, -9(%rbp)
	movl	$3, -20(%rbp)#int 
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
# 8 rax 
# 9	\
# 10	\
# 11	\
# 12	\
# 13	char[5] b
# 14	\
# 15	\
# 16	\
# 17	\
# 18	\
# 19	\
# 20	int k
