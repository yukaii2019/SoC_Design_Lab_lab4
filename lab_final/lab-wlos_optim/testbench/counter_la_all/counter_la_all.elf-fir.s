	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all" "fir.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB316:
	.file 1 "fir.c"
	.loc 1 19 57
	.cfi_startproc
	.loc 1 21 2
	.loc 1 21 37 is_stmt 0
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	li	a2,822083584
	sw	a5,16(a2)
	.loc 1 22 2 is_stmt 1
	.loc 1 22 37 is_stmt 0
	li	a4,64
	.loc 1 23 37
	lui	a0,%hi(.LANCHOR1)
.LBB2:
	.loc 1 28 16
	lw	a1,256(a5)
.LBE2:
	.loc 1 22 37
	sw	a4,32(a2)
	.loc 1 23 2 is_stmt 1
	.loc 1 23 37 is_stmt 0
	li	a3,838860800
	addi	a6,a0,%lo(.LANCHOR1)
.LBB3:
	.loc 1 28 16
	lw	a7,260(a5)
.LBE3:
	.loc 1 23 37
	sw	a6,16(a3)
	.loc 1 24 2 is_stmt 1
	.loc 1 24 37 is_stmt 0
	sw	a4,32(a3)
	.loc 1 26 2 is_stmt 1
.LVL0:
	.loc 1 27 2
.LBB4:
	.loc 1 27 6
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a6,264(a5)
	.loc 1 28 10
	li	a4,872415232
	sw	a1,64(a4)
	.loc 1 27 29 is_stmt 1
.LVL1:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a1,268(a5)
	.loc 1 28 10
	sw	a7,68(a4)
	.loc 1 27 29 is_stmt 1
.LVL2:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a7,272(a5)
	.loc 1 28 10
	sw	a6,72(a4)
	.loc 1 27 29 is_stmt 1
.LVL3:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a6,276(a5)
	.loc 1 28 10
	sw	a1,76(a4)
	.loc 1 27 29 is_stmt 1
.LVL4:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a1,280(a5)
	.loc 1 28 10
	sw	a7,80(a4)
	.loc 1 27 29 is_stmt 1
.LVL5:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a7,284(a5)
	.loc 1 28 10
	sw	a6,84(a4)
	.loc 1 27 29 is_stmt 1
.LVL6:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a6,288(a5)
	.loc 1 28 10
	sw	a1,88(a4)
	.loc 1 27 29 is_stmt 1
.LVL7:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 16 is_stmt 0
	lw	a1,292(a5)
	lw	a5,296(a5)
	.loc 1 28 10
	sw	a7,92(a4)
	.loc 1 27 29 is_stmt 1
.LVL8:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 10 is_stmt 0
	sw	a6,96(a4)
	.loc 1 27 29 is_stmt 1
.LVL9:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 10 is_stmt 0
	sw	a1,100(a4)
	.loc 1 27 29 is_stmt 1
.LVL10:
	.loc 1 27 20
	.loc 1 28 3
	.loc 1 28 10 is_stmt 0
	sw	a5,104(a4)
	.loc 1 27 29 is_stmt 1
.LVL11:
	.loc 1 27 20
.LBE4:
	.loc 1 31 2
	.loc 1 31 37 is_stmt 0
	li	a5,1
	sw	a5,0(a2)
	.loc 1 32 2 is_stmt 1
	.loc 1 32 37 is_stmt 0
	sw	a5,0(a3)
	.loc 1 34 2 is_stmt 1
	.loc 1 34 36 is_stmt 0
	li	a2,-1145372672
	li	a3,637534208
	sw	a2,12(a3)
	.loc 1 35 2 is_stmt 1
	.loc 1 35 37 is_stmt 0
	sw	a5,32(a4)
	.loc 1 36 2 is_stmt 1
	.loc 1 36 10 is_stmt 0
	li	a4,838860800
