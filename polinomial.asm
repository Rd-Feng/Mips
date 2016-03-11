	.data
endl:	.asciiz	"\n"
	.text
	# x -> $s1
	# result -> $s5
main:	li	$s1, 3		# int x = 2;
	
	move	$a0, $s1	# result = poly(x);
	jal	poly		# .
	move	$s5, $v0	# .
	
	li	$v0, 1		# cout << result;
	move	$a0, $s5
	syscall
	
	li	$v0, 4		# cout << endl;
	la	$a0, endl	
	syscall
	
	li	$v0, 10		# return 0;
	syscall

	# int poly(int i)
	# compute i^4 + i^2 + 1
	# $ra -> stack
	# $s0 -> stack
	# $s1 -> stack
	# copy of arg -> $s0
	# temp1 -> $s1
	# result -> $v0
poly:	addi	$sp, $sp, -12
	sw	$ra, ($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	
	move	$s0, $a0	
	li	$a1, 4		# temp1 = pow(i,4);
	jal	pow
	move	$s1, $v0	

	move	$a0, $s0	# result = pow(i,2);
	li	$a1, 2
	jal	pow
	
	add	$v0, $v0, $s1	# result += temp1;
	addi	$v0, $v0, 1	# result += 1;
	
endpoly:lw	$ra, ($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra		# return result;
	
	# int pow(arg0,arg1)
	# compute arg0^arg1
	# result -> $t0
	# i -> $t1
	# return result in $v0
pow:	li	$t0, 1		# int result = 1;
	li	$t1, 0		# int i = 0;
	bge	$t1, $a1, endpow
for:	mul 	$t0, $t0, $a0	# for(i = 0; i < p; i++)
	addi	$t1, $t1, 1	#     result *= arg0;
	blt	$t1, $a1, for	# .
endpow:	move	$v0, $t0	# return result;
	jr	$ra		# .
