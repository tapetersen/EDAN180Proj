	.text
	.global main
main:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	call 	printNested
	pushl 	$0
	call	exit

printNested:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	pushl	%ecx		# save statlink
	subl	$4, %esp	# alloc 1 var (x)
	movl	$1, -8(%ebp)	# x = 1
	movl	%ebp, %ecx	# give static link
	call	printNested_innerProc
	leal	4(%ebp), %esp	# restore stack
	movl	(%ebp), %ebp	# restore frame-pointer
	ret
	
printNested_innerProc:
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

