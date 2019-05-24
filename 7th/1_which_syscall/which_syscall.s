	.file	"which_syscall.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"INPUT: %d\n"
.LC2:
	.string	"SYSCALL NO: %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.file 1 "which_syscall.c"
	.loc 1 11 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 11 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 16 0
	call	fork@PLT
	movl	%eax, -20(%rbp)
	.loc 1 17 0
	cmpl	$0, -20(%rbp)
	jne	.L2
	.loc 1 18 0
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 1 19 0
	movl	$19, %edi
	call	raise@PLT
	.loc 1 20 0
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 21 0
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L2:
	.loc 1 24 0
	leaq	-28(%rbp), %rax
	movq	%rax, %rdi
	call	wait@PLT
	.loc 1 25 0
	movl	-28(%rbp), %eax
	andl	$127, %eax
	.loc 1 25 0
	testl	%eax, %eax
	je	.L7
	.loc 1 27 0
	movl	-20(%rbp), %eax
	movl	$0, %ecx
	movl	$120, %edx
	movl	%eax, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -16(%rbp)
	.loc 1 28 0
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 29 0
	movl	-20(%rbp), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$24, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 1 24 0
	jmp	.L2
.L7:
	.loc 1 26 0
	nop
.L3:
	.loc 1 32 0
	movl	$0, %eax
	.loc 1 33 0
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 7 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 8 "/usr/include/signal.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 11 "/usr/include/x86_64-linux-gnu/sys/ptrace.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4e4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF106
	.byte	0xc
	.long	.LASF107
	.long	.LASF108
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x8c
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8d
	.long	0x69
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8e
	.long	0x62
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x99
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	0x99
	.uleb128 0x8
	.long	.LASF41
	.byte	0xd8
	.byte	0x4
	.byte	0xf5
	.long	0x225
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0xfb
	.long	0x93
	.byte	0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xfc
	.long	0x93
	.byte	0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xfd
	.long	0x93
	.byte	0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xfe
	.long	0x93
	.byte	0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0xff
	.long	0x93
	.byte	0x28
	.uleb128 0xa
	.long	.LASF18
	.byte	0x4
	.value	0x100
	.long	0x93
	.byte	0x30
	.uleb128 0xa
	.long	.LASF19
	.byte	0x4
	.value	0x101
	.long	0x93
	.byte	0x38
	.uleb128 0xa
	.long	.LASF20
	.byte	0x4
	.value	0x102
	.long	0x93
	.byte	0x40
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x104
	.long	0x93
	.byte	0x48
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x105
	.long	0x93
	.byte	0x50
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x106
	.long	0x93
	.byte	0x58
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x108
	.long	0x25d
	.byte	0x60
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x10a
	.long	0x263
	.byte	0x68
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x118
	.long	0x269
	.byte	0x83
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x11c
	.long	0x279
	.byte	0x88
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x12d
	.long	0x91
	.byte	0x98
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x12e
	.long	0x91
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x12f
	.long	0x91
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x130
	.long	0x91
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x133
	.long	0x62
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.value	0x135
	.long	0x27f
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF109
	.byte	0x4
	.byte	0x9a
	.uleb128 0x8
	.long	.LASF42
	.byte	0x18
	.byte	0x4
	.byte	0xa0
	.long	0x25d
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0xa1
	.long	0x25d
	.byte	0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0xa2
	.long	0x263
	.byte	0x8
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22c
	.uleb128 0x6
	.byte	0x8
	.long	0xa5
	.uleb128 0xc
	.long	0x99
	.long	0x279
	.uleb128 0xd
	.long	0x38
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x225
	.uleb128 0xc
	.long	0x99
	.long	0x28f
	.uleb128 0xd
	.long	0x38
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF110
	.uleb128 0xf
	.long	.LASF46
	.byte	0x4
	.value	0x13f
	.long	0x28f
	.uleb128 0xf
	.long	.LASF47
	.byte	0x4
	.value	0x140
	.long	0x28f
	.uleb128 0xf
	.long	.LASF48
	.byte	0x4
	.value	0x141
	.long	0x28f
	.uleb128 0x6
	.byte	0x8
	.long	0xa0
	.uleb128 0x7
	.long	0x2b8
	.uleb128 0x10
	.long	.LASF49
	.byte	0x5
	.byte	0x87
	.long	0x263
	.uleb128 0x10
	.long	.LASF50
	.byte	0x5
	.byte	0x88
	.long	0x263
	.uleb128 0x10
	.long	.LASF51
	.byte	0x5
	.byte	0x89
	.long	0x263
	.uleb128 0x10
	.long	.LASF52
	.byte	0x6
	.byte	0x1a
	.long	0x62
	.uleb128 0xc
	.long	0x2be
	.long	0x2fa
	.uleb128 0x11
	.byte	0
	.uleb128 0x7
	.long	0x2ef
	.uleb128 0x10
	.long	.LASF53
	.byte	0x6
	.byte	0x1b
	.long	0x2fa
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF54
	.uleb128 0x2
	.long	.LASF55
	.byte	0x7
	.byte	0x62
	.long	0x86
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF56
	.uleb128 0x12
	.long	.LASF111
	.byte	0x7
	.byte	0x4
	.long	0x4d
	.byte	0xb
	.byte	0x1d
	.long	0x426
	.uleb128 0x13
	.long	.LASF57
	.byte	0
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.uleb128 0x13
	.long	.LASF59
	.byte	0x2
	.uleb128 0x13
	.long	.LASF60
	.byte	0x3
	.uleb128 0x13
	.long	.LASF61
	.byte	0x4
	.uleb128 0x13
	.long	.LASF62
	.byte	0x5
	.uleb128 0x13
	.long	.LASF63
	.byte	0x6
	.uleb128 0x13
	.long	.LASF64
	.byte	0x7
	.uleb128 0x13
	.long	.LASF65
	.byte	0x8
	.uleb128 0x13
	.long	.LASF66
	.byte	0x9
	.uleb128 0x13
	.long	.LASF67
	.byte	0xc
	.uleb128 0x13
	.long	.LASF68
	.byte	0xd
	.uleb128 0x13
	.long	.LASF69
	.byte	0xe
	.uleb128 0x13
	.long	.LASF70
	.byte	0xf
	.uleb128 0x13
	.long	.LASF71
	.byte	0x10
	.uleb128 0x13
	.long	.LASF72
	.byte	0x11
	.uleb128 0x13
	.long	.LASF73
	.byte	0x12
	.uleb128 0x13
	.long	.LASF74
	.byte	0x13
	.uleb128 0x13
	.long	.LASF75
	.byte	0x18
	.uleb128 0x13
	.long	.LASF76
	.byte	0x19
	.uleb128 0x13
	.long	.LASF77
	.byte	0x1a
	.uleb128 0x13
	.long	.LASF78
	.byte	0x1e
	.uleb128 0x13
	.long	.LASF79
	.byte	0x1f
	.uleb128 0x13
	.long	.LASF80
	.byte	0x20
	.uleb128 0x13
	.long	.LASF81
	.byte	0x21
	.uleb128 0x14
	.long	.LASF82
	.value	0x4200
	.uleb128 0x14
	.long	.LASF83
	.value	0x4201
	.uleb128 0x14
	.long	.LASF84
	.value	0x4202
	.uleb128 0x14
	.long	.LASF85
	.value	0x4203
	.uleb128 0x14
	.long	.LASF86
	.value	0x4204
	.uleb128 0x14
	.long	.LASF87
	.value	0x4205
	.uleb128 0x14
	.long	.LASF88
	.value	0x4206
	.uleb128 0x14
	.long	.LASF89
	.value	0x4207
	.uleb128 0x14
	.long	.LASF90
	.value	0x4208
	.uleb128 0x14
	.long	.LASF91
	.value	0x4209
	.uleb128 0x14
	.long	.LASF92
	.value	0x420a
	.uleb128 0x14
	.long	.LASF93
	.value	0x420b
	.uleb128 0x14
	.long	.LASF94
	.value	0x420c
	.byte	0
	.uleb128 0xc
	.long	0x2be
	.long	0x436
	.uleb128 0xd
	.long	0x38
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0x426
	.uleb128 0xf
	.long	.LASF95
	.byte	0x8
	.value	0x11e
	.long	0x436
	.uleb128 0xf
	.long	.LASF96
	.byte	0x8
	.value	0x11f
	.long	0x436
	.uleb128 0xf
	.long	.LASF97
	.byte	0x9
	.value	0x222
	.long	0x45f
	.uleb128 0x6
	.byte	0x8
	.long	0x93
	.uleb128 0x10
	.long	.LASF98
	.byte	0xa
	.byte	0x24
	.long	0x93
	.uleb128 0x10
	.long	.LASF99
	.byte	0xa
	.byte	0x32
	.long	0x62
	.uleb128 0x10
	.long	.LASF100
	.byte	0xa
	.byte	0x37
	.long	0x62
	.uleb128 0x10
	.long	.LASF101
	.byte	0xa
	.byte	0x3b
	.long	0x62
	.uleb128 0x15
	.long	.LASF112
	.byte	0x1
	.byte	0xb
	.long	0x62
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.long	.LASF102
	.byte	0x1
	.byte	0xc
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF103
	.byte	0x1
	.byte	0xd
	.long	0x311
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.long	.LASF104
	.byte	0x1
	.byte	0xe
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.long	.LASF105
	.byte	0x1
	.byte	0xf
	.long	0x62
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0x18
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
.LASF99:
	.string	"optind"
