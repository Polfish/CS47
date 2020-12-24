	.file	"p2.cpp"
	.text
	.globl	_Z6sorterPlll
	.def	_Z6sorterPlll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6sorterPlll
_Z6sorterPlll:
.LFB19:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
.L6:
	movq	24(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -8(%rbp)
	jge	.L7
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L5:
	movq	-16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jge	.L3
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jle	.L4
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
.L4:
	addq	$1, -16(%rbp)
	jmp	.L5
.L3:
	addq	$1, -8(%rbp)
	jmp	.L6
.L7:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s filename asc_des\12\0"
.LC1:
	.ascii "rtc\0"
.LC2:
	.ascii "File %s was not opened\12\0"
.LC3:
	.ascii "%ld\0"
.LC4:
	.ascii "%ld \0"
.LC5:
	.ascii "\12\12Number of integer = %ld\12\0"
.LC6:
	.ascii "Ascend_or_Descend = %ld\12\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB20:
	pushq	%rbp
	.seh_pushreg	%rbp
	movl	$8064, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	8064
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 7952(%rbp)
	movq	%rdx, 7960(%rbp)
	call	__main
	movq	$0, 7928(%rbp)
	cmpl	$3, 7952(%rbp)
	je	.L9
	movq	7960(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L19
.L9:
	movq	7960(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atol
	movq	%rax, 7912(%rbp)
	cmpq	$1, 7912(%rbp)
	jne	.L11
	movl	$1, %eax
	jmp	.L12
.L11:
	movl	$2, %eax
.L12:
	movq	%rax, 7912(%rbp)
	movl	$10, %ecx
	call	putchar
	movq	7960(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 7904(%rbp)
	cmpq	$0, 7904(%rbp)
	jne	.L13
	movq	7960(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	jmp	.L14
.L13:
	movq	7904(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseek
.L16:
	leaq	-96(%rbp), %rdx
	movq	7928(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	7904(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	cmpl	$-1, %eax
	setne	%al
	testb	%al, %al
	je	.L15
	movq	7928(%rbp), %rax
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	addq	$1, 7928(%rbp)
	jmp	.L16
.L15:
	movq	7928(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	movq	7912(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rcx
	call	printf
	movq	7904(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L14:
	movq	7912(%rbp), %rcx
	movq	7928(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_Z6sorterPlll
	movl	$0, 7924(%rbp)
.L18:
	movl	7924(%rbp), %eax
	cltq
	cmpq	%rax, 7928(%rbp)
	jle	.L17
	movl	7924(%rbp), %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	addl	$1, 7924(%rbp)
	jmp	.L18
.L17:
	movl	$10, %ecx
	call	putchar
	movl	$0, %eax
.L19:
	addq	$8064, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 10.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	atol;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	fscanf;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
