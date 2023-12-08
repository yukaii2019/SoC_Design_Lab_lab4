	.file	"counter_la_all.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new2/lab-wlos_baseline2/testbench/counter_la_all" "counter_la_all.c"
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.align	2
	.type	csr_write_simple, @function
csr_write_simple:
.LFB23:
	.file 2 "../../firmware/hw/common.h"
	.loc 2 33 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 2 34 5
	lw	a5,-24(s0)
	.loc 2 34 32
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 2 35 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	csr_write_simple, .-csr_write_simple
	.align	2
	.type	user_irq_0_ev_enable_write, @function
user_irq_0_ev_enable_write:
.LFB209:
	.file 3 "../../firmware/csr.h"
	.loc 3 805 59
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 3 806 2
	li	a5,-268406784
	addi	a1,a5,-2028
	lw	a0,-20(s0)
	call	csr_write_simple
	.loc 3 807 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE209:
	.size	user_irq_0_ev_enable_write, .-user_irq_0_ev_enable_write
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 4 "../../firmware/stub.c"
	.loc 4 19 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 4 20 5
	lbu	a4,-17(s0)
	li	a5,10
	bne	a4,a5,.L8
	.loc 4 21 3
	li	a0,13
	call	putchar
.L8:
	.loc 4 22 11
	nop
.L7:
	.loc 4 22 13 discriminator 1
	li	a5,-268410880
	addi	a5,a5,-2044
	lw	a4,0(a5)
	.loc 4 22 60 discriminator 1
	li	a5,1
	beq	a4,a5,.L7
	.loc 4 23 3
	li	a5,-268410880
	addi	a5,a5,-2048
	.loc 4 23 50
	lbu	a4,-17(s0)
	sw	a4,0(a5)
	.loc 4 24 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 4 27 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 4 28 8
	j	.L10
.L11:
	.loc 4 29 14
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 4 29 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
.L10:
	.loc 4 28 9
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L11
	.loc 4 30 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.align	2
	.type	irq_getmask, @function
irq_getmask:
.LFB320:
	.file 5 "../../firmware/irq_vex.h"
	.loc 5 23 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 5 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	.loc 5 26 9
	lw	a5,-20(s0)
	.loc 5 27 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE320:
	.size	irq_getmask, .-irq_getmask
	.align	2
	.type	irq_setmask, @function
irq_setmask:
.LFB321:
	.loc 5 30 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 5 31 2
	lw	a5,-20(s0)
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
	.loc 5 32 1
 #NO_APP
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE321:
	.size	irq_setmask, .-irq_setmask
	.align	2
	.globl	sync
	.type	sync, @function
sync:
.LFB323:
	.file 6 "counter_la_all.c"
	.loc 6 40 12
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 6 41 7
	nop
.L16:
	.loc 6 41 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 41 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 41 57 discriminator 1
	beq	a5,zero,.L16
	.loc 6 42 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 42 36
	li	a4,256
	sw	a4,0(a5)
	.loc 6 43 7
	nop
