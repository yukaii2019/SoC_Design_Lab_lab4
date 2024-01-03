	.file	"matmul.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all" "matmul.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB316:
	.file 1 "matmul.c"
	.loc 1 5 1
	.cfi_startproc
	.loc 1 26 2
	.loc 1 26 37 is_stmt 0
	lui	a5,%hi(.LANCHOR0)
	li	a4,889192448
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a5,16(a4)
	.loc 1 27 2 is_stmt 1
	.loc 1 28 37 is_stmt 0
	lui	a0,%hi(.LANCHOR1)
	.loc 1 27 37
	addi	a5,a5,64
	sw	a5,20(a4)
	.loc 1 28 2 is_stmt 1
	.loc 1 28 37 is_stmt 0
	addi	a5,a0,%lo(.LANCHOR1)
	sw	a5,24(a4)
	.loc 1 29 2 is_stmt 1
	.loc 1 29 37 is_stmt 0
	li	a5,4
	sw	a5,32(a4)
	.loc 1 31 2 is_stmt 1
	.loc 1 31 36 is_stmt 0
	li	a3,-1431699456
	li	a5,637534208
	sw	a3,12(a5)
	.loc 1 32 2 is_stmt 1
	.loc 1 32 37 is_stmt 0
	li	a5,1
	sw	a5,0(a4)
	.loc 1 34 2 is_stmt 1
.L2:
	.loc 1 34 60 discriminator 1
	.loc 1 34 10 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 1 34 46 discriminator 1
	andi	a5,a5,2
	.loc 1 34 60 discriminator 1
	beq	a5,zero,.L2
	.loc 1 35 2 is_stmt 1
	.loc 1 35 36 is_stmt 0
	li	a5,637534208
	li	a4,-1426128896
	sw	a4,12(a5)
	.loc 1 38 2 is_stmt 1
	.loc 1 39 1 is_stmt 0
	addi	a0,a0,%lo(.LANCHOR1)
	ret
	.cfi_endproc
.LFE316:
	.size	matmul, .-matmul
	.globl	result
	.globl	B
	.globl	A
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	A, @object
	.size	A, 64
A:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.type	B, @object
	.size	B, 64
B:
	.word	1
	.word	5
	.word	9
	.word	13
	.word	2
	.word	6
	.word	10
	.word	14
	.word	3
	.word	7
	.word	11
	.word	15
	.word	4
	.word	8
	.word	12
	.word	16
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.text
.Letext0:
	.file 2 "matmul.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xcf
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x3
	.4byte	.LASF12
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x4
	.4byte	.LASF13
	.byte	0x2
	.byte	0xb
	.byte	0x1b
	.4byte	0x32
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x5
	.4byte	0x50
	.4byte	0x49
	.byte	0x6
	.4byte	0x49
	.byte	0xf
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.string	"A"
	.byte	0x1e
	.4byte	0x39
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x2
	.string	"B"
	.byte	0x23
	.4byte	0x39
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2e
	.byte	0x5
	.4byte	0x39
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF5
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	0xcc
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.byte	0x4
	.4byte	0x50
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"matmul"
.LASF9:
	.string	"unsigned char"
.LASF2:
	.string	"long unsigned int"
.LASF10:
	.string	"short unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF12:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O3 -ffreestanding"
.LASF11:
	.string	"long long unsigned int"
.LASF4:
	.string	"result"
.LASF8:
	.string	"long long int"
.LASF6:
	.string	"short int"
.LASF13:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF5:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all"
.LASF0:
	.string	"matmul.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
