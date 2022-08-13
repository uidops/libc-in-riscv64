.section .text
.globl isascii

.type isascii, @function

isascii:
	sltiu a0, a0, 0x80
	ret
