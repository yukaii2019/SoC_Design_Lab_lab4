	.file	"qsort.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all" "qsort.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB316:
	.file 1 "qsort.c"
	.loc 1 4 75
	.cfi_startproc
.LVL0:
	.loc 1 5 2
	.loc 1 5 6 is_stmt 0
	lui	a5,%hi(.LANCHOR0)
	addi	a4,a5,%lo(.LANCHOR0)
	slli	a6,a1,2
	add	a5,a4,a6
	lw	a2,0(a5)
.LVL1:
	.loc 1 6 2 is_stmt 1
	.loc 1 7 2
	.loc 1 8 2
	.loc 1 8 15
	ble	a1,a0,.L2
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a5,a0,2
	add	a5,a4,a5
	.loc 1 9 5
	lw	a5,0(a5)
	.loc 1 8 20
	addi	a3,a0,1
	.loc 1 6 6
	sgt	a5,a2,a5
	xori	a5,a5,1
	sub	a5,a0,a5
.LVL2:
	.loc 1 8 20 is_stmt 1
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL3:
	add	a3,a4,a3
	lw	a7,0(a3)
	.loc 1 9 5
	bgt	a2,a7,.L18
.LVL4:
.L5:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,2
.LVL5:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL6:
	add	a3,a4,a3
	lw	a7,0(a3)
	.loc 1 9 5
	bgt	a2,a7,.L19
.LVL7:
.L6:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,3
.LVL8:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL9:
	add	a3,a4,a3
	lw	a7,0(a3)
	.loc 1 9 5
	bgt	a2,a7,.L20
.LVL10:
.L7:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,4
.LVL11:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL12:
	add	a3,a4,a3
	lw	a7,0(a3)
	.loc 1 9 5
	ble	a2,a7,.L8
	.loc 1 10 6
	addi	a5,a5,1
.LVL13:
	.loc 1 11 9
	slli	t1,a5,2
	add	t1,a4,t1
	lw	t3,0(t1)
	.loc 1 10 4 is_stmt 1
.LVL14:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a7,0(t1)
.LVL15:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
.LVL16:
.L8:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,5
.LVL17:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL18:
	add	a3,a4,a3
	lw	t1,0(a3)
	.loc 1 9 5
	ble	a2,t1,.L9
	.loc 1 10 6
	addi	a5,a5,1
.LVL19:
	.loc 1 11 9
	slli	a7,a5,2
	add	a7,a4,a7
	lw	t3,0(a7)
	.loc 1 10 4 is_stmt 1
.LVL20:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	t1,0(a7)
.LVL21:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
.LVL22:
.L9:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,6
.LVL23:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL24:
	add	a3,a4,a3
	lw	t1,0(a3)
	.loc 1 9 5
	ble	a2,t1,.L10
	.loc 1 10 6
	addi	a5,a5,1
.LVL25:
	.loc 1 11 9
	slli	a7,a5,2
	add	a7,a4,a7
	lw	t3,0(a7)
	.loc 1 10 4 is_stmt 1
.LVL26:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	t1,0(a7)
.LVL27:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
.LVL28:
.L10:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,7
.LVL29:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL30:
	add	a3,a4,a3
	lw	a7,0(a3)
	.loc 1 9 5
	bgt	a2,a7,.L21
.LVL31:
.L11:
	.loc 1 8 20 is_stmt 1
	addi	a3,a0,8
.LVL32:
	.loc 1 8 15
	ble	a1,a3,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a3,a3,2
.LVL33:
	add	a3,a4,a3
	lw	t1,0(a3)
	.loc 1 9 5
	bgt	a2,t1,.L22
.LVL34:
.L12:
	.loc 1 8 20 is_stmt 1
	addi	a0,a0,9
.LVL35:
	.loc 1 8 15
	ble	a1,a0,.L4
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a0,a0,2
.LVL36:
	add	a0,a4,a0
	lw	a1,0(a0)
.LVL37:
	.loc 1 9 5
	blt	a1,a2,.L23
.LVL38:
.L4:
	.loc 1 16 6
	add	a3,a4,a6
	lw	a2,0(a3)
	.loc 1 16 16
	addi	a0,a5,1
.LVL39:
.L2:
	.loc 1 16 2 is_stmt 1
	.loc 1 16 14 is_stmt 0
	slli	a5,a0,2
	add	a5,a4,a5
	lw	a3,0(a5)
	.loc 1 16 4
	ble	a3,a2,.L1
	.loc 1 17 3 is_stmt 1
.LVL40:
	.loc 1 18 3
	.loc 1 18 10 is_stmt 0
	sw	a2,0(a5)
	.loc 1 19 3 is_stmt 1
	.loc 1 19 9 is_stmt 0
	add	a5,a4,a6
	sw	a3,0(a5)
	.loc 1 21 2 is_stmt 1
.LVL41:
.L1:
	.loc 1 22 1 is_stmt 0
	ret
.LVL42:
.L18:
	.loc 1 10 6
	addi	a5,a5,1
