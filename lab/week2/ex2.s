.text
	ldr r0, =a
	ldr r1, [r0]

	ldr r5, =b
	ldr r6, =c

	mvn r2, r1 @ 1's complement

	mov r3, #0x0
	rsb r4, r1, r3

	str r2, [r5]
	str r4, [r6]
.data
	a:	.word 10
	b:	.word 0
	c:	.word 0
.end
