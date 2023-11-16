	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab-caravel_fir/testbench/counter_la_fir" "fir.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB316:
	.file 1 "fir.c"
	.loc 1 4 61
	.cfi_startproc
	.loc 1 5 2
	.loc 1 5 37 is_stmt 0
	li	a5,805306368
	li	a4,64
	sw	a4,16(a5)
	.loc 1 6 2 is_stmt 1
.LVL0:
	.loc 1 7 2
.LBB7:
	.loc 1 7 6
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	lw	a3,0(a4)
	lw	a1,4(a4)
	lw	a2,8(a4)
	.loc 1 8 10
	sw	a3,64(a5)
	.loc 1 7 29 is_stmt 1
.LVL1:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a3,12(a4)
	.loc 1 8 10
	sw	a1,68(a5)
	.loc 1 7 29 is_stmt 1
.LVL2:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a1,16(a4)
	.loc 1 8 10
	sw	a2,72(a5)
	.loc 1 7 29 is_stmt 1
.LVL3:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a2,20(a4)
	.loc 1 8 10
	sw	a3,76(a5)
	.loc 1 7 29 is_stmt 1
.LVL4:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a3,24(a4)
	.loc 1 8 10
	sw	a1,80(a5)
	.loc 1 7 29 is_stmt 1
.LVL5:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a1,28(a4)
	.loc 1 8 10
	sw	a2,84(a5)
	.loc 1 7 29 is_stmt 1
.LVL6:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a2,32(a4)
	.loc 1 8 10
	sw	a3,88(a5)
	.loc 1 7 29 is_stmt 1
.LVL7:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a3,36(a4)
	lw	a4,40(a4)
	.loc 1 8 10
	sw	a1,92(a5)
	.loc 1 7 29 is_stmt 1
.LVL8:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 10 is_stmt 0
	sw	a2,96(a5)
	.loc 1 7 29 is_stmt 1
.LVL9:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 10 is_stmt 0
	sw	a3,100(a5)
	.loc 1 7 29 is_stmt 1
.LVL10:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 10 is_stmt 0
	sw	a4,104(a5)
	.loc 1 7 29 is_stmt 1
.LVL11:
	.loc 1 7 20
.LBE7:
	.loc 1 10 2
	.loc 1 10 36 is_stmt 0
	li	a3,10813440
	li	a4,637534208
	sw	a3,12(a4)
	.loc 1 11 2 is_stmt 1
	.loc 1 11 37 is_stmt 0
	li	a4,1
	sw	a4,0(a5)
	.loc 1 12 1
	ret
	.cfi_endproc
.LFE316:
	.size	initfir, .-initfir
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB317:
	.loc 1 14 56 is_stmt 1
	.cfi_startproc
	.loc 1 15 2
.LBB8:
.LBB9:
	.loc 1 5 2
	.loc 1 5 37 is_stmt 0
	li	a5,805306368
	li	a4,64
	sw	a4,16(a5)
	.loc 1 6 2 is_stmt 1
.LVL12:
	.loc 1 7 2
.LBB10:
	.loc 1 7 6
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	lw	a3,0(a4)
	lw	a1,4(a4)
	lw	a2,8(a4)
	.loc 1 8 10
	sw	a3,64(a5)
	.loc 1 7 29 is_stmt 1
.LVL13:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a3,12(a4)
	.loc 1 8 10
	sw	a1,68(a5)
	.loc 1 7 29 is_stmt 1
.LVL14:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a1,16(a4)
	.loc 1 8 10
	sw	a2,72(a5)
	.loc 1 7 29 is_stmt 1
.LVL15:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a2,20(a4)
	.loc 1 8 10
	sw	a3,76(a5)
	.loc 1 7 29 is_stmt 1
.LVL16:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a3,24(a4)
	.loc 1 8 10
	sw	a1,80(a5)
	.loc 1 7 29 is_stmt 1
.LVL17:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a1,28(a4)
	.loc 1 8 10
	sw	a2,84(a5)
	.loc 1 7 29 is_stmt 1
.LVL18:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a2,32(a4)
	.loc 1 8 10
	sw	a3,88(a5)
	.loc 1 7 29 is_stmt 1
.LVL19:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a3,36(a4)
	.loc 1 8 10
	sw	a1,92(a5)
	.loc 1 7 29 is_stmt 1
.LVL20:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 16 is_stmt 0
	lw	a4,40(a4)
	.loc 1 8 10
	sw	a2,96(a5)
	.loc 1 7 29 is_stmt 1
