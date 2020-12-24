	.file	"p1_64.cpp"
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
 # 11 "p1_64.cpp" 1
	movq %rax, %rax;addq %rdx, %rax;
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z4multll
	.def	_Z4multll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4multll
_Z4multll:
.LFB20:
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
	movq	%rax, %rcx
/APP
 # 37 "p1_64.cpp" 1
	xorq %rax, %rax;jmp test;loop:addq %rcx, %rax;decq %rdx;test:cmpq $0, %rdx;jg loop;
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z3XORll
	.def	_Z3XORll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3XORll
_Z3XORll:
.LFB21:
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
 # 63 "p1_64.cpp" 1
	movq %rax, %rax;xorq %rdx, %rax;
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z6rotatelll
	.def	_Z6rotatelll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6rotatelll
_Z6rotatelll:
.LFB22:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	32(%rbp), %rcx
/APP
 # 85 "p1_64.cpp" 1
	movq %rax, %rax;movq %rdx, %rbx;movq %rcx, %rcx;cmpq $1, %rbx;jz Rotate_Left;rcrq %rcx, %rax;jmp done;Rotate_Left:rclq %rcx, %rax;end:
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z9factoriall
	.def	_Z9factoriall;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9factoriall
_Z9factoriall:
.LFB23:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$1, 16(%rbp)
	jne	.L10
	movl	$1, %eax
	jmp	.L11
.L10:
	movq	16(%rbp), %rax
	subq	$1, %rax
	movq	%rax, %rcx
	call	_Z9factoriall
	imulq	16(%rbp), %rax
.L11:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z3modll
	.def	_Z3modll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3modll
_Z3modll:
.LFB24:
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
	movq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	-16(%rbp), %rdx
/APP
 # 127 "p1_64.cpp" 1
	movq %rax, %rax;movq %rdx, %rbx;cdq;idivq %rbx;movq %rdx, %rax;
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z5shiftlll
	.def	_Z5shiftlll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5shiftlll
_Z5shiftlll:
.LFB25:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L15
	movl	$1, %eax
	jmp	.L16
.L15:
	movl	$0, %eax
.L16:
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	32(%rbp), %rcx
/APP
 # 157 "p1_64.cpp" 1
	movq %rax, %rax;movq %rdx, %rbx;movq %rcx, %rcx;cmpq $1, %rbx;jz Shift_Left;sarq %cl, %rax;jmp done;Shift_Left:salq %cl, %rax;done:
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Usage: %s op1 op2 (two integers)\12\0"
	.align 8
.LC1:
	.ascii "Operand 1 = %ld x%016lx  Operand 2 = %ld x%016lx\12\0"
.LC2:
	.ascii "Add():\11%10ld   x%016lx\12\0"
.LC3:
	.ascii "Mult():\11%10ld   x%016lx\12\0"
.LC4:
	.ascii "XOR():\11%10ld   x%016lx\12\0"
.LC5:
	.ascii "RotateL():\11%10ld   x%016lx\12\0"
.LC6:
	.ascii "RotateR():\11%10ld   x%016lx\12\0"
.LC7:
	.ascii "Mod Error: Divide by 0\0"
.LC8:
	.ascii "Mod():\11%10ld   x%016lx\12\0"
	.align 8
.LC9:
	.ascii "Error: Shift count must be >= 0\0"
.LC10:
	.ascii "ShiftL:\11%10ld   x%016lx\12\0"
.LC11:
	.ascii "ShiftR:\11%10ld   x%016lx\12\0"
	.align 8
.LC12:
	.ascii "Error: Factorial input must be a positive integer >=1\0"
.LC13:
	.ascii "Fact():\11%10ld   x%016lx\12\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB26:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	movq	$0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	cmpl	$3, 16(%rbp)
	je	.L19
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L20
.L19:
	movq	24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atol
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atol
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %r8
	movq	-24(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	_Z3addll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4multll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	_Z3XORll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z6rotatelll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z6rotatelll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rcx
	call	printf
	cmpq	$0, -16(%rbp)
	jne	.L21
	leaq	.LC7(%rip), %rcx
	call	puts
	movq	$0, -8(%rbp)
	jmp	.L22
.L21:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	_Z3modll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	printf
.L22:
	cmpq	$0, -16(%rbp)
	jns	.L23
	leaq	.LC9(%rip), %rcx
	call	puts
	movq	$0, -8(%rbp)
	jmp	.L24
.L23:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	_Z5shiftlll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	_Z5shiftlll
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rcx
	call	printf
.L24:
	cmpq	$0, -24(%rbp)
	jg	.L25
	leaq	.LC12(%rip), %rcx
	call	puts
	movq	$0, -8(%rbp)
	jmp	.L26
.L25:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	_Z9factoriall
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rcx
	call	printf
.L26:
	movl	$0, %eax
.L20:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 10.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	atol;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
