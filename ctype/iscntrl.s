.section .text
.globl iscntrl

.type iscntrl, @function
iscntrl:
	# a0 = c
	# check DEL (0x7f)
	li t0, 0x7f
	beq a0, t0, .Lyes
	# check control characters 0x00 to 0x1f,
	# unsigned compare: negative values fall through
	li t0, 0x20
	bltu a0, t0, .Lyes
.Lno:
	li a0, 0
	ret
.Lyes:
	li a0, 1
	ret
