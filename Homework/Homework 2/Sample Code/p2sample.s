	.file	"p2sample.cpp"
	.text
	.globl	_Z3addll
	.def	_Z3addll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3addll
_Z3addll:
.LFB19:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
/APP
 # 12 "p2sample.cpp" 1
	movq %rax, %rax;addq %rdx, %rax;
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6sorterPlll
	.def	_Z6sorterPlll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6sorterPlll
_Z6sorterPlll:
.LFB20:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rcx
/APP
 # 28 "p2sample.cpp" 1
	movq %rax, %rax;movq %rdx, %rbx;movq %rcx, %rcx;xorq %rdx, %rdx;loop_start:dec %rcx;cmpq %rdx, %rcx;jle done;movq (%rax, %rcx, 8), %r10;movq (%rax, %rdx, 8), %r11;xchgq %r10, (%rax, %rdx, 8);xchgq %r11, (%rax, %rcx, 8);inc %rdx;jmp loop_start;done:
 # 0 "" 2
/NO_APP
	nop
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
.LFB21:
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
	je	.L5
	movq	7960(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L15
.L5:
	movq	7960(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atol
	movq	%rax, 7912(%rbp)
	cmpq	$1, 7912(%rbp)
	jne	.L7
	movl	$1, %eax
	jmp	.L8
.L7:
	movl	$2, %eax
.L8:
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
	jne	.L9
	movq	7960(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	jmp	.L10
.L9:
	movq	7904(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseek
.L12:
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
	je	.L11
	movq	7928(%rbp), %rax
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	addq	$1, 7928(%rbp)
	jmp	.L12
.L11:
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
.L10:
	movq	7912(%rbp), %rcx
	movq	7928(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	_Z6sorterPlll
	movl	$0, 7924(%rbp)
.L14:
	movl	7924(%rbp), %eax
	cltq
	cmpq	%rax, 7928(%rbp)
	jle	.L13
	movl	7924(%rbp), %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	addl	$1, 7924(%rbp)
	jmp	.L14
.L13:
	movl	$10, %ecx
	call	putchar
	movl	$0, %eax
.L15:
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
