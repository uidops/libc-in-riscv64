.section .text
.globl ispunct

.type ispunct, @function
ispunct:
	# a0 = c
	# printable (0x21 '!' to 0x7e '~') and not alphanumeric
	addi t0, a0, -0x21
	sltiu t0, t0, 0x5e
	beqz t0, .Lno
	addi t0, a0, -0x30   # '0' to '9'
	sltiu t0, t0, 0x0a
	bnez t0, .Lno
	addi t0, a0, -0x41   # 'A' to 'Z'
	sltiu t0, t0, 0x1a
	bnez t0, .Lno
	addi t0, a0, -0x61   # 'a' to 'z'
	sltiu t0, t0, 0x1a
	bnez t0, .Lno
	li a0, 1
	ret
.Lno:
	li a0, 0
	ret