.L17:
	.loc 6 43 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 43 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 43 57 discriminator 1
	bne	a5,zero,.L17
	.loc 6 44 1
	nop
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	sync, .-sync
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB324:
	.loc 6 47 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 6 75 7
	li	a5,-268419072
	addi	a5,a5,-2048
	.loc 6 75 54
	li	a4,1
	sw	a4,0(a5)
	.loc 6 77 10
	li	a5,637534208
	addi	a5,a5,160
	.loc 6 77 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 78 7
	li	a5,637534208
	addi	a5,a5,156
	.loc 6 78 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 79 7
	li	a5,637534208
	addi	a5,a5,152
	.loc 6 79 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 80 7
	li	a5,637534208
	addi	a5,a5,148
	.loc 6 80 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 81 7
	li	a5,637534208
	addi	a5,a5,144
	.loc 6 81 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 82 7
	li	a5,637534208
	addi	a5,a5,140
	.loc 6 82 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 83 7
	li	a5,637534208
	addi	a5,a5,136
	.loc 6 83 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 84 7
	li	a5,637534208
	addi	a5,a5,132
	.loc 6 84 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 85 7
	li	a5,637534208
	addi	a5,a5,128
	.loc 6 85 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 86 7
	li	a5,637534208
	addi	a5,a5,124
	.loc 6 86 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 87 7
	li	a5,637534208
	addi	a5,a5,120
	.loc 6 87 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 88 7
	li	a5,637534208
	addi	a5,a5,116
	.loc 6 88 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 89 7
	li	a5,637534208
	addi	a5,a5,112
	.loc 6 89 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 90 7
	li	a5,637534208
	addi	a5,a5,108
	.loc 6 90 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 91 7
	li	a5,637534208
	addi	a5,a5,104
	.loc 6 91 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 92 7
	li	a5,637534208
	addi	a5,a5,100
	.loc 6 92 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 94 7
	li	a5,637534208
	addi	a5,a5,96
	.loc 6 94 40
	li	a4,1027
	sw	a4,0(a5)
	.loc 6 95 7
	li	a5,637534208
	addi	a5,a5,92
	.loc 6 95 40
	li	a4,1027
	sw	a4,0(a5)
	.loc 6 96 7
	li	a5,637534208
	addi	a5,a5,88
	.loc 6 96 40
	li	a4,1027
	sw	a4,0(a5)
	.loc 6 97 7
	li	a5,637534208
	addi	a5,a5,84
	.loc 6 97 40
	li	a4,1027
	sw	a4,0(a5)
	.loc 6 98 7
	li	a5,637534208
	addi	a5,a5,80
	.loc 6 98 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 99 7
	li	a5,637534208
	addi	a5,a5,76
	.loc 6 99 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 100 7
	li	a5,637534208
	addi	a5,a5,72
	.loc 6 100 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 101 7
	li	a5,637534208
	addi	a5,a5,68
	.loc 6 101 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 102 7
	li	a5,637534208
	addi	a5,a5,64
	.loc 6 102 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 103 7
	li	a5,637534208
	addi	a5,a5,52
	.loc 6 103 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 104 7
	li	a5,637534208
	addi	a5,a5,48
	.loc 6 104 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 105 7
	li	a5,637534208
	addi	a5,a5,44
	.loc 6 105 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 106 7
	li	a5,637534208
	addi	a5,a5,40
	.loc 6 106 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 107 7
	li	a5,637534208
	addi	a5,a5,36
	.loc 6 107 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 6 109 7
	li	a5,637534208
	addi	a5,a5,60
	.loc 6 109 40
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 6 110 7
	li	a5,637534208
	addi	a5,a5,56
	.loc 6 110 40
	li	a4,1026
	sw	a4,0(a5)
	.loc 6 114 3
	li	a5,-268410880
	.loc 6 114 50
	li	a4,1
	sw	a4,0(a5)
	.loc 6 117 3
	li	a5,637534208
	.loc 6 117 36
	li	a4,1
	sw	a4,0(a5)
	.loc 6 118 8
	nop
.L19:
	.loc 6 118 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 6 118 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L19
	.loc 6 123 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 6 123 114
	li	a5,0
	sw	a5,0(a4)
	.loc 6 123 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 6 123 57
	sw	a5,0(a4)
	.loc 6 124 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 6 124 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 6 124 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 6 124 56
	sw	a5,0(a4)
	.loc 6 125 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 6 125 112
	li	a5,0
	sw	a5,0(a4)
	.loc 6 125 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 6 125 56
	sw	a5,0(a4)
	.loc 6 126 53
	li	a4,-268423168
	.loc 6 126 100
	li	a5,0
	sw	a5,0(a4)
	.loc 6 126 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 6 126 50
	sw	a5,0(a4)
	.loc 6 129 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 129 36
	li	a4,-1421869056
	sw	a4,0(a5)
	.loc 6 132 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 6 132 56
	sw	zero,0(a5)
	.loc 6 135 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 6 135 112
	li	a5,0
	sw	a5,0(a4)
	.loc 6 135 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 6 135 56
	sw	a5,0(a4)
	.loc 6 143 9
	call	irq_getmask
	mv	a5,a0
	.loc 6 143 7
	sw	a5,-20(s0)
	.loc 6 144 7
	lw	a5,-20(s0)
	ori	a5,a5,4
	sw	a5,-20(s0)
	.loc 6 145 2
	lw	a5,-20(s0)
	mv	a0,a5
	call	irq_setmask
	.loc 6 147 2
	li	a0,1
	call	user_irq_0_ev_enable_write
	.loc 6 162 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 162 36
	li	a4,-1420492800
	sw	a4,0(a5)
	.loc 6 163 7
	nop
