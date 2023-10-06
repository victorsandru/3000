	.file	"3000memview.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Local Message"
.LC1:
	.string	"Memory report"
.LC2:
	.string	"argv:      %lx\n"
.LC3:
	.string	"argv[0]:   %lx\n"
.LC4:
	.string	"envp:      %lx\n"
.LC5:
	.string	"envp[0]:   %lx\n"
.LC6:
	.string	"lmsg:      %lx\n"
.LC7:
	.string	"&lmsg:     %lx\n"
.LC8:
	.string	"gmsg:      %lx\n"
.LC9:
	.string	"&gmsg:     %lx\n"
.LC10:
	.string	"main:      %lx\n"
.LC11:
	.string	"sbrk(0):   %lx\n"
.LC12:
	.string	"&buf:      %lx\n"
.LC13:
	.string	"buf[0]:    %lx\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 3, -48
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, -48(%rbp)
	movq	%rsp, %rax
	cmpq	%rax, %rsp
	je	.L3
.L10:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L10
.L3:
	subq	$800, %rsp
	orq	$0, 792(%rsp)
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	leaq	7(%rsp), %rbx
	call	__printf_chk@PLT
	movq	(%r14), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	movq	%rbx, %r13
	andq	$-8, %rbx
	call	__printf_chk@PLT
	movq	%r12, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	shrq	$3, %r13
	call	__printf_chk@PLT
	movq	(%r12), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rsi
	leaq	800(%rbx), %r12
	call	__printf_chk@PLT
	movq	-48(%rbp), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rsi
	call	__printf_chk@PLT
	leaq	-48(%rbp), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC7(%rip), %rsi
	call	__printf_chk@PLT
	movq	gmsg(%rip), %rdx
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	leaq	gmsg(%rip), %rdx
	leaq	.LC9(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	leaq	main(%rip), %rdx
	leaq	.LC10(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%edi, %edi
	call	sbrk@PLT
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rsi
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$4096, %edi
	addq	$8, %rbx
	call	malloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L5
	movq	0(,%r13,8), %rdx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%edi, %edi
	call	sbrk@PLT
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	-40(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L11
	leaq	-32(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.globl	buffer_size
	.section	.rodata
	.align 4
	.type	buffer_size, @object
	.size	buffer_size, 4
buffer_size:
	.long	100
	.globl	gmsg
	.section	.rodata.str1.1
.LC14:
	.string	"Global Message"
	.section	.data.rel.local,"aw"
	.align 8
	.type	gmsg, @object
	.size	gmsg, 8
gmsg:
	.quad	.LC14
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
