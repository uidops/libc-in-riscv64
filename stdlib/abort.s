.section .text
.globl abort

.type abort, @function
abort:
	# pk has no signals: exit with 128 + SIGABRT (6)
	li a0, 134
	li a7, 93           # SYS_exit (pk)
	ecall
	ret