.LVL43:
	.loc 1 11 9
	slli	t1,a5,2
	add	t1,a4,t1
	lw	t3,0(t1)
	.loc 1 10 4 is_stmt 1
.LVL44:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a7,0(t1)
.LVL45:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
	j	.L5
.LVL46:
.L19:
	.loc 1 10 6
	addi	a5,a5,1
.LVL47:
	.loc 1 11 9
	slli	t1,a5,2
	add	t1,a4,t1
	lw	t3,0(t1)
	.loc 1 10 4 is_stmt 1
.LVL48:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a7,0(t1)
.LVL49:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
	j	.L6
.LVL50:
.L20:
	.loc 1 10 6
	addi	a5,a5,1
.LVL51:
	.loc 1 11 9
	slli	t1,a5,2
	add	t1,a4,t1
	lw	t3,0(t1)
	.loc 1 10 4 is_stmt 1
.LVL52:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a7,0(t1)
.LVL53:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
	j	.L7
.LVL54:
.L21:
	.loc 1 10 6
	addi	a5,a5,1
.LVL55:
	.loc 1 11 9
	slli	t1,a5,2
	add	t1,a4,t1
	lw	t3,0(t1)
	.loc 1 10 4 is_stmt 1
.LVL56:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a7,0(t1)
.LVL57:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
	j	.L11
.LVL58:
.L22:
	.loc 1 10 6
	addi	a5,a5,1
.LVL59:
	.loc 1 11 9
	slli	a7,a5,2
	add	a7,a4,a7
	lw	t3,0(a7)
	.loc 1 10 4 is_stmt 1
.LVL60:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	t1,0(a7)
.LVL61:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	t3,0(a3)
	j	.L12
.LVL62:
.L23:
	.loc 1 10 6
	addi	a5,a5,1
.LVL63:
	.loc 1 11 9
	slli	a3,a5,2
	add	a3,a4,a3
	lw	a2,0(a3)
.LVL64:
	.loc 1 10 4 is_stmt 1
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a1,0(a3)
.LVL65:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a2,0(a0)
.LVL66:
	.loc 1 8 20 is_stmt 1
	.loc 1 8 15
	j	.L4
	.cfi_endproc
.LFE316:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB317:
	.loc 1 24 72
	.cfi_startproc
.LVL67:
	.loc 1 25 2
	.loc 1 25 4 is_stmt 0
	ble	a1,a0,.L44
	.loc 1 24 72
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lui	s1,%hi(.LANCHOR0)
	sw	s3,12(sp)
	addi	s1,s1,%lo(.LANCHOR0)
	.cfi_offset 19, -20
	slli	s3,a1,2
	sw	s2,16(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s2,a1
.LBB6:
.LBB7:
.LBB8:
	.loc 1 5 6
	add	s3,s1,s3
.LVL68:
.L25:
.LBE8:
.LBE7:
	.loc 1 26 3 is_stmt 1
.LBB13:
.LBB9:
	.loc 1 5 2
	.loc 1 5 6 is_stmt 0
	lw	a5,0(s3)
.LVL69:
	.loc 1 6 2 is_stmt 1
	.loc 1 6 6 is_stmt 0
	addi	s0,a0,-1
.LVL70:
	.loc 1 7 2 is_stmt 1
	.loc 1 8 2
	.loc 1 8 15
	ble	s2,a0,.L41
.L48:
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a0,2
	add	a4,s1,a4
	.loc 1 9 5
	lw	a4,0(a4)
	ble	a5,a4,.L27
	.loc 1 10 6
	mv	s0,a0
.LVL71:
.L27:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,1
.LVL72:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL73:
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L29
	.loc 1 10 6
	addi	s0,s0,1
.LVL74:
	.loc 1 11 9
	slli	a2,s0,2
	add	a2,s1,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL75:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL76:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL77:
.L29:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,2
.LVL78:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL79:
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L30
	.loc 1 10 6
	addi	s0,s0,1
.LVL80:
	.loc 1 11 9
	slli	a2,s0,2
	add	a2,s1,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL81:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL82:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL83:
.L30:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,3
.LVL84:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL85:
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L31
	.loc 1 10 6
	addi	s0,s0,1
.LVL86:
	.loc 1 11 9
	slli	a2,s0,2
	add	a2,s1,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL87:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL88:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL89:
.L31:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,4
.LVL90:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL91:
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L32
	.loc 1 10 6
	addi	s0,s0,1
.LVL92:
	.loc 1 11 9
	slli	a2,s0,2
	add	a2,s1,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL93:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL94:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL95:
.L32:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,5
.LVL96:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL97:
	add	a4,s1,a4
	lw	a2,0(a4)
	.loc 1 9 5
	ble	a5,a2,.L33
	.loc 1 10 6
	addi	s0,s0,1
.LVL98:
	.loc 1 11 9
	slli	a3,s0,2
	add	a3,s1,a3
	lw	a1,0(a3)
	.loc 1 10 4 is_stmt 1
.LVL99:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a2,0(a3)
.LVL100:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL101:
.L33:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,6
.LVL102:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL103:
	add	a4,s1,a4
	lw	a2,0(a4)
	.loc 1 9 5
	ble	a5,a2,.L34
	.loc 1 10 6
	addi	s0,s0,1
.LVL104:
	.loc 1 11 9
	slli	a3,s0,2
	add	a3,s1,a3
	lw	a1,0(a3)
	.loc 1 10 4 is_stmt 1
.LVL105:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a2,0(a3)
.LVL106:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL107:
.L34:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,7
.LVL108:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL109:
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L35
	.loc 1 10 6
	addi	s0,s0,1
.LVL110:
	.loc 1 11 9
	slli	a2,s0,2
	add	a2,s1,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL111:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL112:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL113:
.L35:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,8
.LVL114:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL115:
	add	a4,s1,a4
	lw	a2,0(a4)
	.loc 1 9 5
	ble	a5,a2,.L36
	.loc 1 10 6
	addi	s0,s0,1
.LVL116:
	.loc 1 11 9
	slli	a3,s0,2
	add	a3,s1,a3
	lw	a1,0(a3)
	.loc 1 10 4 is_stmt 1
.LVL117:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a2,0(a3)
.LVL118:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL119:
.L36:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,9
.LVL120:
	.loc 1 8 15
	ble	s2,a4,.L28
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL121:
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L28
	.loc 1 10 6
	addi	s0,s0,1
.LVL122:
	.loc 1 11 9
	slli	a5,s0,2
.LVL123:
	add	a5,s1,a5
	lw	a2,0(a5)
	.loc 1 10 4 is_stmt 1
.LVL124:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a5)
.LVL125:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a2,0(a4)
.LVL126:
	.loc 1 8 20 is_stmt 1
	.loc 1 8 15
