.data

print:
	.string "Hello World!"

.text
.globl main
.type main, @function

main:
	push $print
	call printf

	addl $4, %esp

	ret


