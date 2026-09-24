.section .text
.globl srand

.type srand, @function
srand:
	# a0 = unsigned int seed
	la t0, seed         # seed lives in rand.s
	sw a0, (t0)
	ret