.L28:
	.loc 1 16 6 is_stmt 0
	lw	a5,0(s3)
	.loc 1 16 16
	addi	a4,s0,1
.LVL127:
.L26:
	.loc 1 16 2 is_stmt 1
	.loc 1 16 14 is_stmt 0
	slli	a4,a4,2
	add	a4,s1,a4
	lw	a3,0(a4)
	.loc 1 16 4
	bge	a5,a3,.L38
	.loc 1 17 3 is_stmt 1
.LVL128:
	.loc 1 18 3
	.loc 1 18 10 is_stmt 0
	sw	a5,0(a4)
	.loc 1 19 3 is_stmt 1
.LBE9:
.LBE13:
	.loc 1 27 3 is_stmt 0
	mv	a1,s0
.LBB14:
.LBB10:
	.loc 1 19 9
	sw	a3,0(s3)
	.loc 1 21 2 is_stmt 1
.LVL129:
.LBE10:
.LBE14:
	.loc 1 27 3
	call	sort
.LVL130:
	.loc 1 28 3
	addi	a0,s0,2
.LBE6:
	.loc 1 25 2
	.loc 1 25 4 is_stmt 0
	bgt	s2,a0,.L25
.LVL131:
.L24:
	.loc 1 30 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
.LVL132:
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL133:
.L38:
	.cfi_restore_state
.LBB17:
.LBB15:
.LBB11:
	.loc 1 21 2 is_stmt 1
.LBE11:
.LBE15:
	.loc 1 27 3
	mv	a1,s0
	call	sort
.LVL134:
	.loc 1 28 3
	addi	a0,s0,2
.LBE17:
	.loc 1 25 2
	.loc 1 25 4 is_stmt 0
	bge	a0,s2,.L24
.LBB18:
	.loc 1 26 3 is_stmt 1
.LVL135:
.LBB16:
.LBB12:
	.loc 1 5 2
	.loc 1 5 6 is_stmt 0
	lw	a5,0(s3)
.LVL136:
	.loc 1 6 2 is_stmt 1
	.loc 1 6 6 is_stmt 0
	addi	s0,a0,-1
.LVL137:
	.loc 1 7 2 is_stmt 1
	.loc 1 8 2
	.loc 1 8 15
	bgt	s2,a0,.L48
.LVL138:
.L41:
	mv	a4,a0
	j	.L26
.LVL139:
.L44:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	ret
.LBE12:
.LBE16:
.LBE18:
	.cfi_endproc
.LFE317:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB318:
	.loc 1 32 58
	.cfi_startproc
	.loc 1 33 2
	.loc 1 32 58 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s3,12(sp)
	.cfi_offset 19, -20
.LBB24:
.LBB25:
.LBB26:
.LBB27:
.LBB28:
	.loc 1 5 6
	lui	s3,%hi(.LANCHOR0)
.LBE28:
.LBE27:
.LBE26:
.LBE25:
.LBE24:
	.loc 1 32 58
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	sw	s5,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	.cfi_offset 21, -28
.LBB49:
.LBB46:
.LBB41:
.LBB35:
.LBB29:
	.loc 1 5 6
	addi	s0,s3,%lo(.LANCHOR0)
.LBE29:
.LBE35:
.LBE41:
.LBE46:
.LBE49:
	.loc 1 33 36
	li	a4,637534208
	li	a3,-859045888
.LBB50:
.LBB47:
.LBB42:
.LBB36:
.LBB30:
	.loc 1 5 6
	lw	a5,36(s0)
	li	a0,0
