.section .text
.globl strnlen

.type strnlen, @function

strnlen:
	add  s2, x0, a0
	beqz a1, .Lend
	.Lloop:
		lbu  t0, (s2)
		beqz t0, .Lend
		addi s2, s2, 1
		addi a1, a1, -1
		bnez a1, .Lloop

	.Lend:
		sub  a0, s2, a0

	ret
