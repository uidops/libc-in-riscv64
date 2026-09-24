.section .text
.globl memset

.type memset, @function
memset:
	# a0 = dst, a1 = int c, a2 = size_t n
	beqz a2, .end
	add t0, x0, a0
	.loop:
		sb  a1, (t0)
	    addi a2, a2, -1
		addi t0, t0, 1
		bne a2, x0, .loop
	.end:
		ret
