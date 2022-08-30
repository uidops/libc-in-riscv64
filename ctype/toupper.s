.section .text
.globl toupper

.type toupper, @function

toupper:
	addi t0, a0, -0x61
	addi t1, x0, 0x19
	bleu t0, t1, .ok
	ret
	.ok:
		andi a0, a0, 0x5f
		ret
