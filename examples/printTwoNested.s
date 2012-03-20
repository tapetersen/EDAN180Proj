	.text
	.global main
main:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	call 	printTwoNested
	pushl 	$0
	call	exit

printTwoNested:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	pushl	%ecx		# save statlink
	subl	$4, %esp	# alloc 1 var (x)
	movl	$1, -8(%ebp)	# x = 1
	movl	%ebp, %ecx	# give static link
	call	printTwoNested_p1
	leal	4(%ebp), %esp	# restore stack
	movl	(%ebp), %ebp	# restore frame-pointer
	ret
	
printTwoNested_p1:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	pushl	%ecx		# save statlink
	movl	-4(%ebp), %ecx	# get statlink for next funstion
	call	printTwoNested_p2
	leal	4(%ebp), %esp	# restore stack
	movl	(%ebp), %ebp	# restore frame-pointer
	ret

printTwoNested_p2:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	pushl	%ecx		# save statlink
	subl	$4, %esp	# alloc 1 arg
	movl	-4(%ebp), %ecx	# get statlink
	movl	-8(%ecx), %eax	# get x
	movl	%eax, (%esp)
	call	writeint
	addl	$4, %esp	# dealloc arg
	leal	4(%ebp), %esp	# restore stack
	movl	(%ebp), %ebp	# restore frame-pointer
	ret