.L2:
	.loc 1 36 60 is_stmt 1 discriminator 1
	.loc 1 36 10 is_stmt 0 discriminator 1
	lw	a5,0(a4)
	.loc 1 36 46 discriminator 1
	andi	a5,a5,2
	.loc 1 36 60 discriminator 1
	beq	a5,zero,.L2
	.loc 1 37 2 is_stmt 1
	.loc 1 37 36 is_stmt 0
	li	a5,637534208
	li	a4,-1140916224
	sw	a4,12(a5)
	.loc 1 77 2 is_stmt 1
	.loc 1 78 1 is_stmt 0
	addi	a0,a0,%lo(.LANCHOR1)
	ret
	.cfi_endproc
.LFE316:
	.size	fir, .-fir
	.globl	outputsignal
	.globl	inputsignal
	.globl	taps
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	inputsignal, @object
	.size	inputsignal, 256
inputsignal:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	46
	.word	47
	.word	48
	.word	49
	.word	50
	.word	51
	.word	52
	.word	53
	.word	54
	.word	55
	.word	56
	.word	57
	.word	58
	.word	59
	.word	60
	.word	61
	.word	62
	.word	63
	.word	64
	.type	taps, @object
	.size	taps, 44
taps:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.text
.Letext0:
	.file 2 "fir.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x10f
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x7
	.4byte	.LASF14
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL3
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x8
	.4byte	.LASF15
	.byte	0x2
	.byte	0xf
	.byte	0x1b
	.4byte	0x37
	.byte	0x9
	.4byte	0x26
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x3
	.4byte	0x55
	.4byte	0x4e
	.byte	0x4
	.4byte	0x4e
	.byte	0xa
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF4
	.byte	0x2b
	.4byte	0x3e
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x3
	.4byte	0x55
	.4byte	0x7c
	.byte	0x4
	.4byte	0x4e
	.byte	0x3f
	.byte	0
	.byte	0x2
	.4byte	.LASF5
	.byte	0x31
	.4byte	0x6c
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x2
	.4byte	.LASF6
	.byte	0x36
	.4byte	0x6c
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF7
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0xb
	.string	"fir"
	.byte	0x1
	.byte	0x13
	.byte	0x33
	.4byte	0x108
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x108
	.byte	0x5
	.string	"p"
	.byte	0x1a
	.byte	0x15
	.4byte	0x10d
	.4byte	.LLST0
	.byte	0xc
	.4byte	.LLRL1
	.byte	0x5
	.string	"i"
	.byte	0x1b
	.byte	0xa
	.4byte	0x55
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	0x55
	.byte	0x6
	.4byte	0x32
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
	.byte	0xe
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x6
	.byte	0xc
	.4byte	0x34000044
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x6
	.byte	0xc
	.4byte	0x34000048
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x6
	.byte	0xc
	.4byte	0x3400004c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x6
	.byte	0xc
	.4byte	0x34000050
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x6
	.byte	0xc
	.4byte	0x34000054
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x6
	.byte	0xc
	.4byte	0x34000058
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x6
	.byte	0xc
	.4byte	0x3400005c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x6
	.byte	0xc
	.4byte	0x34000060
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x6
	.byte	0xc
	.4byte	0x34000064
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x6
	.byte	0xc
	.4byte	0x34000068
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LFE316
	.byte	0x6
	.byte	0xc
	.4byte	0x3400006c
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LFE316
	.byte	0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
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
.LLRL1:
	.byte	0x6
	.4byte	.LBB2
	.4byte	.LBE2
	.byte	0x6
	.4byte	.LBB3
	.4byte	.LBE3
	.byte	0x6
	.4byte	.LBB4
	.4byte	.LBE4
	.byte	0
.LLRL3:
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.string	"inputsignal"
.LASF11:
	.string	"unsigned char"
.LASF2:
	.string	"long unsigned int"
.LASF12:
	.string	"short unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF14:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O3 -ffreestanding"
.LASF13:
	.string	"long long unsigned int"
.LASF6:
	.string	"outputsignal"
.LASF10:
	.string	"long long int"
.LASF4:
	.string	"taps"
.LASF8:
	.string	"short int"
.LASF15:
	.string	"uint32_t"
.LASF9:
	.string	"long int"
.LASF7:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all"
.LASF0:
	.string	"fir.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