.LBE30:
.LBE36:
.LBE42:
.LBE47:
.LBE50:
	.loc 1 33 36
	sw	a3,12(a4)
	.loc 1 34 2 is_stmt 1
.LVL140:
.LBB51:
.LBB48:
	.loc 1 25 2
.LBB43:
	.loc 1 26 3
.LBB37:
.LBB31:
	.loc 1 5 2
	.loc 1 6 2
	.loc 1 7 2
	.loc 1 8 2
	.loc 1 8 15
	.loc 1 6 6 is_stmt 0
	li	s1,-1
	.loc 1 8 15
	li	s4,9
.LBE31:
.LBE37:
.LBE43:
	.loc 1 25 4
	li	s2,8
.LVL141:
.L50:
.LBB44:
.LBB38:
.LBB32:
	.loc 1 9 3 is_stmt 1
	.loc 1 9 7 is_stmt 0
	slli	a4,a0,2
	add	a4,s0,a4
	.loc 1 9 5
	lw	a4,0(a4)
	bge	a4,a5,.L51
	mv	s1,a0
.LVL142:
.L51:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,1
.LVL143:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL144:
	add	a4,s0,a4
	lw	a3,0(a4)
	.loc 1 9 5
	bge	a3,a5,.L53
	.loc 1 10 6
	addi	s1,s1,1
.LVL145:
	.loc 1 11 9
	slli	a2,s1,2
	add	a2,s0,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL146:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL147:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL148:
.L53:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,2
.LVL149:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL150:
	add	a4,s0,a4
	lw	a3,0(a4)
	.loc 1 9 5
	bge	a3,a5,.L54
	.loc 1 10 6
	addi	s1,s1,1
.LVL151:
	.loc 1 11 9
	slli	a2,s1,2
	add	a2,s0,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL152:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL153:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL154:
.L54:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,3
.LVL155:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL156:
	add	a4,s0,a4
	lw	a3,0(a4)
	.loc 1 9 5
	bge	a3,a5,.L55
	.loc 1 10 6
	addi	s1,s1,1
.LVL157:
	.loc 1 11 9
	slli	a2,s1,2
	add	a2,s0,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL158:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL159:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL160:
.L55:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,4
.LVL161:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL162:
	add	a4,s0,a4
	lw	a3,0(a4)
	.loc 1 9 5
	bge	a3,a5,.L56
	.loc 1 10 6
	addi	s1,s1,1
.LVL163:
	.loc 1 11 9
	slli	a2,s1,2
	add	a2,s0,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL164:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL165:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL166:
.L56:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,5
.LVL167:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL168:
	add	a4,s0,a4
	lw	a2,0(a4)
	.loc 1 9 5
	bge	a2,a5,.L57
	.loc 1 10 6
	addi	s1,s1,1
.LVL169:
	.loc 1 11 9
	slli	a3,s1,2
	add	a3,s0,a3
	lw	a1,0(a3)
	.loc 1 10 4 is_stmt 1
.LVL170:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a2,0(a3)
.LVL171:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL172:
.L57:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,6
.LVL173:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL174:
	add	a4,s0,a4
	lw	a2,0(a4)
	.loc 1 9 5
	ble	a5,a2,.L58
	.loc 1 10 6
	addi	s1,s1,1
.LVL175:
	.loc 1 11 9
	slli	a3,s1,2
	add	a3,s0,a3
	lw	a1,0(a3)
	.loc 1 10 4 is_stmt 1
.LVL176:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a2,0(a3)
.LVL177:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL178:
.L58:
	.loc 1 8 20 is_stmt 1
	addi	a4,a0,7
.LVL179:
	.loc 1 8 15
	beq	a4,s4,.L52
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	slli	a4,a4,2
.LVL180:
	add	a4,s0,a4
	lw	a3,0(a4)
	.loc 1 9 5
	ble	a5,a3,.L59
	.loc 1 10 6
	addi	s1,s1,1
.LVL181:
	.loc 1 11 9
	slli	a2,s1,2
	add	a2,s0,a2
	lw	a1,0(a2)
	.loc 1 10 4 is_stmt 1
.LVL182:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a3,0(a2)
.LVL183:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a1,0(a4)
.LVL184:
.L59:
	.loc 1 8 20 is_stmt 1
	.loc 1 8 15
	bne	a0,zero,.L52
.LVL185:
	.loc 1 9 3
	.loc 1 9 7 is_stmt 0
	lw	a4,32(s0)
	.loc 1 9 5
	bge	a4,a5,.L52
	.loc 1 10 6
	addi	s1,s1,1
.LVL186:
	.loc 1 11 9
	slli	a5,s1,2
.LVL187:
	add	a5,s0,a5
	lw	a3,0(a5)
	.loc 1 10 4 is_stmt 1
.LVL188:
	.loc 1 11 4
	.loc 1 12 4
	.loc 1 12 9 is_stmt 0
	sw	a4,0(a5)
.LVL189:
	.loc 1 13 4 is_stmt 1
	.loc 1 13 9 is_stmt 0
	sw	a3,32(s0)
