.text
	ldr r0, =a
	ldr r1, =b
	ldr r2, =c

	ldr r3, [r0]
	ldr r4, [r1]

	subs r5, r3, r4
	blne noteq
	str r5, [r2]
	swi 0x011
noteq:
	adds r5, r3, r4
	bx lr
.data
a:	.word 10
b:	.word 10
c:	.word 0
.end
