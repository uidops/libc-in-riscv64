.section .text
.globl llabs

.type llabs, @function

llabs:
	# a0 = long long int (64-bit in riscv64)
	bgez a0, .Lend
	neg a0, a0
.Lend:
	ret