.LASF64:
	.string	"PTRACE_CONT"
.LASF28:
	.string	"_old_offset"
.LASF30:
	.string	"_vtable_offset"
.LASF62:
	.string	"PTRACE_POKEDATA"
.LASF108:
	.string	"/home/rdcpp/Desktop/OS/OS/7th/1_which_syscall"
.LASF52:
	.string	"sys_nerr"
.LASF23:
	.string	"_IO_save_end"
.LASF2:
	.string	"short unsigned int"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF105:
	.string	"input"
.LASF33:
	.string	"_offset"
.LASF91:
	.string	"PTRACE_PEEKSIGINFO"
.LASF76:
	.string	"PTRACE_GET_THREAD_AREA"
.LASF111:
	.string	"__ptrace_request"
.LASF112:
	.string	"main"
.LASF19:
	.string	"_IO_buf_base"
.LASF97:
	.string	"__environ"
.LASF24:
	.string	"_markers"
.LASF96:
	.string	"sys_siglist"
.LASF65:
	.string	"PTRACE_KILL"
.LASF59:
	.string	"PTRACE_PEEKDATA"
.LASF106:
	.string	"GNU C11 7.3.0 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF70:
	.string	"PTRACE_SETFPREGS"
.LASF89:
	.string	"PTRACE_INTERRUPT"
