	.file	"counter_la_all.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all" "counter_la_all.c"
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 1 "../../firmware/stub.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	.loc 1 20 2
	.loc 1 20 5 is_stmt 0
	li	a5,10
	beq	a0,a5,.L8
.L2:
	.loc 1 22 13 discriminator 1
	li	a4,-268410880
	.loc 1 22 60 discriminator 1
	li	a3,1
.L4:
	.loc 1 22 60 is_stmt 1 discriminator 1
	.loc 1 22 13 is_stmt 0 discriminator 1
	lw	a5,-2044(a4)
	.loc 1 22 60 discriminator 1
	beq	a5,a3,.L4
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	sw	a0,-2048(a4)
	.loc 1 24 1
	ret
.L8:
.LBB6:
.LBB7:
	.loc 1 22 13
	li	a4,-268410880
	.loc 1 22 60
	li	a3,1
.L3:
	.loc 1 22 60 is_stmt 1
	.loc 1 22 13 is_stmt 0
	lw	a5,-2044(a4)
	.loc 1 22 60
	beq	a5,a3,.L3
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	li	a5,13
	sw	a5,-2048(a4)
	.loc 1 24 1
	j	.L2
.LBE7:
.LBE6:
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 1 27 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 28 2
	.loc 1 28 9
	lbu	a2,0(a0)
	beq	a2,zero,.L9
.LBB12:
.LBB13:
	.loc 1 20 5 is_stmt 0
	li	a1,10
.LBB14:
.LBB15:
	.loc 1 22 13
	li	a4,-268410880
	.loc 1 22 60
	li	a3,1
	.loc 1 23 50
	li	a6,13
.L14:
.LBE15:
.LBE14:
.LBE13:
.LBE12:
	.loc 1 29 3 is_stmt 1
	.loc 1 29 14 is_stmt 0
	addi	a0,a0,1
.LVL2:
.LBB20:
.LBB18:
	.loc 1 20 2 is_stmt 1
	.loc 1 20 5 is_stmt 0
	beq	a2,a1,.L12
.L13:
	.loc 1 22 60 is_stmt 1
	.loc 1 22 13 is_stmt 0
	lw	a5,-2044(a4)
	.loc 1 22 60
	beq	a5,a3,.L13
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	sw	a2,-2048(a4)
.LVL3:
.LBE18:
.LBE20:
	.loc 1 28 9 is_stmt 1
	lbu	a2,0(a0)
	bne	a2,zero,.L14
.L9:
	.loc 1 30 1 is_stmt 0
	ret
.LVL4:
.L12:
.LBB21:
.LBB19:
.LBB17:
.LBB16:
	.loc 1 22 60 is_stmt 1
	.loc 1 22 13 is_stmt 0
	lw	a5,-2044(a4)
	.loc 1 22 60
	beq	a5,a3,.L12
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	sw	a6,-2048(a4)
	.loc 1 24 1
	j	.L13
