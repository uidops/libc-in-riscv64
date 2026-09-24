.section .text
.globl strnlen

.type strnlen, @function
strnlen:
	add  t1, x0, a0
	beqz a1, .Lend
	.Lloop:
		lbu  t0, (t1)
		beqz t0, .Lend
		addi t1, t1, 1
		addi a1, a1, -1
		bnez a1, .Lloop

	.Lend:
		sub  a0, t1, a0

	ret
