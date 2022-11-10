.text
.global bof
bof:
	# prologo
	pushl	%ebp
	movl	%esp, %ebp


	subl	$40, %esp
	subl	$8, %esp
	pushl	8(%ebp)
	leal	-32(%ebp), %eax
	pushl	%eax
	call	strcpy
	addl	$16, %esp
	movl	$1, %eax
	leave
	ret
	
.global main
main:
	#ignorar todo esto de acá abajo
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$564, %esp
	subl	$4, %esp
	pushl	$24
	pushl	$0
	leal	-553(%ebp), %eax
	pushl	%eax
	call	memset
	addl	$16, %esp
	subl	$8, %esp
	pushl	$.LC0
	pushl	$.LC1
	call	fopen
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	pushl	-12(%ebp)
	pushl	$517
	pushl	$1
	leal	-529(%ebp), %eax
	pushl	%eax
	call	fread
	addl	$16, %esp
	subl	$12, %esp
	leal	-529(%ebp), %eax
	pushl	%eax
	call	bof

	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC2
	call	puts
	addl	$16, %esp
	movl	$1, %eax
	movl	-4(%ebp), %ecx
	leave
	leal	-4(%ecx), %esp
	ret