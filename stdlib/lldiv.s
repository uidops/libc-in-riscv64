.section .text
.globl lldiv

.type lldiv, @function
lldiv:
	# a0 = numer, a1 = denom
	# lldiv_t: a0 = quot, a1 = rem
	div t0, a0, a1
	rem a1, a0, a1
	add a0, x0, t0
	ret
