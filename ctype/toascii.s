.section .text
.globl toascii

.type toascii, @function

toascii:
	andi a0, a0, 0x7f
	ret
