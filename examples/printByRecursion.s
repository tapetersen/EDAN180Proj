	.text
	.global main
main:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	call 	printByRecursion
	pushl 	$0
	call	exit

printByRecursion:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	pushl	%ecx		# save statlink
	subl	$4, %esp	# alloc 1 param
	movl	$5, (%esp)	# set first param
	movl	%ebp, %ecx	# give static link
	call	printR
	addl	$4, %esp	# dealloc args
	leal	4(%ebp), %esp	# restore stack
	movl	(%ebp), %ebp	# restore frame-pointer
	ret
	
printR:
	pushl	%ebp		# save dynlink
	movl 	%esp, %ebp	# set framepointer
	pushl	%ecx		# save statlink
	subl	$4, %esp	# alloc 1 temp
	movl	8(%ebp), %eax	# get n
	cmpl	$0, %eax
	je	printR_1	
	jmp	printR_2

printR_1:
	jmp	printR_exit


printR_2:
	subl	$4, %esp	# alloc 1 param
	movl	8(%ebp), %eax	# get n
	movl	%eax, (%esp)	# set first param
	call	writeint
	addl	$4, %esp	# dealloc args
	movl	8(%ebp), %eax	# get n
	subl	$1, %eax
	movl	%eax, -8(%ebp)	# store in temp1
	subl	$4, %esp	# alloc 1 param
	movl	-8(%ebp), %eax	
	movl	%eax, (%esp)
	movl	4(%ebp), %ecx	# give static link
	call	printR
	addl	$4, %esp	# dealloc args
	jmp	printR_exit

printR_exit:
	leal	4(%ebp), %esp	# restore stack
	movl	(%ebp), %ebp	# restore frame-pointer
	ret