.LVL190:
	.loc 1 8 20 is_stmt 1
	.loc 1 8 15
.L52:
	.loc 1 16 16 is_stmt 0
	addi	s5,s1,1
	.loc 1 16 14
	slli	a5,s5,2
	add	a5,s0,a5
	.loc 1 16 6
	lw	a3,36(s0)
	.loc 1 16 2 is_stmt 1
	.loc 1 16 14 is_stmt 0
	lw	a4,0(a5)
	.loc 1 16 4
	ble	a4,a3,.L61
	.loc 1 17 3 is_stmt 1
.LVL191:
	.loc 1 18 3
	.loc 1 18 10 is_stmt 0
	sw	a3,0(a5)
	.loc 1 19 3 is_stmt 1
.LBE32:
.LBE38:
	.loc 1 27 3 is_stmt 0
	mv	a1,s1
.LBB39:
.LBB33:
	.loc 1 19 9
	sw	a4,36(s0)
	.loc 1 21 2 is_stmt 1
.LVL192:
.LBE33:
.LBE39:
	.loc 1 27 3
	call	sort
.LVL193:
	.loc 1 28 3
	addi	a0,s1,2
.LBE44:
	.loc 1 25 2
	.loc 1 25 4 is_stmt 0
	bgt	a0,s2,.L63
.LVL194:
.L62:
.LBB45:
	.loc 1 26 3 is_stmt 1
.LBB40:
.LBB34:
	.loc 1 5 2
	.loc 1 5 6 is_stmt 0
	lw	a5,36(s0)
.LVL195:
	.loc 1 6 2 is_stmt 1
	.loc 1 6 6 is_stmt 0
	mv	s1,s5
.LVL196:
	.loc 1 7 2 is_stmt 1
	.loc 1 8 2
	.loc 1 8 15
	j	.L50
.LVL197:
.L61:
	.loc 1 21 2
.LBE34:
.LBE40:
	.loc 1 27 3
	mv	a1,s1
	call	sort
.LVL198:
	.loc 1 28 3
	addi	a0,s1,2
.LBE45:
	.loc 1 25 2
	.loc 1 25 4 is_stmt 0
	ble	a0,s2,.L62
.LVL199:
.L63:
.LBE48:
.LBE51:
	.loc 1 35 2 is_stmt 1
	.loc 1 37 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.loc 1 35 36
	li	a5,637534208
	li	a4,-855703552
	sw	a4,12(a5)
	.loc 1 36 2 is_stmt 1
	.loc 1 37 1 is_stmt 0
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	addi	a0,s3,%lo(.LANCHOR0)
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	qsort, .-qsort
	.globl	C
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	C, @object
	.size	C, 40
C:
	.word	893
	.word	40
	.word	3233
	.word	4267
	.word	2669
	.word	2541
	.word	9073
	.word	6023
	.word	5681
	.word	4622
	.text
