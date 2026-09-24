.section .text
.globl isxdigit

.type isxdigit, @function
isxdigit:
	# a0 = c
	addi t0, a0, -0x30
	sltiu t0, t0, 0x0a
	bnez t0, .Lyes       # '0' to '9'
	addi t0, a0, -0x61
	sltiu t0, t0, 0x06
	bnez t0, .Lyes       # 'a' to 'f'
	addi t0, a0, -0x41
	sltiu t0, t0, 0x06
	beqz t0, .Lno        # 'A' to 'F'
.Lyes:
	li a0, 1
	ret
.Lno:
	li a0, 0
	ret
