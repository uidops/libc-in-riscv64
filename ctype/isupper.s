.section .text
.globl isupper

.type isupper, @function

isupper:
	addi a0, a0, -0x41
	sltiu a0, a0, 0x1a
	ret
