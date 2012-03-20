	.text
.globl writeint
	.type	writeint, @function
writeint:
	pushl	%ebp		# save dynlink
	movl	%esp, %ebp	# set frame-pointer
	pushl	%ecx		# save statlink

	subl	$8, %esp	# alloc 2 param
	movl	8(%ebp), %eax	# get our param 1
	movl	%eax, 4(%esp)	# set param 2 for printf
	leal	.fmt, %eax	# get string address
	movl	%eax, (%esp)	# set param 1 for printf
	call	printf
	addl	$8, %esp	# deallc params
	leal	4(%ebp), %esp	# restore stack pointer
	movl	(%ebp), %ebp
	ret
	.section	.rodata
.fmt:
	.string	"%d\n"

