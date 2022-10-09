.data
	msg1:     .string " Enter number: "
	msg2:     .string " %ld of A elements > %ld\n"
	msg3:     .string " %ld of A elements < %ld\n"

	format_i: .string "%ld"

	buffer_i: .long   0	# for scan int from terminal
	gr_m:     .long   0	# greater than M counter
	less_m:   .long   0	# less than M counter
	arr:	  .long   3, 8, 303, 40, 15, 77, 123, 90, 245, 45, 68, 201
.text
.globl	main

main:
	push $msg1
	call printf			# printf(" Enter number: ")

	push $buffer_i
	push $format_i
	call scanf			# scanf("%ld")

	# Loop init
	movl $0, %edi			# i=0
	movl arr(,%edi,4), %eax		# get A[i]

# Loop
st:
	cmpl $0, %eax			# check loop end
	je ex				# to ex if end

	cmpl buffer_i, %eax
	jg greater			# M>A[i]
	jl less				# M<A[i]
	jmp nxt				# M==A[i]

greater:
	incl gr_m			# gr_m++
	jmp nxt
less:
	incl less_m			# less_m++
nxt:
	incl %edi			# i++
	movl arr(,%edi,4), %eax		# get A[i]
	jmp st
# Loop end

ex:
	push buffer_i
	push gr_m
	push $msg2
	call printf	# printf(" %ld of A elements > %ld\n", gr_m, M)

	push buffer_i
	push less_m
	push $msg3
	call printf	# printf(" %ld of A elements < %ld\n", less_m, M)

	pushl $0
	call exit	# return 0
