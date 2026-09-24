.section .text
.globl isblank

.type isblank, @function
isblank:
	# a0 = c
	# check ' ' (32) or '\t' (9)
	li t0, 32
	beq a0, t0, .Lyes
	li t0, 9
	bne a0, t0, .Lno
.Lyes:
	li a0, 1
	ret
.Lno:
	li a0, 0
	ret