.Letext0:
	.file 2 "qsort.h"
	.file 3 "/home/ykhsieh/SoCDesignLab/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2ca
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xd
	.4byte	.LASF13
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL29
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0xe
	.4byte	0x3d
	.4byte	0x36
	.byte	0xf
	.4byte	0x36
	.byte	0x9
	.byte	0
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x11
	.string	"C"
	.byte	0x2
	.byte	0x5
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.byte	0x12
	.4byte	.LASF14
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0x8a
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x13
	.4byte	.LASF15
	.byte	0x1
	.byte	0x20
	.byte	0x33
	.4byte	0x15d
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0x15d
	.byte	0x7
	.4byte	0x163
	.4byte	.LBB24
	.4byte	.LLRL17
	.byte	0x22
	.byte	0x2
	.byte	0x2
	.4byte	0x17b
	.4byte	.LLST18
	.byte	0x2
	.4byte	0x170
	.4byte	.LLST19
	.byte	0x8
	.4byte	0x185
	.4byte	.LLRL20
	.byte	0x1
	.4byte	0x186
	.4byte	.LLST21
	.byte	0x14
	.4byte	0x1b5
	.4byte	.LBB27
	.4byte	.LLRL22
	.byte	0x1
	.byte	0x1a
	.byte	0xb
	.4byte	0x136
	.byte	0x2
	.4byte	0x1d1
	.4byte	.LLST23
	.byte	0x2
	.4byte	0x1c6
	.4byte	.LLST24
	.byte	0x9
	.4byte	.LLRL22
	.byte	0x1
	.4byte	0x1db
	.4byte	.LLST25
	.byte	0x1
	.4byte	0x1e5
	.4byte	.LLST26
	.byte	0x1
	.4byte	0x1ee
	.4byte	.LLST27
	.byte	0x1
	.4byte	0x1f7
	.4byte	.LLST28
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LVL193
	.4byte	0x163
	.4byte	0x14a
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LVL198
	.4byte	0x163
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x4
	.4byte	0x3d
	.byte	0x16
	.4byte	.LASF16
	.byte	0x1
	.byte	0x18
	.byte	0x33
	.byte	0x1
	.4byte	0x1b5
	.byte	0x5
	.string	"low"
	.byte	0x18
	.byte	0x3c
	.4byte	0x3d
	.byte	0x5
	.string	"hi"
	.byte	0x18
	.byte	0x45
	.4byte	0x3d
	.byte	0x17
	.byte	0x6
	.string	"p"
	.byte	0x1a
	.byte	0x7
	.4byte	0x3d
	.byte	0xa
	.4byte	.LVL130
	.4byte	0x163
	.4byte	0x1a3
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LVL134
	.4byte	0x163
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4
	.byte	0x32
	.4byte	0x3d
	.byte	0x1
	.4byte	0x202
	.byte	0x5
	.string	"low"
	.byte	0x4
	.byte	0x40
	.4byte	0x3d
	.byte	0x5
	.string	"hi"
	.byte	0x4
	.byte	0x48
	.4byte	0x3d
	.byte	0xc
	.4byte	.LASF11
	.byte	0x5
	.4byte	0x3d
	.byte	0x6
	.string	"i"
	.byte	0x6
	.byte	0x6
	.4byte	0x3d
	.byte	0x6
	.string	"j"
	.byte	0x6
	.byte	0x10
	.4byte	0x3d
	.byte	0xc
	.4byte	.LASF12
	.byte	0x7
	.4byte	0x3d
	.byte	0
	.byte	0x19
	.4byte	0x1b5
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x24c
	.byte	0x2
	.4byte	0x1c6
	.4byte	.LLST0
	.byte	0x2
	.4byte	0x1d1
	.4byte	.LLST1
	.byte	0x1
	.4byte	0x1db
	.4byte	.LLST2
	.byte	0x1
	.4byte	0x1e5
	.4byte	.LLST3
	.byte	0x1
	.4byte	0x1ee
	.4byte	.LLST4
	.byte	0x1
	.4byte	0x1f7
	.4byte	.LLST5
	.byte	0
	.byte	0x1a
	.4byte	0x163
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.4byte	0x170
	.4byte	.LLST6
	.byte	0x2
	.4byte	0x17b
	.4byte	.LLST7
	.byte	0x8
	.4byte	0x185
	.4byte	.LLRL8
	.byte	0x1
	.4byte	0x186
	.4byte	.LLST9
	.byte	0x7
	.4byte	0x1b5
	.4byte	.LBB7
	.4byte	.LLRL10
	.byte	0x1a
	.byte	0xb
	.byte	0x2
	.4byte	0x1d1
	.4byte	.LLST11
	.byte	0x2
	.4byte	0x1c6
	.4byte	.LLST12
	.byte	0x9
	.4byte	.LLRL10
	.byte	0x1
	.4byte	0x1db
	.4byte	.LLST13
	.byte	0x1
	.4byte	0x1e5
	.4byte	.LLST14
	.byte	0x1
	.4byte	0x1ee
	.4byte	.LLST15
	.byte	0x1
	.4byte	0x1f7
	.4byte	.LLST16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x4
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
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
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
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
.LLST18:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL199
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL199
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST21:
	.byte	0x7
	.4byte	.LVL192
	.4byte	.LVL194
	.byte	0x1
	.byte	0x65
	.byte	0x7
	.4byte	.LVL197
	.4byte	.LVL199
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL192
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL194
	.4byte	.LVL197
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0
.LLST24:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL141
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL194
	.4byte	.LVL197
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST25:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL187
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL195
	.4byte	.LVL197
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST26:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL141
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL141
	.4byte	.LVL145
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL145
	.4byte	.LVL146
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL146
	.4byte	.LVL148
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL148
	.4byte	.LVL151
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL151
	.4byte	.LVL152
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL152
	.4byte	.LVL154
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL154
	.4byte	.LVL157
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL157
	.4byte	.LVL158
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL158
	.4byte	.LVL160
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL160
	.4byte	.LVL163
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL163
	.4byte	.LVL164
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL164
	.4byte	.LVL166
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL166
	.4byte	.LVL169
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL169
	.4byte	.LVL170
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL170
	.4byte	.LVL172
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL172
	.4byte	.LVL175
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL175
	.4byte	.LVL176
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL176
	.4byte	.LVL178
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL178
	.4byte	.LVL181
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL181
	.4byte	.LVL182
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL182
	.4byte	.LVL184
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL184
	.4byte	.LVL186
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL186
	.4byte	.LVL188
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL188
	.4byte	.LVL190
	.byte	0x3
	.byte	0x79
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL190
	.4byte	.LVL192
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL196
	.4byte	.LVL197
	.byte	0x1
	.byte	0x65
	.byte	0