.L20:
	.loc 6 163 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 163 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 163 57 discriminator 1
	beq	a5,zero,.L20
	.loc 6 164 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 164 36
	li	a4,256
	sw	a4,0(a5)
	.loc 6 165 7
	nop
.L21:
	.loc 6 165 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 165 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 165 57 discriminator 1
	bne	a5,zero,.L21
	.loc 6 168 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 168 36
	li	a4,-1422655488
	sw	a4,0(a5)
	.loc 6 169 7
	nop
.L22:
	.loc 6 169 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 169 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 169 57 discriminator 1
	beq	a5,zero,.L22
	.loc 6 170 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 170 36
	li	a4,256
	sw	a4,0(a5)
	.loc 6 171 7
	nop
.L23:
	.loc 6 171 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 171 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 171 57 discriminator 1
	bne	a5,zero,.L23
	.loc 6 174 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 174 36
	li	a4,-1424883712
	sw	a4,0(a5)
	.loc 6 175 7
	nop
.L24:
	.loc 6 175 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 175 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 175 57 discriminator 1
	beq	a5,zero,.L24
	.loc 6 176 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 176 36
	li	a4,256
	sw	a4,0(a5)
	.loc 6 177 7
	nop
.L25:
	.loc 6 177 10 discriminator 1
	li	a5,637534208
	addi	a5,a5,12
	lw	a4,0(a5)
	.loc 6 177 43 discriminator 1
	li	a5,4096
	and	a5,a4,a5
	.loc 6 177 57 discriminator 1
	bne	a5,zero,.L25
	.loc 6 181 13
	call	matmul
	sw	a0,-24(s0)
	.loc 6 184 38
	lw	a5,-24(s0)
	lw	a5,0(a5)
	.loc 6 184 43
	slli	a4,a5,16
	.loc 6 184 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 184 36
	sw	a4,0(a5)
	.loc 6 184 50
	call	sync
	.loc 6 185 43
	lw	a5,-24(s0)
	addi	a5,a5,4
	.loc 6 185 38
	lw	a5,0(a5)
	.loc 6 185 47
	slli	a4,a5,16
	.loc 6 185 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 185 36
	sw	a4,0(a5)
	.loc 6 185 54
	call	sync
	.loc 6 186 43
	lw	a5,-24(s0)
	addi	a5,a5,8
	.loc 6 186 38
	lw	a5,0(a5)
	.loc 6 186 47
	slli	a4,a5,16
	.loc 6 186 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 186 36
	sw	a4,0(a5)
	.loc 6 186 54
	call	sync
	.loc 6 187 43
	lw	a5,-24(s0)
	addi	a5,a5,12
	.loc 6 187 38
	lw	a5,0(a5)
	.loc 6 187 47
	slli	a4,a5,16
	.loc 6 187 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 187 36
	sw	a4,0(a5)
	.loc 6 187 54
	call	sync
	.loc 6 190 8
	call	fir
	sw	a0,-24(s0)
	.loc 6 191 38
	lw	a5,-24(s0)
	lw	a5,0(a5)
	.loc 6 191 43
	slli	a4,a5,16
	.loc 6 191 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 191 36
	sw	a4,0(a5)
	.loc 6 191 50
	call	sync
	.loc 6 192 43
	lw	a5,-24(s0)
	addi	a5,a5,4
	.loc 6 192 38
	lw	a5,0(a5)
	.loc 6 192 47
	slli	a4,a5,16
	.loc 6 192 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 192 36
	sw	a4,0(a5)
	.loc 6 192 54
	call	sync
	.loc 6 193 43
	lw	a5,-24(s0)
	addi	a5,a5,8
	.loc 6 193 38
	lw	a5,0(a5)
	.loc 6 193 47
	slli	a4,a5,16
	.loc 6 193 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 193 36
	sw	a4,0(a5)
	.loc 6 193 54
	call	sync
	.loc 6 194 43
	lw	a5,-24(s0)
	addi	a5,a5,12
	.loc 6 194 38
	lw	a5,0(a5)
	.loc 6 194 47
	slli	a4,a5,16
	.loc 6 194 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 194 36
	sw	a4,0(a5)
	.loc 6 194 54
	call	sync
	.loc 6 195 43
	lw	a5,-24(s0)
	addi	a5,a5,16
	.loc 6 195 38
	lw	a5,0(a5)
	.loc 6 195 47
	slli	a4,a5,16
	.loc 6 195 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 195 36
	sw	a4,0(a5)
	.loc 6 195 54
	call	sync
	.loc 6 196 43
	lw	a5,-24(s0)
	addi	a5,a5,20
	.loc 6 196 38
	lw	a5,0(a5)
	.loc 6 196 47
	slli	a4,a5,16
	.loc 6 196 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 196 36
	sw	a4,0(a5)
	.loc 6 196 54
	call	sync
	.loc 6 197 43
	lw	a5,-24(s0)
	addi	a5,a5,24
	.loc 6 197 38
	lw	a5,0(a5)
	.loc 6 197 47
	slli	a4,a5,16
	.loc 6 197 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 197 36
	sw	a4,0(a5)
	.loc 6 197 54
	call	sync
	.loc 6 198 43
	lw	a5,-24(s0)
	addi	a5,a5,28
	.loc 6 198 38
	lw	a5,0(a5)
	.loc 6 198 47
	slli	a4,a5,16
	.loc 6 198 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 198 36
	sw	a4,0(a5)
	.loc 6 198 54
	call	sync
	.loc 6 199 43
	lw	a5,-24(s0)
	addi	a5,a5,32
	.loc 6 199 38
	lw	a5,0(a5)
	.loc 6 199 47
	slli	a4,a5,16
	.loc 6 199 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 199 36
	sw	a4,0(a5)
	.loc 6 199 54
	call	sync
	.loc 6 200 43
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 6 200 38
	lw	a5,0(a5)
	.loc 6 200 47
	slli	a4,a5,16
	.loc 6 200 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 200 36
	sw	a4,0(a5)
	.loc 6 200 54
	call	sync
	.loc 6 201 43
	lw	a5,-24(s0)
	addi	a5,a5,40
	.loc 6 201 38
	lw	a5,0(a5)
	.loc 6 201 48
	slli	a4,a5,16
	.loc 6 201 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 201 36
	sw	a4,0(a5)
	.loc 6 201 55
	call	sync
	.loc 6 203 11
	call	qsort
	sw	a0,-24(s0)
	.loc 6 204 38
	lw	a5,-24(s0)
	lw	a5,0(a5)
	.loc 6 204 43
	slli	a4,a5,16
	.loc 6 204 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 204 36
	sw	a4,0(a5)
	.loc 6 204 50
	call	sync
	.loc 6 205 43
	lw	a5,-24(s0)
	addi	a5,a5,4
	.loc 6 205 38
	lw	a5,0(a5)
	.loc 6 205 47
	slli	a4,a5,16
	.loc 6 205 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 205 36
	sw	a4,0(a5)
	.loc 6 205 54
	call	sync
	.loc 6 206 43
	lw	a5,-24(s0)
	addi	a5,a5,8
	.loc 6 206 38
	lw	a5,0(a5)
	.loc 6 206 47
	slli	a4,a5,16
	.loc 6 206 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 206 36
	sw	a4,0(a5)
	.loc 6 206 54
	call	sync
	.loc 6 207 43
	lw	a5,-24(s0)
	addi	a5,a5,12
	.loc 6 207 38
	lw	a5,0(a5)
	.loc 6 207 47
	slli	a4,a5,16
	.loc 6 207 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 207 36
	sw	a4,0(a5)
	.loc 6 207 54
	call	sync
	.loc 6 211 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 6 211 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 6 212 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE324:
	.size	main, .-main