.LBE16:
.LBE17:
.LBE19:
.LBE21:
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB318:
	.file 2 "counter_la_all.c"
	.loc 2 49 1 is_stmt 1
	.cfi_startproc
	.loc 2 50 2
	.loc 2 77 6
	.loc 2 49 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 2 77 54
	li	a1,1
	.loc 2 79 43
	li	a3,8192
	.loc 2 77 54
	li	a4,-268419072
	.loc 2 79 43
	li	a5,637534208
	.loc 2 77 54
	sw	a1,-2048(a4)
	.loc 2 79 9 is_stmt 1
	.loc 2 79 43 is_stmt 0
	addi	a4,a3,-2039
	sw	a4,160(a5)
	.loc 2 80 6 is_stmt 1
	.loc 2 80 40 is_stmt 0
	sw	a4,156(a5)
	.loc 2 81 6 is_stmt 1
	.loc 2 81 40 is_stmt 0
	sw	a4,152(a5)
	.loc 2 82 6 is_stmt 1
	.loc 2 82 40 is_stmt 0
	sw	a4,148(a5)
	.loc 2 83 6 is_stmt 1
	.loc 2 83 40 is_stmt 0
	sw	a4,144(a5)
	.loc 2 84 6 is_stmt 1
	.loc 2 84 40 is_stmt 0
	sw	a4,140(a5)
	.loc 2 85 6 is_stmt 1
	.loc 2 85 40 is_stmt 0
	sw	a4,136(a5)
	.loc 2 86 6 is_stmt 1
	.loc 2 86 40 is_stmt 0
	sw	a4,132(a5)
	.loc 2 87 6 is_stmt 1
	.loc 2 87 40 is_stmt 0
	sw	a4,128(a5)
	.loc 2 88 6 is_stmt 1
	.loc 2 88 40 is_stmt 0
	sw	a4,124(a5)
	.loc 2 89 6 is_stmt 1
	.loc 2 89 40 is_stmt 0
	sw	a4,120(a5)
	.loc 2 90 6 is_stmt 1
	.loc 2 90 40 is_stmt 0
	sw	a4,116(a5)
	.loc 2 91 6 is_stmt 1
	.loc 2 91 40 is_stmt 0
	sw	a4,112(a5)
	.loc 2 92 6 is_stmt 1
	.loc 2 92 40 is_stmt 0
	sw	a4,108(a5)
	.loc 2 93 6 is_stmt 1
	.loc 2 93 40 is_stmt 0
	sw	a4,104(a5)
	.loc 2 94 6 is_stmt 1
	.loc 2 94 40 is_stmt 0
	sw	a4,100(a5)
	.loc 2 96 6 is_stmt 1
	.loc 2 96 40 is_stmt 0
	li	a2,1027
	sw	a2,96(a5)
	.loc 2 97 6 is_stmt 1
	.loc 2 97 40 is_stmt 0
	sw	a2,92(a5)
	.loc 2 98 6 is_stmt 1
	.loc 2 98 40 is_stmt 0
	sw	a2,88(a5)
	.loc 2 99 6 is_stmt 1
	.loc 2 99 40 is_stmt 0
	sw	a2,84(a5)
	.loc 2 100 6 is_stmt 1
	.loc 2 100 40 is_stmt 0
	sw	a4,80(a5)
	.loc 2 101 6 is_stmt 1
	.loc 2 101 40 is_stmt 0
	sw	a4,76(a5)
	.loc 2 102 6 is_stmt 1
	.loc 2 102 40 is_stmt 0
	sw	a4,72(a5)
	.loc 2 103 6 is_stmt 1
	.loc 2 103 40 is_stmt 0
	sw	a4,68(a5)
	.loc 2 104 6 is_stmt 1
	.loc 2 104 40 is_stmt 0
	sw	a4,64(a5)
	.loc 2 105 6 is_stmt 1
	.loc 2 105 40 is_stmt 0
	sw	a4,52(a5)
	.loc 2 106 6 is_stmt 1
	.loc 2 106 40 is_stmt 0
	sw	a4,48(a5)
	.loc 2 107 6 is_stmt 1
	.loc 2 107 40 is_stmt 0
	sw	a4,44(a5)
	.loc 2 108 6 is_stmt 1
	.loc 2 108 40 is_stmt 0
	sw	a4,40(a5)
	.loc 2 109 6 is_stmt 1
	.loc 2 111 40 is_stmt 0
	addi	a3,a3,-2040
	.loc 2 109 40
	sw	a4,36(a5)
	.loc 2 111 6 is_stmt 1
	.loc 2 111 40 is_stmt 0
	sw	a3,60(a5)
	.loc 2 112 6 is_stmt 1
	.loc 2 112 40 is_stmt 0
	li	a4,1026
	sw	a4,56(a5)
	.loc 2 116 2 is_stmt 1
	.loc 2 116 50 is_stmt 0
	li	a4,-268410880
	sw	a1,0(a4)
	.loc 2 119 2 is_stmt 1
	.loc 2 119 36 is_stmt 0
	sw	a1,0(a5)
	.loc 2 120 2 is_stmt 1
	.loc 2 120 10 is_stmt 0
	li	s0,637534208
	.loc 2 120 43
	li	a4,1
.L22:
	.loc 2 120 43 is_stmt 1 discriminator 1
	.loc 2 120 10 is_stmt 0 discriminator 1
	lw	a5,0(s0)
	.loc 2 120 43 discriminator 1
	beq	a5,a4,.L22
	.loc 2 125 2 is_stmt 1
	.loc 2 125 114 is_stmt 0
	li	a5,-268423168
	sw	zero,12(a5)
	.loc 2 125 57
	sw	zero,28(a5)
	.loc 2 126 2 is_stmt 1
	.loc 2 126 112 is_stmt 0
	li	a4,-1
	sw	a4,8(a5)
	.loc 2 126 56
	sw	a4,24(a5)
	.loc 2 127 2 is_stmt 1
	.loc 2 127 112 is_stmt 0
	sw	zero,4(a5)
	.loc 2 127 56
	sw	zero,20(a5)
	.loc 2 128 2 is_stmt 1
	.loc 2 128 100 is_stmt 0
	sw	zero,0(a5)
	.loc 2 128 50
	sw	zero,16(a5)
	.loc 2 131 2 is_stmt 1
	.loc 2 131 36 is_stmt 0
	li	a4,-1421869056
	sw	a4,12(s0)
	.loc 2 134 2 is_stmt 1
	.loc 2 134 56 is_stmt 0
	sw	zero,56(a5)
	.loc 2 137 2 is_stmt 1
	.loc 2 137 112 is_stmt 0
	sw	zero,8(a5)
	.loc 2 137 56
	sw	zero,24(a5)
	.loc 2 165 1 is_stmt 1
	.loc 2 212 2
	.loc 2 212 8 is_stmt 0
	call	matmul
