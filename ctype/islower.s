.section .text
.globl islower

.type islower, @function

islower:
	addi a0, a0, -0x61
	sltiu a0, a0, 0x1a
	ret
