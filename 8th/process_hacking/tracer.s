	.file	"tracer.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"byte_offset:%llx\n"
.LC1:
	.string	"errno: %s\n"
.LC2:
	.string	"PEEKDATA: %llx \n"
	.text
	.globl	print_peek_data
	.type	print_peek_data, @function
print_peek_data:
.LFB5:
	.file 1 "util.c"
	.loc 1 13 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 14 0
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 16 0
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -24(%rbp)
	.loc 1 17 0
	cmpq	$-1, -24(%rbp)
	sete	%bl
	.loc 1 17 0
	call	__errno_location@PLT
	movl	(%rax), %eax
	.loc 1 17 0
	testl	%eax, %eax
	setne	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L2
	.loc 1 18 0
	call	__errno_location@PLT
	.loc 1 18 0
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	.loc 1 20 0
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 21 0
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_peek_data, .-print_peek_data
	.section	.rodata
.LC3:
	.string	"peekdata hexaddr: "
.LC4:
	.string	"%llx"
	.text
	.globl	print_peek_data_interactively
	.type	print_peek_data_interactively, @function
print_peek_data_interactively:
.LFB6:
	.loc 1 23 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 23 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 25 0
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 26 0
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 27 0
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	print_peek_data
	.loc 1 28 0
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_peek_data_interactively, .-print_peek_data_interactively
	.section	.rodata
	.align 8
.LC5:
	.string	"  poke_data called pid:%d, offset:%lld, word:%llx\n"
.LC6:
	.string	"  word:%llx\n"
	.text
	.globl	poke_data
	.type	poke_data, @function
poke_data:
.LFB7:
	.loc 1 30 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 32 0
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 33 0
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 34 0
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -24(%rbp)
	.loc 1 35 0
	cmpq	$-1, -24(%rbp)
	sete	%bl
	.loc 1 35 0
	call	__errno_location@PLT
	movl	(%rax), %eax
	.loc 1 35 0
	testl	%eax, %eax
	setne	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L7
	.loc 1 36 0
	call	__errno_location@PLT
	.loc 1 36 0
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	.loc 1 38 0
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	poke_data, .-poke_data
	.section	.rodata
.LC7:
	.string	"poke hexaddr: "
.LC8:
	.string	"hexword:"
	.text
	.globl	poke_data_interactively
	.type	poke_data_interactively, @function
poke_data_interactively:
.LFB8:
	.loc 1 40 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	.loc 1 40 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 43 0
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 44 0
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 45 0
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 46 0
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 47 0
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	poke_data
	.loc 1 49 0
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	poke_data_interactively, .-poke_data_interactively
	.section	.rodata
.LC9:
	.string	"general purpose registers"
.LC10:
	.string	"r15:     %16llx %30s\n"
.LC11:
	.string	"r14:     %16llx\n"
.LC12:
	.string	"r13:     %16llx\n"
.LC13:
	.string	"r12:     %16llx\n"
.LC14:
	.string	"rbp:     %16llx\n"
.LC15:
	.string	"rbx:     %16llx\n"
.LC16:
	.string	"r11:     %16llx\n"
.LC17:
	.string	"r10:     %16llx\n"
.LC18:
	.string	"6."
.LC19:
	.string	"r9:      %16llx   %s\n"
.LC20:
	.string	"5."
.LC21:
	.string	"r8:      %16llx   %s\n"
.LC22:
	.string	"rax:     %16llx\n"
.LC23:
	.string	"4."
.LC24:
	.string	"rcx:     %16llx   %s\n"
.LC25:
	.string	"3."
.LC26:
	.string	"rdx:     %16llx   %s\n"
.LC27:
	.string	"2."
.LC28:
	.string	"rsi:     %16llx   %s\n"
.LC29:
	.string	"1. function/syscall argument"
.LC30:
	.string	"rdi:     %16llx %30s\n"
.LC31:
	.string	"orig_rax:%16llx\n"
.LC32:
	.string	"instruction pointer"
.LC33:
	.string	"rip:     %16llx %30s\n"
.LC34:
	.string	"cs:      %16llx\n"
.LC35:
	.string	"eflags:  %16llx\n"
	.align 8
.LC36:
	.string	"  Stack Pointer (current location in stack)"
.LC37:
	.string	"rsp:     %16llx %30s\n"
.LC38:
	.string	"ss:      %16llx\n"
.LC39:
	.string	"fs_base: %16llx\n"
.LC40:
	.string	"gs_base: %16llx\n"
.LC41:
	.string	"ds:      %16llx\n"
.LC42:
	.string	"es:      %16llx\n"
.LC43:
	.string	"fs:      %16llx\n"
.LC44:
	.string	"gs:      %16llx\n"
	.text
	.globl	print_user_regs_struct
	.type	print_user_regs_struct, @function
