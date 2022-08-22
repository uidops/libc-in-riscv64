.section .text
.globl isalpha

.type isalpha, @function

isalpha:
	ori a0, a0, 0x20
	addi a0, a0, -0x61
	sltiu a0, a0, 0x1a
	ret