.LLST27:
	.byte	0x7
	.4byte	.LVL140
	.4byte	.LVL141
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL141
	.4byte	.LVL143
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL143
	.4byte	.LVL144
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL144
	.4byte	.LVL149
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL149
	.4byte	.LVL150
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL150
	.4byte	.LVL155
	.byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL155
	.4byte	.LVL156
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL156
	.4byte	.LVL161
	.byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL161
	.4byte	.LVL162
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL162
	.4byte	.LVL167
	.byte	0x3
	.byte	0x7a
	.byte	0x4
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL167
	.4byte	.LVL168
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL168
	.4byte	.LVL173
	.byte	0x3
	.byte	0x7a
	.byte	0x5
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL173
	.4byte	.LVL174
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL174
	.4byte	.LVL179
	.byte	0x3
	.byte	0x7a
	.byte	0x6
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL179
	.4byte	.LVL180
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL180
	.4byte	.LVL184
	.byte	0x3
	.byte	0x7a
	.byte	0x7
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL184
	.4byte	.LVL185
	.byte	0xc
	.byte	0x38
	.byte	0x39
	.byte	0x7a
	.byte	0
	.byte	0x30
	.byte	0x29
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL185
	.4byte	.LVL190
	.byte	0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL196
	.4byte	.LVL197
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST28:
	.byte	0x7
	.4byte	.LVL146
	.4byte	.LVL147
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL152
	.4byte	.LVL153
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL158
	.4byte	.LVL159
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL164
	.4byte	.LVL165
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL170
	.4byte	.LVL171
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL176
	.4byte	.LVL177
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL182
	.4byte	.LVL183
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL188
	.4byte	.LVL189
	.byte	0xa
	.byte	0x79
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL191
	.4byte	.LVL192
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL35
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL36
	.byte	0x3
	.byte	0x7a
	.byte	0x77
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL42
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL62
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LFE316
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL37
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL42
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL62
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LFE316
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL38
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL64
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL13
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL16
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL19
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL22
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL25
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL26
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL28
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL39
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL43
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LVL44
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LVL46
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL47
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL47
	.4byte	.LVL48
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL48
	.4byte	.LVL50
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL50
	.4byte	.LVL51
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL51
	.4byte	.LVL52
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LVL54
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LVL55
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL55
	.4byte	.LVL56
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL56
	.4byte	.LVL58
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL58
	.4byte	.LVL59
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL59
	.4byte	.LVL60
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL60
	.4byte	.LVL62
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LVL63
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL63
	.4byte	.LVL64
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL64
	.4byte	.LVL66
	.byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL66
	.4byte	.LFE316
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL5
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL8
	.byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL11
	.byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL17
	.byte	0x3
	.byte	0x7a
	.byte	0x4
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL18
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL23
	.byte	0x3
	.byte	0x7a
	.byte	0x5
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL24
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL29
	.byte	0x3
	.byte	0x7a
	.byte	0x6
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL32
	.byte	0x3
	.byte	0x7a
	.byte	0x7
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL33
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL33
	.4byte	.LVL35
	.byte	0x3
	.byte	0x7a
	.byte	0x8
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL36
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL38
	.byte	0x6
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x9
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL46
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL50
	.byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL50
	.4byte	.LVL54
	.byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LVL58
	.byte	0x3
	.byte	0x7a
	.byte	0x7
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL58
	.4byte	.LVL62
	.byte	0x3
	.byte	0x7a
	.byte	0x8
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LVL66
	.byte	0x6
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x9
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL66
	.4byte	.LFE316
	.byte	0x6
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0xa
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL27
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL41
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LVL45
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL48
	.4byte	.LVL49
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LVL53
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL56
	.4byte	.LVL57
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL60
	.4byte	.LVL61
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL64
	.4byte	.LVL65
	.byte	0xa
	.byte	0x7f
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL67
	.4byte	.LVL68
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL68
	.4byte	.LVL139
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL139
	.4byte	.LFE317
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL67
	.4byte	.LVL68
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL68
	.4byte	.LVL132
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL132
	.4byte	.LVL133
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL133
	.4byte	.LVL139
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL139
	.4byte	.LFE317
	.byte	0x1
	.byte	0x5b
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL129
	.4byte	.LVL130-1
	.byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL130-1
	.4byte	.LVL131
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL133
	.4byte	.LVL137
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL137
	.4byte	.LVL138
	.byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL68
	.4byte	.LVL129
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL135
	.4byte	.LVL139
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL68
	.4byte	.LVL129
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL135
	.4byte	.LVL139
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL69
	.4byte	.LVL123
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL136
	.4byte	.LVL139
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL70
	.4byte	.LVL74
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL74
	.4byte	.LVL75
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL75
	.4byte	.LVL77
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL77
	.4byte	.LVL80
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL80
	.4byte	.LVL81
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL81
	.4byte	.LVL83
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL83
	.4byte	.LVL86
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL86
	.4byte	.LVL87
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL87
	.4byte	.LVL89
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL89
	.4byte	.LVL92
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL92
	.4byte	.LVL93
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL93
	.4byte	.LVL95
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL95
	.4byte	.LVL98
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL98
	.4byte	.LVL99
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL99
	.4byte	.LVL101
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL101
	.4byte	.LVL104
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL104
	.4byte	.LVL105
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL105
	.4byte	.LVL107
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL107
	.4byte	.LVL110
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL110
	.4byte	.LVL111
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL111
	.4byte	.LVL113
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL113
	.4byte	.LVL116
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL116
	.4byte	.LVL117
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL117
	.4byte	.LVL119
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL119
	.4byte	.LVL122
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL122
	.4byte	.LVL124
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL124
	.4byte	.LVL126
	.byte	0x3
	.byte	0x78
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL126
	.4byte	.LVL129
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL137
	.4byte	.LVL139
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL70
	.4byte	.LVL72
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL72
	.4byte	.LVL73
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL73
	.4byte	.LVL78
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL78
	.4byte	.LVL79
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL79
	.4byte	.LVL84
	.byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL84
	.4byte	.LVL85
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL85
	.4byte	.LVL90
	.byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL90
	.4byte	.LVL91
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL91
	.4byte	.LVL96
	.byte	0x3
	.byte	0x7a
	.byte	0x4
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL96
	.4byte	.LVL97
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL97
	.4byte	.LVL102
	.byte	0x3
	.byte	0x7a
	.byte	0x5
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL102
	.4byte	.LVL103
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL103
	.4byte	.LVL108
	.byte	0x3
	.byte	0x7a
	.byte	0x6
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL108
	.4byte	.LVL109
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL109
	.4byte	.LVL114
	.byte	0x3
	.byte	0x7a
	.byte	0x7
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL114
	.4byte	.LVL115
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL115
	.4byte	.LVL120
	.byte	0x3
	.byte	0x7a
	.byte	0x8
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL120
	.4byte	.LVL121
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL121
	.4byte	.LVL126
	.byte	0x3
	.byte	0x7a
	.byte	0x9
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL137
	.4byte	.LVL139
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL75
	.4byte	.LVL76
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL81
	.4byte	.LVL82
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL87
	.4byte	.LVL88
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL93
	.4byte	.LVL94
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL99
	.4byte	.LVL100
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL105
	.4byte	.LVL106
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL111
	.4byte	.LVL112
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL117
	.4byte	.LVL118
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL124
	.4byte	.LVL125
	.byte	0xa
	.byte	0x78
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL128
	.4byte	.LVL129
	.byte	0x1
	.byte	0x5d
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
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
.LLRL8:
	.byte	0x6
	.4byte	.LBB6
	.4byte	.LBE6
	.byte	0x6
	.4byte	.LBB17
	.4byte	.LBE17
	.byte	0x6
	.4byte	.LBB18
	.4byte	.LBE18
	.byte	0