.LVL5:
	.loc 2 213 2 is_stmt 1
.LBB22:
	.loc 2 213 7
	.loc 2 213 20
	.loc 2 214 3
	.loc 2 214 48 is_stmt 0
	lw	a2,0(a0)
	lw	a3,4(a0)
	lw	a4,8(a0)
	lw	a5,12(a0)
	slli	a2,a2,16
	.loc 2 214 37
	sw	a2,12(s0)
	.loc 2 213 26 is_stmt 1
.LVL6:
	.loc 2 213 20
	.loc 2 214 3
	.loc 2 214 48 is_stmt 0
	slli	a3,a3,16
	.loc 2 214 37
	sw	a3,12(s0)
	.loc 2 213 26 is_stmt 1
.LVL7:
	.loc 2 213 20
	.loc 2 214 3
	.loc 2 214 48 is_stmt 0
	slli	a4,a4,16
	.loc 2 214 37
	sw	a4,12(s0)
	.loc 2 213 26 is_stmt 1
.LVL8:
	.loc 2 213 20
	.loc 2 214 3
	.loc 2 214 48 is_stmt 0
	slli	a5,a5,16
	.loc 2 214 37
	sw	a5,12(s0)
	.loc 2 213 26 is_stmt 1
.LVL9:
	.loc 2 213 20
.LBE22:
	.loc 2 219 2
	.loc 2 219 8 is_stmt 0
	call	fir
.LVL10:
	.loc 2 220 2 is_stmt 1
.LBB23:
	.loc 2 220 7
	.loc 2 220 20
	addi	a4,a0,256
	.loc 2 221 37 is_stmt 0
	li	s0,637534208
.LVL11:
.L23:
	.loc 2 221 3 is_stmt 1 discriminator 3
	.loc 2 221 48 is_stmt 0 discriminator 3
	lw	a5,0(a0)
	.loc 2 220 20 discriminator 3
	addi	a0,a0,4
	.loc 2 221 48 discriminator 3
	slli	a5,a5,16
	.loc 2 221 37 discriminator 3
	sw	a5,12(s0)
	.loc 2 220 27 is_stmt 1 discriminator 3
	.loc 2 220 20 discriminator 3
	bne	a0,a4,.L23
.LBE23:
	.loc 2 225 5
	.loc 2 225 11 is_stmt 0
	call	qsort
.LVL12:
	.loc 2 226 2 is_stmt 1
.LBB24:
	.loc 2 226 7
	.loc 2 226 20
	.loc 2 227 3
	.loc 2 227 48 is_stmt 0
	lw	a2,0(a0)
	lw	a3,4(a0)
	lw	a4,8(a0)
	lw	a5,12(a0)
	slli	a2,a2,16
	.loc 2 227 37
	sw	a2,12(s0)
	.loc 2 226 26 is_stmt 1
.LVL13:
	.loc 2 226 20
	.loc 2 227 3
	.loc 2 227 48 is_stmt 0
	slli	a3,a3,16
	.loc 2 227 37
	sw	a3,12(s0)
	.loc 2 226 26 is_stmt 1
.LVL14:
	.loc 2 226 20
	.loc 2 227 3
	.loc 2 227 48 is_stmt 0
	slli	a4,a4,16
	.loc 2 227 37
	sw	a4,12(s0)
	.loc 2 226 26 is_stmt 1
.LVL15:
	.loc 2 226 20
	.loc 2 227 3
	.loc 2 227 48 is_stmt 0
	slli	a5,a5,16
	.loc 2 227 37
	sw	a5,12(s0)
	.loc 2 226 26 is_stmt 1
.LVL16:
	.loc 2 226 20
.LBE24:
	.loc 2 232 2
	.loc 2 232 36 is_stmt 0
	li	a5,-1420754944
	.loc 2 237 1
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 2 232 36
	sw	a5,12(s0)
	.loc 2 237 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	main, .-main
	.text
