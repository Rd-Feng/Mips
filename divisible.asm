.data
input_first_int:	.asciiz "Input first integer. Hit enter when done.\n"
input_second_int:	.asciiz "input second integer. Hit enter when done.\n"
not_divisible:		.asciiz "First int is not divisible by second int.\n"
is_divisible:		.asciiz "First int is divisible by second int.\n"
.text
# ask the user to input 2 integers
# check if the first one is divisible by the second one
main:	
	li	$v0 , 4		# cout << input_first_int 
	la	$a0 , input_first_int
	syscall
	
	li	$v0 , 5		# cin >> $s0 // first integer
	syscall
	move 	$s0 , $v0
	
	li	$v0 , 4		#cout << input_second_int
	la	$a0 , input_second_int
	syscall
	
	li	$v0 , 5		# cin >> $s1 // second integer
	syscall
	move 	$s1 , $v0
	
	rem	$s2 , $s0 , $s1	# $s2 = $$s0 % $s1
	
	bne	$s2 , $0 , rem_not_0	# if($s2 == 0){
	li	$v0 , 4			#     cout << is_divisible;
	la	$a0 , is_divisible	#     return 0;
	syscall				# }
	j	ifout			
rem_not_0:				# cout << not_divisible
	li	$v0 , 4			
	la	$a0 , not_divisible	
	syscall	
ifout:					# return 0;
	li	$v0 , 10
	syscall
