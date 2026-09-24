.section .text
.globl exit

.type exit, @function
exit:
	# a0 = status
	li a7, 93           # SYS_exit (pk)
	ecall
	ret