.LLRL10:
	.byte	0x6
	.4byte	.LBB7
	.4byte	.LBE7
	.byte	0x6
	.4byte	.LBB13
	.4byte	.LBE13
	.byte	0x6
	.4byte	.LBB14
	.4byte	.LBE14
	.byte	0x6
	.4byte	.LBB15
	.4byte	.LBE15
	.byte	0x6
	.4byte	.LBB16
	.4byte	.LBE16
	.byte	0
.LLRL17:
	.byte	0x6
	.4byte	.LBB24
	.4byte	.LBE24
	.byte	0x6
	.4byte	.LBB49
	.4byte	.LBE49
	.byte	0x6
	.4byte	.LBB50
	.4byte	.LBE50
	.byte	0x6
	.4byte	.LBB51
	.4byte	.LBE51
	.byte	0
.LLRL20:
	.byte	0x6
	.4byte	.LBB26
	.4byte	.LBE26
	.byte	0x6
	.4byte	.LBB41
	.4byte	.LBE41
	.byte	0x6
	.4byte	.LBB42
	.4byte	.LBE42
	.byte	0x6
	.4byte	.LBB43
	.4byte	.LBE43
	.byte	0x6
	.4byte	.LBB44
	.4byte	.LBE44
	.byte	0x6
	.4byte	.LBB45
	.4byte	.LBE45
	.byte	0
.LLRL22:
	.byte	0x6
	.4byte	.LBB27
	.4byte	.LBE27
	.byte	0x6
	.4byte	.LBB35
	.4byte	.LBE35
	.byte	0x6
	.4byte	.LBB36
	.4byte	.LBE36
	.byte	0x6
	.4byte	.LBB37
	.4byte	.LBE37
	.byte	0x6
	.4byte	.LBB38
	.4byte	.LBE38
	.byte	0x6
	.4byte	.LBB39
	.4byte	.LBE39
	.byte	0x6
	.4byte	.LBB40
	.4byte	.LBE40
	.byte	0
.LLRL29:
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"sort"
.LASF15:
	.string	"qsort"
.LASF7:
	.string	"unsigned char"
.LASF9:
	.string	"long unsigned int"
.LASF12:
	.string	"temp"
.LASF8:
	.string	"short unsigned int"
.LASF17:
	.string	"partition"
.LASF2:
	.string	"unsigned int"
.LASF13:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O3 -ffreestanding"
.LASF10:
	.string	"long long unsigned int"
.LASF6:
	.string	"long long int"
.LASF4:
	.string	"short int"
.LASF14:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF11:
	.string	"pivot"
.LASF3:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ykhsieh/SoCDesignLab/caravel-soc_fpga-lab_new/lab_final/lab-wlos_optim/testbench/counter_la_all"
.LASF0:
	.string	"qsort.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
