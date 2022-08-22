.section .text
.globl isdigit

.type isdigit, @function

isdigit:
	addi a0, a0, -0x30
	sltiu a0, a0, 0x0a
	ret