.LVL21:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 10 is_stmt 0
	sw	a3,100(a5)
	.loc 1 7 29 is_stmt 1
.LVL22:
	.loc 1 7 20
	.loc 1 8 3
	.loc 1 8 10 is_stmt 0
	sw	a4,104(a5)
	.loc 1 7 29 is_stmt 1
.LVL23:
	.loc 1 7 20
.LBE10:
	.loc 1 10 2
	.loc 1 10 36 is_stmt 0
	li	a3,10813440
	li	a4,637534208
	lui	a0,%hi(.LANCHOR1)
	sw	a3,12(a4)
	.loc 1 11 2 is_stmt 1
	.loc 1 11 37 is_stmt 0
	li	a4,1
	sw	a4,0(a5)
.LVL24:
.LBE9:
.LBE8:
	.loc 1 16 2 is_stmt 1
.LBB12:
	.loc 1 16 6
	.loc 1 16 19
.LBE12:
.LBB13:
.LBB11:
	.loc 1 11 37 is_stmt 0
	addi	a7,a0,%lo(.LANCHOR1)
	addi	a5,a0,%lo(.LANCHOR1)
	addi	a3,a0,%lo(.LANCHOR1)
.LBE11:
.LBE13:
.LBB14:
	.loc 1 16 10
	li	a4,0
	.loc 1 17 38
	li	a2,805306368
	.loc 1 16 19
	li	a6,64
.LVL25:
.L4:
	.loc 1 17 3 is_stmt 1 discriminator 3
	.loc 1 17 38 is_stmt 0 discriminator 3
	sw	a4,128(a2)
	.loc 1 18 3 is_stmt 1 discriminator 3
	.loc 1 18 21 is_stmt 0 discriminator 3
	lw	a1,132(a2)
	.loc 1 16 26 discriminator 3
	addi	a4,a4,1
.LVL26:
	.loc 1 16 19 discriminator 3
	addi	a3,a3,4
	.loc 1 18 19 discriminator 3
	sw	a1,-4(a3)
	.loc 1 16 26 is_stmt 1 discriminator 3
.LVL27:
	.loc 1 16 19 discriminator 3
	bne	a4,a6,.L4
.LBE14:
	.loc 1 21 3
	.loc 1 21 88 is_stmt 0
	lw	a4,252(a7)
.LVL28:
	.loc 1 21 50
	li	a3,5898240
	addi	a2,a5,256
.LVL29:
	.loc 1 21 88
	slli	a4,a4,24
	.loc 1 21 50
	add	a4,a4,a3
	.loc 1 21 37
	li	a3,637534208
	sw	a4,12(a3)
.LVL30:
	.loc 1 24 2 is_stmt 1
.LBB15:
	.loc 1 24 6
	.loc 1 24 19
.L5:
	.loc 1 25 6 discriminator 3
	.loc 1 25 58 is_stmt 0 discriminator 3
	lw	a4,0(a5)
	.loc 1 24 19 discriminator 3
	addi	a5,a5,4
	.loc 1 25 58 discriminator 3
	slli	a4,a4,16
	.loc 1 25 40 discriminator 3
	sw	a4,12(a3)
	.loc 1 24 26 is_stmt 1 discriminator 3
	.loc 1 24 19 discriminator 3
	bne	a5,a2,.L5
.LBE15:
	.loc 1 28 2
	.loc 1 29 1 is_stmt 0
	addi	a0,a0,%lo(.LANCHOR1)
	ret
	.cfi_endproc