.Letext0:
	.file 7 "/home/ykhsieh/SoCDesignLab/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x217
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
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
	.4byte	.LASF23
	.byte	0x7
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
	.byte	0x4
	.4byte	.LASF11
	.byte	0x1c
	.4byte	0x88
	.4byte	0x88
	.byte	0x3
	.byte	0
	.byte	0x5
	.4byte	0x6a
	.byte	0xd
	.string	"fir"
	.byte	0x6
	.byte	0x1b
	.byte	0xd
	.4byte	0x88
	.4byte	0x9f
	.byte	0x3
	.byte	0
	.byte	0x4
	.4byte	.LASF12
	.byte	0x1a
	.4byte	0x88
	.4byte	0xaf
	.byte	0x3
	.byte	0
	.byte	0xe
	.4byte	.LASF24
	.byte	0x6
	.byte	0x2e
	.byte	0x6
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0xee
	.byte	0xf
	.string	"j"
	.byte	0x6
	.byte	0x30
	.byte	0x6
	.4byte	0x6a
	.byte	0x6
	.4byte	.LASF13
	.byte	0x6
	.byte	0x8a
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x10
	.string	"tmp"
	.byte	0x6
	.byte	0xb5
	.byte	0x7
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x11
	.4byte	.LASF25
	.byte	0x6
	.byte	0x28
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF17
	.byte	0x5
	.byte	0x1d
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.4byte	0x125
	.byte	0x12
	.4byte	.LASF13
	.byte	0x5
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x13
	.4byte	.LASF26
	.byte	0x5
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.4byte	.LFB320
	.4byte	.LFE320-.LFB320
	.byte	0x1
	.byte	0x9c
	.4byte	0x14f
	.byte	0x6
	.4byte	.LASF13
	.byte	0x5
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x8
	.4byte	.LASF15
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x171
	.byte	0x2
	.string	"p"
	.byte	0x4
	.byte	0x1a
	.byte	0x18
	.4byte	0x171
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x5
	.4byte	0x17d
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.byte	0x14
	.4byte	0x176
	.byte	0x8
	.4byte	.LASF16
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a4
	.byte	0x2
	.string	"c"
	.byte	0x4
	.byte	0x12
	.byte	0x13
	.4byte	0x176
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x15
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x325
	.byte	0x14
	.4byte	.LFB209
	.4byte	.LFE209-.LFB209
	.byte	0x1
	.byte	0x9c
	.4byte	0x1ca
	.byte	0x16
	.string	"v"
	.byte	0x3
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x7
	.4byte	.LASF19
	.byte	0x2
	.byte	0x20
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x1fa
	.byte	0x2
	.string	"v"
	.byte	0x2
	.byte	0x20
	.byte	0x33
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x2
	.string	"a"
	.byte	0x2
	.byte	0x20
	.byte	0x44
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.4byte	.LASF20
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF21
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x6
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
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x14
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
	.byte	0x8
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x25
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
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
	.byte	0x7c
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
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
	.byte	0x14
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	"flush_cpu_dcache"
.LASF19:
	.string	"csr_write_simple"
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
.LASF16:
	.string	"putchar"
.LASF22:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF24:
	.string	"main"
.LASF25:
	.string	"sync"
.LASF26:
	.string	"irq_getmask"
.LASF17:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF18:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF21:
	.string	"flush_cpu_icache"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"mask"
.LASF15:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF23:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF14:
	.string	"char"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"counter_la_all.c"
.LASF1:
	.string	"/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new2/lab-wlos_baseline2/testbench/counter_la_all"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
