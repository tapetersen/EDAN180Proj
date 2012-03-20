	.text
	.global main
main:
printx:
	movl 	%esp, %ebp
	pushl	$10
	call	writeint
	addl	$4, %esp
	pushl 	$0
	call	exit
	