.LFE317:
	.size	fir, .-fir
	.globl	outputsignal
	.globl	taps
	.data
	.align	2
	.set	.LANCHOR0,. + 0
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
	.file 3 "/home/ykhsieh/SoCDesignLab/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x197
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL7
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x4
	.4byte	0x3d
	.4byte	0x36
	.byte	0x5
	.4byte	0x36
	.byte	0xa
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.4byte	.LASF3
	.byte	0xd
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x4
	.4byte	0x3d
	.4byte	0x64
	.byte	0x5
	.4byte	0x36
	.byte	0x3f
	.byte	0
	.byte	0x6
	.4byte	.LASF4
	.byte	0xe
	.4byte	0x54
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
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
	.byte	0xb
	.4byte	.LASF14
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0xaf
	.byte	0xc
	.4byte	0x9e
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.byte	0xd
	.string	"fir"
	.byte	0x1
	.byte	0xe
	.byte	0x33
	.4byte	0x13e
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x13e
	.byte	0xe
	.4byte	.LLRL5
	.4byte	0xef
	.byte	0xf
	.string	"i"
	.byte	0x1
	.byte	0x10
	.byte	0xa
	.4byte	0x3d
	.4byte	.LLST6
	.byte	0
	.byte	0x10
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.4byte	0x106
	.byte	0x3
	.string	"i"
	.byte	0x18
	.byte	0xa
	.4byte	0x3d
	.byte	0
	.byte	0x11
	.4byte	0x143
	.4byte	.LBB8
	.4byte	.LLRL2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x12
	.4byte	.LLRL2
	.byte	0x2
	.4byte	0x150
	.4byte	.LLST3
	.byte	0x7
	.4byte	0x159
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x2
	.4byte	0x15a
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0x3d
	.byte	0x13
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.byte	0x1
	.4byte	0x165
	.byte	0x3
	.string	"p"
	.byte	0x6
	.byte	0x15
	.4byte	0x165
	.byte	0x14
	.byte	0x3
	.string	"i"
	.byte	0x7
	.byte	0xa
	.4byte	0x3d
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0xaa
	.byte	0x15
	.4byte	0x143
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.4byte	0x150
	.4byte	.LLST0
	.byte	0x7
	.4byte	0x159
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.byte	0x2
	.4byte	0x15a
	.4byte	.LLST1
	.byte	0
	.byte	0
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
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xc
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x34
	.byte	0
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x2e
	.byte	0x1
	.byte	0x31
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
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST6:
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL26
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL27
	.byte	0x3
	.byte	0x7c
	.byte	0x80,0x1
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL28
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL29
	.byte	0x7
	.byte	0x7c
	.byte	0x80,0x1
	.byte	0x6
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x9
	.byte	0xc
	.4byte	0x30000080
	.byte	0x6
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x6
	.byte	0xc
	.4byte	0x30000044
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x6
	.byte	0xc
	.4byte	0x30000048
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x6
	.byte	0xc
	.4byte	0x3000004c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x6
	.byte	0xc
	.4byte	0x30000050
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x6
	.byte	0xc
	.4byte	0x30000054
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL18
	.byte	0x6
	.byte	0xc
	.4byte	0x30000058
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x6
	.byte	0xc
	.4byte	0x3000005c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x6
	.byte	0xc
	.4byte	0x30000060
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x6
	.byte	0xc
	.4byte	0x30000064
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL22
	.byte	0x6
	.byte	0xc
	.4byte	0x30000068
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL24
	.byte	0x6
	.byte	0xc
	.4byte	0x3000006c
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL18
	.byte	0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL22
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL23
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL24
	.byte	0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x6
	.byte	0xc
	.4byte	0x30000044
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x6
	.byte	0xc
	.4byte	0x30000048
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x6
	.byte	0xc
	.4byte	0x3000004c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x6
	.byte	0xc
	.4byte	0x30000050
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x6
	.byte	0xc
	.4byte	0x30000054
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x6
	.byte	0xc
	.4byte	0x30000058
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x6
	.byte	0xc
	.4byte	0x3000005c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x6
	.byte	0xc
	.4byte	0x30000060
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x6
	.byte	0xc
	.4byte	0x30000064
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x6
	.byte	0xc
	.4byte	0x30000068
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LFE316
	.byte	0x6
	.byte	0xc
	.4byte	0x3000006c
	.byte	0x9f
	.byte	0
.LLST1:
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
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
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
.LLRL2:
	.byte	0x6
	.4byte	.LBB8
	.4byte	.LBE8
	.byte	0x6
	.4byte	.LBB13
	.4byte	.LBE13
	.byte	0
.LLRL5:
	.byte	0x6
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0x6
	.4byte	.LBB14
	.4byte	.LBE14
	.byte	0
.LLRL7:
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"initfir"
.LASF9:
	.string	"unsigned char"
.LASF11:
	.string	"long unsigned int"
.LASF10:
	.string	"short unsigned int"
.LASF2:
	.string	"unsigned int"
.LASF13:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O3 -ffreestanding"
.LASF12:
	.string	"long long unsigned int"
.LASF4:
	.string	"outputsignal"
.LASF8:
	.string	"long long int"
.LASF3:
	.string	"taps"
.LASF6:
	.string	"short int"
.LASF14:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF5:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"fir.c"
.LASF1:
	.string	"/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab-caravel_fir/testbench/counter_la_fir"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