print_user_regs_struct:
.LFB9:
	.loc 1 51 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 52 0
	movq	16(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 53 0
	movq	24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 54 0
	movq	32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 55 0
	movq	40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 56 0
	movq	48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 57 0
	movq	56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 58 0
	movq	64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 59 0
	movq	72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 60 0
	movq	80(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 61 0
	movq	88(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 62 0
	movq	96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 63 0
	movq	104(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 64 0
	movq	112(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 65 0
	movq	120(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 66 0
	movq	128(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 67 0
	movq	136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 68 0
	movq	144(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 69 0
	movq	152(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 70 0
	movq	160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 71 0
	movq	168(%rbp), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 72 0
	movq	176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 73 0
	movq	184(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 74 0
	movq	192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 75 0
	movq	200(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 76 0
	movq	208(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 77 0
	movq	216(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 78 0
	movq	224(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 79 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	print_user_regs_struct, .-print_user_regs_struct
	.section	.rodata
	.align 8
.LC45:
	.string	"(q)uit, next (s)tep, (p)eek data, (P)oke data, print (r)egisters  "
	.text
	.globl	peekpoke_interactively
	.type	peekpoke_interactively, @function
peekpoke_interactively:
.LFB10:
	.loc 1 81 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 82 0
	leaq	.LC45(%rip), %rdi
	call	puts@PLT
	.loc 1 84 0
	jmp	.L12
.L17:
	.loc 1 85 0
	call	getchar@PLT
	movb	%al, -1(%rbp)
	.loc 1 86 0
	cmpb	$10, -1(%rbp)
	je	.L12
	.loc 1 87 0
	movsbl	-1(%rbp), %eax
	cmpl	$112, %eax
	je	.L13
	cmpl	$114, %eax
	je	.L14
	cmpl	$80, %eax
	je	.L15
	jmp	.L12
.L13:
	.loc 1 88 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	print_peek_data_interactively
	jmp	.L12
.L15:
	.loc 1 89 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	poke_data_interactively
	jmp	.L12
.L14:
	.loc 1 90 0
	subq	$8, %rsp
	pushq	224(%rbp)
	pushq	216(%rbp)
	pushq	208(%rbp)
	pushq	200(%rbp)
	pushq	192(%rbp)
	pushq	184(%rbp)
	pushq	176(%rbp)
	pushq	168(%rbp)
	pushq	160(%rbp)
	pushq	152(%rbp)
	pushq	144(%rbp)
	pushq	136(%rbp)
	pushq	128(%rbp)
	pushq	120(%rbp)
	pushq	112(%rbp)
	pushq	104(%rbp)
	pushq	96(%rbp)
	pushq	88(%rbp)
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	call	print_user_regs_struct
	addq	$224, %rsp
	nop
.L12:
	.loc 1 84 0
	cmpb	$115, -1(%rbp)
	je	.L16
	.loc 1 84 0 is_stmt 0 discriminator 1
	cmpb	$113, -1(%rbp)
	jne	.L17
.L16:
	.loc 1 95 0 is_stmt 1
	cmpb	$113, -1(%rbp)
	jne	.L18
	.loc 1 96 0
	movl	$0, %eax
	jmp	.L19
.L18:
	.loc 1 98 0
	movl	$1, %eax
.L19:
	.loc 1 100 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	peekpoke_interactively, .-peekpoke_interactively
	.comm	tracee_pid,4,4
	.comm	regs,216,32
	.comm	status,4,4
	.globl	keep_looping
	.data
	.type	keep_looping, @object
	.size	keep_looping, 1
keep_looping:
	.byte	1
	.section	.rodata
	.align 8
.LC46:
	.string	"[USAGE]: ./tracer <pid-of-target-process>"
.LC47:
	.string	"[ CURRENT REGISTER STATE ]"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.file 2 "tracer.c"
	.loc 2 18 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 2 20 0
	cmpl	$1, -4(%rbp)
	jg	.L21
	.loc 2 21 0
	leaq	.LC46(%rip), %rdi
	call	puts@PLT
	.loc 2 22 0
	movl	$-1, %eax
	jmp	.L22
.L21:
	.loc 2 24 0
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, tracee_pid(%rip)
	.loc 2 25 0
	movl	tracee_pid(%rip), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$16, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 26 0
	movl	tracee_pid(%rip), %eax
	movl	$0, %edx
	leaq	status(%rip), %rsi
	movl	%eax, %edi
	call	waitpid@PLT
	.loc 2 28 0
	jmp	.L23
.L24:
	.loc 2 29 0
	movl	tracee_pid(%rip), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$9, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 30 0
	movl	tracee_pid(%rip), %eax
	movl	$0, %edx
	leaq	status(%rip), %rsi
	movl	%eax, %edi
	call	waitpid@PLT
	.loc 2 31 0
	movl	tracee_pid(%rip), %eax
	leaq	regs(%rip), %rcx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$12, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 32 0
	leaq	.LC47(%rip), %rdi
	call	puts@PLT
	.loc 2 33 0
	subq	$8, %rsp
	pushq	208+regs(%rip)
	pushq	200+regs(%rip)
	pushq	192+regs(%rip)
	pushq	184+regs(%rip)
	pushq	176+regs(%rip)
	pushq	168+regs(%rip)
	pushq	160+regs(%rip)
	pushq	152+regs(%rip)
	pushq	144+regs(%rip)
	pushq	136+regs(%rip)
	pushq	128+regs(%rip)
	pushq	120+regs(%rip)
	pushq	112+regs(%rip)
	pushq	104+regs(%rip)
	pushq	96+regs(%rip)
	pushq	88+regs(%rip)
	pushq	80+regs(%rip)
	pushq	72+regs(%rip)
	pushq	64+regs(%rip)
	pushq	56+regs(%rip)
	pushq	48+regs(%rip)
	pushq	40+regs(%rip)
	pushq	32+regs(%rip)
	pushq	24+regs(%rip)
	pushq	16+regs(%rip)
	pushq	8+regs(%rip)
	pushq	regs(%rip)
	call	print_user_regs_struct
	addq	$224, %rsp
	.loc 2 34 0
	movl	tracee_pid(%rip), %eax
	subq	$8, %rsp
	pushq	208+regs(%rip)
	pushq	200+regs(%rip)
	pushq	192+regs(%rip)
	pushq	184+regs(%rip)
	pushq	176+regs(%rip)
	pushq	168+regs(%rip)
	pushq	160+regs(%rip)
	pushq	152+regs(%rip)
	pushq	144+regs(%rip)
	pushq	136+regs(%rip)
	pushq	128+regs(%rip)
	pushq	120+regs(%rip)
	pushq	112+regs(%rip)
	pushq	104+regs(%rip)
	pushq	96+regs(%rip)
	pushq	88+regs(%rip)
	pushq	80+regs(%rip)
	pushq	72+regs(%rip)
	pushq	64+regs(%rip)
	pushq	56+regs(%rip)
	pushq	48+regs(%rip)
	pushq	40+regs(%rip)
	pushq	32+regs(%rip)
	pushq	24+regs(%rip)
	pushq	16+regs(%rip)
	pushq	8+regs(%rip)
	pushq	regs(%rip)
	movl	%eax, %edi
	call	peekpoke_interactively
	addq	$224, %rsp
	movb	%al, keep_looping(%rip)
.L23:
	.loc 2 28 0
	movzbl	keep_looping(%rip), %eax
	testb	%al, %al
	jne	.L24
	.loc 2 36 0
	movl	tracee_pid(%rip), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$17, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 37 0
	movl	$0, %eax
.L22:
	.loc 2 38 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
.Letext0:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/sys/wait.h"
	.file 5 "/usr/include/signal.h"
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 7 "/usr/include/unistd.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 10 "/usr/include/stdio.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 12 "/usr/include/x86_64-linux-gnu/sys/user.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/ptrace.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x805
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF126
	.byte	0xc
	.long	.LASF127
	.long	.LASF128
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
	.byte	0x8c
	.long	0x5e
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x8d
	.long	0x5e
	.uleb128 0x4
	.long	.LASF9
	.byte	0x3
	.byte	0x8e
	.long	0x57
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x8e
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x8e
	.uleb128 0x8
	.long	.LASF129
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0xd
	.byte	0x1d
	.long	0x19d
	.uleb128 0x9
	.long	.LASF11
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x1
	.uleb128 0x9
	.long	.LASF13
	.byte	0x2
	.uleb128 0x9
	.long	.LASF14
	.byte	0x3
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.uleb128 0x9
	.long	.LASF17
	.byte	0x6
	.uleb128 0x9
	.long	.LASF18
	.byte	0x7
	.uleb128 0x9
	.long	.LASF19
	.byte	0x8
	.uleb128 0x9
	.long	.LASF20
	.byte	0x9
	.uleb128 0x9
	.long	.LASF21
	.byte	0xc
	.uleb128 0x9
	.long	.LASF22
	.byte	0xd
	.uleb128 0x9
	.long	.LASF23
	.byte	0xe
	.uleb128 0x9
	.long	.LASF24
	.byte	0xf
	.uleb128 0x9
	.long	.LASF25
	.byte	0x10
	.uleb128 0x9
	.long	.LASF26
	.byte	0x11
	.uleb128 0x9
	.long	.LASF27
	.byte	0x12
	.uleb128 0x9
	.long	.LASF28
	.byte	0x13
	.uleb128 0x9
	.long	.LASF29
	.byte	0x18
	.uleb128 0x9
	.long	.LASF30
	.byte	0x19
	.uleb128 0x9
	.long	.LASF31
	.byte	0x1a
	.uleb128 0x9
	.long	.LASF32
	.byte	0x1e
	.uleb128 0x9
	.long	.LASF33
	.byte	0x1f
	.uleb128 0x9
	.long	.LASF34
	.byte	0x20
	.uleb128 0x9
	.long	.LASF35
	.byte	0x21
	.uleb128 0xa
	.long	.LASF36
	.value	0x4200
	.uleb128 0xa
	.long	.LASF37
	.value	0x4201
	.uleb128 0xa
	.long	.LASF38
	.value	0x4202
	.uleb128 0xa
	.long	.LASF39
	.value	0x4203
	.uleb128 0xa
	.long	.LASF40
	.value	0x4204
	.uleb128 0xa
	.long	.LASF41
	.value	0x4205
	.uleb128 0xa
	.long	.LASF42
	.value	0x4206
	.uleb128 0xa
	.long	.LASF43
	.value	0x4207
	.uleb128 0xa
	.long	.LASF44
	.value	0x4208
	.uleb128 0xa
	.long	.LASF45
	.value	0x4209
	.uleb128 0xa
	.long	.LASF46
	.value	0x420a
	.uleb128 0xa
	.long	.LASF47
	.value	0x420b
	.uleb128 0xa
	.long	.LASF48
	.value	0x420c
	.byte	0
	.uleb128 0x4
	.long	.LASF49
	.byte	0x4
	.byte	0x1f
	.long	0x7b
	.uleb128 0xb
	.long	0x1c3
	.long	0x1b8
	.uleb128 0xc
	.long	0x42
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0x1a8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x7
	.long	0x1bd
	.uleb128 0xd
	.long	.LASF50
	.byte	0x5
	.value	0x11e
	.long	0x1b8
	.uleb128 0xd
	.long	.LASF51
	.byte	0x5
	.value	0x11f
	.long	0x1b8
	.uleb128 0x4
	.long	.LASF52
	.byte	0x6
	.byte	0xd8
	.long	0x42
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF53
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF54
	.uleb128 0xd
	.long	.LASF55
	.byte	0x7
	.value	0x222
	.long	0x205
	.uleb128 0x6
	.byte	0x8
	.long	0x88
	.uleb128 0xe
	.long	.LASF56
	.byte	0x8
	.byte	0x24
	.long	0x88
	.uleb128 0xe
	.long	.LASF57
	.byte	0x8
	.byte	0x32
	.long	0x57
	.uleb128 0xe
	.long	.LASF58
	.byte	0x8
	.byte	0x37
	.long	0x57
	.uleb128 0xe
	.long	.LASF59
	.byte	0x8
	.byte	0x3b
	.long	0x57
	.uleb128 0xf
	.long	.LASF89
	.byte	0xd8
	.byte	0x9
	.byte	0xf5
	.long	0x3b7
	.uleb128 0x10
	.long	.LASF60
	.byte	0x9
	.byte	0xf6
	.long	0x57
	.byte	0
	.uleb128 0x10
	.long	.LASF61
	.byte	0x9
	.byte	0xfb
	.long	0x88
	.byte	0x8
	.uleb128 0x10
	.long	.LASF62
	.byte	0x9
	.byte	0xfc
	.long	0x88
	.byte	0x10
	.uleb128 0x10
	.long	.LASF63
	.byte	0x9
	.byte	0xfd
	.long	0x88
	.byte	0x18
	.uleb128 0x10
	.long	.LASF64
	.byte	0x9
	.byte	0xfe
	.long	0x88
	.byte	0x20
	.uleb128 0x10
	.long	.LASF65
	.byte	0x9
	.byte	0xff
	.long	0x88
	.byte	0x28
	.uleb128 0x11
	.long	.LASF66
	.byte	0x9
	.value	0x100
	.long	0x88
	.byte	0x30
	.uleb128 0x11
	.long	.LASF67
	.byte	0x9
	.value	0x101
	.long	0x88
	.byte	0x38
	.uleb128 0x11
	.long	.LASF68
	.byte	0x9
	.value	0x102
	.long	0x88
	.byte	0x40
	.uleb128 0x11
	.long	.LASF69
	.byte	0x9
	.value	0x104
	.long	0x88
	.byte	0x48
	.uleb128 0x11
	.long	.LASF70
	.byte	0x9
	.value	0x105
	.long	0x88
	.byte	0x50
	.uleb128 0x11
	.long	.LASF71
	.byte	0x9
	.value	0x106
	.long	0x88
	.byte	0x58
	.uleb128 0x11
	.long	.LASF72
	.byte	0x9
	.value	0x108
	.long	0x3ef
	.byte	0x60
	.uleb128 0x11
	.long	.LASF73
	.byte	0x9
	.value	0x10a
	.long	0x3f5
	.byte	0x68
	.uleb128 0x11
	.long	.LASF74
	.byte	0x9
	.value	0x10c
	.long	0x57
	.byte	0x70
	.uleb128 0x11
	.long	.LASF75
	.byte	0x9
	.value	0x110
	.long	0x57
	.byte	0x74
	.uleb128 0x11
	.long	.LASF76
	.byte	0x9
	.value	0x112
	.long	0x65
	.byte	0x78
	.uleb128 0x11
	.long	.LASF77
	.byte	0x9
	.value	0x116
	.long	0x34
	.byte	0x80
	.uleb128 0x11
	.long	.LASF78
	.byte	0x9
	.value	0x117
	.long	0x49
	.byte	0x82
	.uleb128 0x11
	.long	.LASF79
	.byte	0x9
	.value	0x118
	.long	0x3fb
	.byte	0x83
	.uleb128 0x11
	.long	.LASF80
	.byte	0x9
	.value	0x11c
	.long	0x40b
	.byte	0x88
	.uleb128 0x11
	.long	.LASF81
	.byte	0x9
	.value	0x125
	.long	0x70
	.byte	0x90
	.uleb128 0x11
	.long	.LASF82
	.byte	0x9
	.value	0x12d
	.long	0x86
	.byte	0x98
	.uleb128 0x11
	.long	.LASF83
	.byte	0x9
	.value	0x12e
	.long	0x86
	.byte	0xa0
	.uleb128 0x11
	.long	.LASF84
	.byte	0x9
	.value	0x12f
	.long	0x86
	.byte	0xa8
	.uleb128 0x11
	.long	.LASF85
	.byte	0x9
	.value	0x130
	.long	0x86
	.byte	0xb0
	.uleb128 0x11
	.long	.LASF86
	.byte	0x9
	.value	0x132
	.long	0x1e0
	.byte	0xb8
	.uleb128 0x11
	.long	.LASF87
	.byte	0x9
	.value	0x133
	.long	0x57
	.byte	0xc0
	.uleb128 0x11
	.long	.LASF88
	.byte	0x9
	.value	0x135
	.long	0x411
	.byte	0xc4
	.byte	0
	.uleb128 0x12
	.long	.LASF130
	.byte	0x9
	.byte	0x9a
	.uleb128 0xf
	.long	.LASF90
	.byte	0x18
	.byte	0x9
	.byte	0xa0
	.long	0x3ef
	.uleb128 0x10
	.long	.LASF91
	.byte	0x9
	.byte	0xa1
	.long	0x3ef
	.byte	0
	.uleb128 0x10
	.long	.LASF92
	.byte	0x9
	.byte	0xa2
	.long	0x3f5
	.byte	0x8
	.uleb128 0x10
	.long	.LASF93
	.byte	0x9
	.byte	0xa6
	.long	0x57
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3be
	.uleb128 0x6
	.byte	0x8
	.long	0x237
	.uleb128 0xb
	.long	0x8e
	.long	0x40b
	.uleb128 0xc
	.long	0x42
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3b7
	.uleb128 0xb
	.long	0x8e
	.long	0x421
	.uleb128 0xc
	.long	0x42
	.byte	0x13
	.byte	0
	.uleb128 0x13
	.long	.LASF131
	.uleb128 0xd
	.long	.LASF94
	.byte	0x9
	.value	0x13f
	.long	0x421
	.uleb128 0xd
	.long	.LASF95
	.byte	0x9
	.value	0x140
	.long	0x421
	.uleb128 0xd
	.long	.LASF96
	.byte	0x9
	.value	0x141
	.long	0x421
	.uleb128 0xe
	.long	.LASF97
	.byte	0xa
	.byte	0x87
	.long	0x3f5
	.uleb128 0xe
	.long	.LASF98
	.byte	0xa
	.byte	0x88
	.long	0x3f5
	.uleb128 0xe
	.long	.LASF99
	.byte	0xa
	.byte	0x89
	.long	0x3f5
	.uleb128 0xe
	.long	.LASF100
	.byte	0xb
	.byte	0x1a
	.long	0x57
	.uleb128 0xb
	.long	0x1c3
	.long	0x481
	.uleb128 0x14
	.byte	0
	.uleb128 0x7
	.long	0x476
	.uleb128 0xe
	.long	.LASF101
	.byte	0xb
	.byte	0x1b
	.long	0x481
	.uleb128 0xf
	.long	.LASF102
	.byte	0xd8
	.byte	0xc
	.byte	0x2a
	.long	0x5da
	.uleb128 0x15
	.string	"r15"
	.byte	0xc
	.byte	0x2c
	.long	0x1f2
	.byte	0
	.uleb128 0x15
	.string	"r14"
	.byte	0xc
	.byte	0x2d
	.long	0x1f2
	.byte	0x8
	.uleb128 0x15
	.string	"r13"
	.byte	0xc
	.byte	0x2e
	.long	0x1f2
	.byte	0x10
	.uleb128 0x15
	.string	"r12"
	.byte	0xc
	.byte	0x2f
	.long	0x1f2
	.byte	0x18
	.uleb128 0x15
	.string	"rbp"
	.byte	0xc
	.byte	0x30
	.long	0x1f2
	.byte	0x20
	.uleb128 0x15
	.string	"rbx"
	.byte	0xc
	.byte	0x31
	.long	0x1f2
	.byte	0x28
	.uleb128 0x15
	.string	"r11"
	.byte	0xc
	.byte	0x32
	.long	0x1f2
	.byte	0x30
	.uleb128 0x15
	.string	"r10"
	.byte	0xc
	.byte	0x33
	.long	0x1f2
	.byte	0x38
	.uleb128 0x15
	.string	"r9"
	.byte	0xc
	.byte	0x34
	.long	0x1f2
	.byte	0x40
	.uleb128 0x15
	.string	"r8"
	.byte	0xc
	.byte	0x35
	.long	0x1f2
	.byte	0x48
	.uleb128 0x15
	.string	"rax"
	.byte	0xc
	.byte	0x36
	.long	0x1f2
	.byte	0x50
	.uleb128 0x15
	.string	"rcx"
	.byte	0xc
	.byte	0x37
	.long	0x1f2
	.byte	0x58
	.uleb128 0x15
	.string	"rdx"
	.byte	0xc
	.byte	0x38
	.long	0x1f2
	.byte	0x60
	.uleb128 0x15
	.string	"rsi"
	.byte	0xc
	.byte	0x39
	.long	0x1f2
	.byte	0x68
	.uleb128 0x15
	.string	"rdi"
	.byte	0xc
	.byte	0x3a
	.long	0x1f2
	.byte	0x70
	.uleb128 0x10
	.long	.LASF103
	.byte	0xc
	.byte	0x3b
	.long	0x1f2
	.byte	0x78
	.uleb128 0x15
	.string	"rip"
	.byte	0xc
	.byte	0x3c
	.long	0x1f2
	.byte	0x80
	.uleb128 0x15
	.string	"cs"
	.byte	0xc
	.byte	0x3d
	.long	0x1f2
	.byte	0x88
	.uleb128 0x10
	.long	.LASF104
	.byte	0xc
	.byte	0x3e
	.long	0x1f2
	.byte	0x90
	.uleb128 0x15
	.string	"rsp"
	.byte	0xc
	.byte	0x3f
	.long	0x1f2
	.byte	0x98
	.uleb128 0x15
	.string	"ss"
	.byte	0xc
	.byte	0x40
	.long	0x1f2
	.byte	0xa0
	.uleb128 0x10
	.long	.LASF105
	.byte	0xc
	.byte	0x41
	.long	0x1f2
	.byte	0xa8
	.uleb128 0x10
	.long	.LASF106
	.byte	0xc
	.byte	0x42
	.long	0x1f2
	.byte	0xb0
	.uleb128 0x15
	.string	"ds"
	.byte	0xc
	.byte	0x43
	.long	0x1f2
	.byte	0xb8
	.uleb128 0x15
	.string	"es"
	.byte	0xc
	.byte	0x44
	.long	0x1f2
	.byte	0xc0
	.uleb128 0x15
	.string	"fs"
	.byte	0xc
	.byte	0x45
	.long	0x1f2
	.byte	0xc8
	.uleb128 0x15
	.string	"gs"
	.byte	0xc
	.byte	0x46
	.long	0x1f2
	.byte	0xd0
	.byte	0
	.uleb128 0x16
	.long	.LASF107
	.byte	0x2
	.byte	0xd
	.long	0x19d
	.uleb128 0x9
	.byte	0x3
	.quad	tracee_pid
	.uleb128 0x16
	.long	.LASF108
	.byte	0x2
	.byte	0xe
	.long	0x491
	.uleb128 0x9
	.byte	0x3
	.quad	regs
	.uleb128 0x16
	.long	.LASF109
	.byte	0x2
	.byte	0xf
	.long	0x57
	.uleb128 0x9
	.byte	0x3
	.quad	status
	.uleb128 0x16
	.long	.LASF110
	.byte	0x2
	.byte	0x10
	.long	0x62e
	.uleb128 0x9
	.byte	0x3
	.quad	keep_looping
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF111
	.uleb128 0x17
	.long	.LASF114
	.byte	0x2
	.byte	0x12
	.long	0x57
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x673
	.uleb128 0x18
	.long	.LASF112
	.byte	0x2
	.byte	0x12
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.long	.LASF113
	.byte	0x2
	.byte	0x12
	.long	0x205
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x17
	.long	.LASF115
	.byte	0x1
	.byte	0x51
	.long	0x62e
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x6bf
	.uleb128 0x18
	.long	.LASF107
	.byte	0x1
	.byte	0x51
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.long	.LASF108
	.byte	0x1
	.byte	0x51
	.long	0x491
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.long	.LASF118
	.byte	0x1
	.byte	0x53
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1a
	.long	.LASF116
	.byte	0x1
	.byte	0x33
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x6eb
	.uleb128 0x18
	.long	.LASF108
	.byte	0x1
	.byte	0x33
	.long	0x491
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x1a
	.long	.LASF117
	.byte	0x1
	.byte	0x28
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x733
	.uleb128 0x18
	.long	.LASF107
	.byte	0x1
	.byte	0x28
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x19
	.long	.LASF119
	.byte	0x1
	.byte	0x29
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.long	.LASF120
	.byte	0x1
	.byte	0x2a
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1a
	.long	.LASF121
	.byte	0x1
	.byte	0x1e
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x78a
	.uleb128 0x18
	.long	.LASF107
	.byte	0x1
	.byte	0x1e
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x18
	.long	.LASF119
	.byte	0x1
	.byte	0x1e
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.long	.LASF120
	.byte	0x1
	.byte	0x1e
	.long	0x1eb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x19
	.long	.LASF122
	.byte	0x1
	.byte	0x1f
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1a
	.long	.LASF123
	.byte	0x1
	.byte	0x17
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x7c4
	.uleb128 0x18
	.long	.LASF107
	.byte	0x1
	.byte	0x17
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.long	.LASF124
	.byte	0x1
	.byte	0x18
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1b
	.long	.LASF132
	.byte	0x1
	.byte	0xd
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF107
	.byte	0x1
	.byte	0xd
	.long	0x19d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x18
	.long	.LASF119
	.byte	0x1
	.byte	0xd
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.long	.LASF125
	.byte	0x1
	.byte	0xf
	.long	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"__off_t"
.LASF25:
	.string	"PTRACE_ATTACH"
.LASF61:
	.string	"_IO_read_ptr"
.LASF73:
	.string	"_chain"
.LASF52:
	.string	"size_t"
.LASF79:
	.string	"_shortbuf"
.LASF123:
	.string	"print_peek_data_interactively"
.LASF48:
	.string	"PTRACE_SECCOMP_GET_FILTER"
.LASF96:
	.string	"_IO_2_1_stderr_"
.LASF67:
	.string	"_IO_buf_base"
.LASF45:
	.string	"PTRACE_PEEKSIGINFO"
.LASF54:
	.string	"long long unsigned int"
.LASF11:
	.string	"PTRACE_TRACEME"
.LASF39:
	.string	"PTRACE_SETSIGINFO"
.LASF20:
	.string	"PTRACE_SINGLESTEP"
.LASF116:
	.string	"print_user_regs_struct"
.LASF21:
	.string	"PTRACE_GETREGS"
.LASF53:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF74:
	.string	"_fileno"
.LASF62:
	.string	"_IO_read_end"
.LASF51:
	.string	"sys_siglist"
.LASF6:
	.string	"long int"
.LASF37:
	.string	"PTRACE_GETEVENTMSG"
.LASF60:
	.string	"_flags"
.LASF68:
	.string	"_IO_buf_end"
.LASF77:
	.string	"_cur_column"
.LASF110:
	.string	"keep_looping"
.LASF24:
	.string	"PTRACE_SETFPREGS"
.LASF81:
	.string	"_offset"
.LASF122:
	.string	"ptrace_output"
.LASF106:
	.string	"gs_base"
.LASF29:
	.string	"PTRACE_SYSCALL"
.LASF44:
	.string	"PTRACE_LISTEN"
.LASF118:
	.string	"input_char"
.LASF91:
	.string	"_next"
.LASF125:
	.string	"peek_output"
.LASF90:
	.string	"_IO_marker"
.LASF97:
	.string	"stdin"
.LASF2:
	.string	"unsigned int"
.LASF28:
	.string	"PTRACE_SETFPXREGS"
.LASF3:
	.string	"long unsigned int"
.LASF38:
	.string	"PTRACE_GETSIGINFO"
.LASF131:
	.string	"_IO_FILE_plus"
.LASF65:
	.string	"_IO_write_ptr"
.LASF100:
	.string	"sys_nerr"
.LASF92:
	.string	"_sbuf"
.LASF1:
	.string	"short unsigned int"
.LASF117:
	.string	"poke_data_interactively"
.LASF69:
	.string	"_IO_save_base"
.LASF41:
	.string	"PTRACE_SETREGSET"
.LASF80:
	.string	"_lock"
.LASF32:
	.string	"PTRACE_ARCH_PRCTL"
.LASF75:
	.string	"_flags2"
.LASF34:
	.string	"PTRACE_SYSEMU_SINGLESTEP"
.LASF23:
	.string	"PTRACE_GETFPREGS"
.LASF98:
	.string	"stdout"
.LASF94:
	.string	"_IO_2_1_stdin_"
.LASF128:
	.string	"/home/rdcpp/Desktop/OS/OS/8th/process_hacking"
.LASF56:
	.string	"optarg"
.LASF30:
	.string	"PTRACE_GET_THREAD_AREA"
.LASF119:
	.string	"byte_offset"
.LASF57:
	.string	"optind"
.LASF120:
	.string	"word"
.LASF66:
	.string	"_IO_write_end"
.LASF104:
	.string	"eflags"
.LASF35:
	.string	"PTRACE_SINGLEBLOCK"
.LASF36:
	.string	"PTRACE_SETOPTIONS"
.LASF130:
	.string	"_IO_lock_t"
.LASF89:
	.string	"_IO_FILE"
.LASF55:
	.string	"__environ"
.LASF33:
	.string	"PTRACE_SYSEMU"
.LASF27:
	.string	"PTRACE_GETFPXREGS"
.LASF87:
	.string	"_mode"
.LASF93:
	.string	"_pos"
.LASF76:
	.string	"_old_offset"
.LASF101:
	.string	"sys_errlist"
.LASF72:
	.string	"_markers"
.LASF40:
	.string	"PTRACE_GETREGSET"
.LASF127:
	.string	"tracer.c"
.LASF111:
	.string	"_Bool"
.LASF0:
	.string	"unsigned char"
.LASF103:
	.string	"orig_rax"
.LASF9:
	.string	"__pid_t"
.LASF5:
	.string	"short int"
.LASF14:
	.string	"PTRACE_PEEKUSER"
.LASF95:
	.string	"_IO_2_1_stdout_"
.LASF17:
	.string	"PTRACE_POKEUSER"
.LASF124:
	.string	"input"
.LASF47:
	.string	"PTRACE_SETSIGMASK"
.LASF22:
	.string	"PTRACE_SETREGS"
.LASF59:
	.string	"optopt"
.LASF19:
	.string	"PTRACE_KILL"
.LASF42:
	.string	"PTRACE_SEIZE"
.LASF105:
	.string	"fs_base"
.LASF108:
	.string	"regs"
.LASF107:
	.string	"tracee_pid"
.LASF13:
	.string	"PTRACE_PEEKDATA"
.LASF10:
	.string	"char"
.LASF121:
	.string	"poke_data"
.LASF16:
	.string	"PTRACE_POKEDATA"
.LASF43:
	.string	"PTRACE_INTERRUPT"
.LASF58:
	.string	"opterr"
.LASF18:
	.string	"PTRACE_CONT"
.LASF8:
	.string	"__off64_t"
.LASF63:
	.string	"_IO_read_base"
.LASF71:
	.string	"_IO_save_end"
.LASF50:
	.string	"_sys_siglist"
.LASF12:
	.string	"PTRACE_PEEKTEXT"
.LASF82:
	.string	"__pad1"
.LASF83:
	.string	"__pad2"
.LASF84:
	.string	"__pad3"
.LASF85:
	.string	"__pad4"
.LASF86:
	.string	"__pad5"
.LASF15:
	.string	"PTRACE_POKETEXT"
.LASF88:
	.string	"_unused2"
.LASF99:
	.string	"stderr"
.LASF113:
	.string	"argv"
.LASF129:
	.string	"__ptrace_request"
.LASF109:
	.string	"status"
.LASF126:
	.string	"GNU C11 7.3.0 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF70:
	.string	"_IO_backup_base"
.LASF102:
	.string	"user_regs_struct"
.LASF78:
	.string	"_vtable_offset"
.LASF112:
	.string	"argc"
.LASF49:
	.string	"pid_t"
.LASF26:
	.string	"PTRACE_DETACH"
.LASF115:
	.string	"peekpoke_interactively"
.LASF46:
	.string	"PTRACE_GETSIGMASK"
.LASF114:
	.string	"main"
.LASF64:
	.string	"_IO_write_base"
.LASF132:
	.string	"print_peek_data"
.LASF31:
	.string	"PTRACE_SET_THREAD_AREA"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