.LASF51:
	.string	"stderr"
.LASF101:
	.string	"optopt"
.LASF54:
	.string	"long long int"
.LASF88:
	.string	"PTRACE_SEIZE"
.LASF32:
	.string	"_lock"
.LASF10:
	.string	"__pid_t"
.LASF6:
	.string	"long int"
.LASF87:
	.string	"PTRACE_SETREGSET"
.LASF69:
	.string	"PTRACE_GETFPREGS"
.LASF29:
	.string	"_cur_column"
.LASF75:
	.string	"PTRACE_SYSCALL"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF92:
	.string	"PTRACE_GETSIGMASK"
.LASF110:
	.string	"_IO_FILE_plus"
.LASF84:
	.string	"PTRACE_GETSIGINFO"
.LASF63:
	.string	"PTRACE_POKEUSER"
.LASF73:
	.string	"PTRACE_GETFPXREGS"
.LASF57:
	.string	"PTRACE_TRACEME"
.LASF44:
	.string	"_sbuf"
.LASF41:
	.string	"_IO_FILE"
.LASF1:
	.string	"unsigned char"
.LASF68:
	.string	"PTRACE_SETREGS"
.LASF78:
	.string	"PTRACE_ARCH_PRCTL"
.LASF58:
	.string	"PTRACE_PEEKTEXT"
.LASF98:
	.string	"optarg"
.LASF4:
	.string	"signed char"
.LASF56:
	.string	"long long unsigned int"
.LASF31:
	.string	"_shortbuf"
.LASF79:
	.string	"PTRACE_SYSEMU"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"_IO_marker"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF107:
	.string	"which_syscall.c"
.LASF14:
	.string	"_IO_read_end"
.LASF16:
	.string	"_IO_write_base"
.LASF40:
	.string	"_unused2"
.LASF13:
	.string	"_IO_read_ptr"
.LASF95:
	.string	"_sys_siglist"
.LASF20:
	.string	"_IO_buf_end"
.LASF82:
	.string	"PTRACE_SETOPTIONS"
.LASF104:
	.string	"status"
.LASF80:
	.string	"PTRACE_SYSEMU_SINGLESTEP"
.LASF11:
	.string	"char"
.LASF60:
	.string	"PTRACE_PEEKUSER"
.LASF71:
	.string	"PTRACE_ATTACH"
.LASF17:
	.string	"_IO_write_ptr"
.LASF43:
	.string	"_next"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF77:
	.string	"PTRACE_SET_THREAD_AREA"
.LASF66:
	.string	"PTRACE_SINGLESTEP"
.LASF93:
	.string	"PTRACE_SETSIGMASK"
.LASF85:
	.string	"PTRACE_SETSIGINFO"
.LASF0:
	.string	"long unsigned int"
.LASF74:
	.string	"PTRACE_SETFPXREGS"
.LASF18:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF55:
	.string	"pid_t"
.LASF83:
	.string	"PTRACE_GETEVENTMSG"
.LASF45:
	.string	"_pos"
.LASF103:
	.string	"child"
.LASF25:
	.string	"_chain"
.LASF8:
	.string	"__off_t"
.LASF90:
	.string	"PTRACE_LISTEN"
.LASF22:
	.string	"_IO_backup_base"
.LASF49:
	.string	"stdin"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF15:
	.string	"_IO_read_base"
.LASF72:
	.string	"PTRACE_DETACH"
.LASF94:
	.string	"PTRACE_SECCOMP_GET_FILTER"
.LASF102:
	.string	"orig_rax"
.LASF21:
	.string	"_IO_save_base"
.LASF53:
	.string	"sys_errlist"
.LASF61:
	.string	"PTRACE_POKETEXT"
.LASF100:
	.string	"opterr"
.LASF26:
	.string	"_fileno"
.LASF86:
	.string	"PTRACE_GETREGSET"
.LASF12:
	.string	"_flags"
.LASF81:
	.string	"PTRACE_SINGLEBLOCK"
.LASF50:
	.string	"stdout"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF109:
	.string	"_IO_lock_t"
.LASF67:
	.string	"PTRACE_GETREGS"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
