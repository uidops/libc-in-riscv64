.section .text
.globl div

.type div, @function
div:
	# a0 = numer, a1 = denom
	# div_t packs into a0: quot in bits 0-31, rem in bits 32-63
	divw t0, a0, a1
	remw t1, a0, a1
	slli t1, t1, 32
	slli t0, t0, 32
	srli t0, t0, 32
	or a0, t0, t1
	ret
