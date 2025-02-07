.text
	mov r0, #10
	mov r1, r0 @ register result
	mov r3, #0 @ stores the number of iterations
	b fib
fib:
	mov r2, r1
	subs r0, r0, #1
	beq end
	mul r1, r0, r2
	add r3, r3, #1
	b fib
end:
	swi 0x011
.end