.Letext0:
	.file 3 "/home/ykhsieh/SoCDesignLab/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1ef
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xa
	.4byte	.LASF15
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL8
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0xb
	.4byte	.LASF16
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x6
	.4byte	.LASF11
	.byte	0x1c
	.4byte	0x88
	.4byte	0x88
	.byte	0x3
	.byte	0
	.byte	0x7
	.4byte	0x6a
	.byte	0xd
	.string	"fir"
	.byte	0x2
	.byte	0x1b
	.byte	0xd
	.4byte	0x88
	.4byte	0x9f
	.byte	0x3
	.byte	0
	.byte	0x6
	.4byte	.LASF12
	.byte	0x1a
	.4byte	0x88
	.4byte	0xaf
	.byte	0x3
	.byte	0
	.byte	0xe
	.4byte	.LASF17
	.byte	0x2
	.byte	0x30
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0x14b
	.byte	0xf
	.string	"j"
	.byte	0x2
	.byte	0x32
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.string	"tmp"
	.byte	0xa5
	.byte	0x6
	.4byte	0x88
	.4byte	.LLST4
	.byte	0x4
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.4byte	0xf9
	.byte	0x2
	.string	"i"
	.byte	0xd5
	.byte	0xb
	.4byte	0x6a
	.4byte	.LLST5
	.byte	0
	.byte	0x4
	.4byte	.LBB23
	.4byte	.LBE23-.LBB23
	.4byte	0x114
	.byte	0x2
	.string	"i"
	.byte	0xdc
	.byte	0xb
	.4byte	0x6a
	.4byte	.LLST6
	.byte	0
	.byte	0x4
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.4byte	0x12f
	.byte	0x2
	.string	"i"
	.byte	0xe2
	.byte	0xb
	.4byte	0x6a
	.4byte	.LLST7
	.byte	0
	.byte	0x5
	.4byte	.LVL5
	.4byte	0x9f
	.byte	0x5
	.4byte	.LVL10
	.4byte	0x8d
	.byte	0x5
	.4byte	.LVL12
	.4byte	0x78
	.byte	0
	.byte	0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1a
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x19c
	.byte	0x11
	.string	"p"
	.byte	0x1
	.byte	0x1a
	.byte	0x18
	.4byte	0x19c
	.4byte	.LLST0
	.byte	0x8
	.4byte	0x1ad
	.4byte	.LBB12
	.4byte	.LLRL1
	.byte	0x1d
	.byte	0x12
	.4byte	0x1ba
	.4byte	.LLST2
	.byte	0x8
	.4byte	0x1ad
	.4byte	.LBB14
	.4byte	.LLRL3
	.byte	0x15
	.byte	0x9
	.4byte	0x1ba
	.byte	0
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x1a8
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0x13
	.4byte	0x1a1
	.byte	0x14
	.4byte	.LASF14
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.4byte	0x1c5
	.byte	0x15
	.string	"c"
	.byte	0x1
	.byte	0x12
	.byte	0x13
	.4byte	0x1a1
	.byte	0
	.byte	0x16
	.4byte	0x1ad
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.byte	0x17
	.4byte	0x1ba
	.byte	0x1
	.byte	0x5a
	.byte	0x18
	.4byte	0x1ad
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.byte	0x15
	.byte	0x3
	.byte	0x9
	.4byte	0x1ba
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
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
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
	.byte	0x3
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0x21
	.byte	0x3
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x27
	.byte	0x19
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
	.byte	0x11
	.byte	0x5
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
	.byte	0x12
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x5
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
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
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
.LLST4:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL10-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12-1
	.byte	0x4
	.byte	0x7e
	.byte	0x80,0x7e
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LFE318
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LFE318
	.byte	0x2
	.byte	0x34
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST7:
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
	.4byte	.LFE318
	.byte	0x2
	.byte	0x34
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LFE317
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LFE317
	.byte	0x1
	.byte	0x5c
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
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
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0x6
	.4byte	.LBB20
	.4byte	.LBE20
	.byte	0x6
	.4byte	.LBB21
	.4byte	.LBE21
	.byte	0
.LLRL3:
	.byte	0x6
	.4byte	.LBB14
	.4byte	.LBE14
	.byte	0x6
	.4byte	.LBB17
	.4byte	.LBE17
	.byte	0
.LLRL8:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF14:
	.string	"putchar"
.LASF17:
	.string	"main"
.LASF10:
	.string	"unsigned int"
.LASF15:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O3 -ffreestanding"
.LASF9:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"char"
.LASF18:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF16:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"counter_la_all.c"
.LASF1:
	.string	"/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
