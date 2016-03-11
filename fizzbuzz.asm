.data
Fizz:	.asciiz	"Fizz"
Buzz:	.asciiz "Buzz"
endl:	.asciiz "\n"
.text
# FizzBuzz
main:
	li	$s0 , 0			# int i = 0;
	li	$s1 , 100		# int max = 100;
	
	li	$s0 , 1			# for(i = 1; i <= max; i++{
	bgt 	$s0 , $s1 , loopout	#
loop:		
	rem	$s2 , $s0 , 3		#    $s2 = i % 3
	rem	$s3 , $s0 , 5		#    $s3 = i % 5
	
	bne	$s2 , 0 , not_3		#    if(i % 3 == 0)
	li	$v0 , 4			#	cout << Fizz;
	la	$a0 , Fizz
	syscall
not_3:
	bne	$s3 , 0 , not_5		#    if(i % 5 == 0)
	li	$v0 , 4			#	cout << Buzz;
	la	$a0 , Buzz
	syscall
not_5:
	bne	$s2 , 0 , rem_5		#    if(i % 3 == 0 || i % 5 == 0)
	li	$v0 , 4			#	cout << endl;
	la	$a0 , endl
	syscall	
	j	back
rem_5:
	bne	$s3 , 0 , else
	li	$v0 , 4
	la	$a0 , endl
	syscall
else:
	li	$v0 , 1			#    else
	move	$a0 , $s0		#	cout << i << endl;
	syscall	
		
	li	$v0 , 4
	la	$a0 , endl
	syscall
back:	
	addi	$s0 , $s0 , 1		
	ble	$s0 , $s1 , loop	# }
	
loopout:
	li	$v0 , 10
	syscall
