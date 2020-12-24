	.file	"encrypt_sample.cpp"
	.text
	.globl	direction
	.bss
	.align 8
direction:
	.space 8
	.globl	shiftcount
	.data
	.align 8
shiftcount:
	.quad	2
	.text
	.globl	_Z7get_keyPlS_
	.def	_Z7get_keyPlS_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7get_keyPlS_
_Z7get_keyPlS_:
.LFB0:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	direction(%rip), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	shiftcount(%rip), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z7set_keyll
	.def	_Z7set_keyll;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7set_keyll
_Z7set_keyll:
.LFB1:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, direction(%rip)
	movq	24(%rbp), %rax
	movq	%rax, shiftcount(%rip)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z9s_encryptPcS_l
	.def	_Z9s_encryptPcS_l;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9s_encryptPcS_l
_Z9s_encryptPcS_l:
.LFB2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	movq	16(%rbp), %rcx
	call	strlen
	movq	%rax, -16(%rbp)
	movq	shiftcount(%rip), %rcx
	movabsq	$5675921253449092805, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	movq	%rcx, %r8
	sarq	$63, %r8
	subq	%r8, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movq	%rdx, -24(%rbp)
	movq	16(%rbp), %rax
/APP
 # 33 "encrypt_sample.cpp" 1
	movq %rax, %rax;movq 24(%rbp), %rbx;movq 32(%rbp), %rcx;movq -16(%rbp), %rdi;pushq %rdi;movq -24(%rbp), %rsi;loop_start:movb (%rax), %dl;movb %dl, (%rbx);inc %rax;inc %rbx;dec %rdi;cmpq $0, %rdi;jne loop_start;movb $0, (%rbx);popq %rax;
 # 0 "" 2
/NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 10.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
