.global _start
section .data
	Array:		.word	15, 10, 12, 13, 9, 45, 16, 8, 25, 33
	evensum:	.word	0
section .text
_start:	ldr r0, =Array
	ldr r2, =evensum
	mov r1, #10
	bl loop
	str r3, [r2]
	swi 0x011

loop:	ldr r4, [r0], #4
	tst r4, #1
	addeq r3, r3, r4
	subs r1, r1, #1
	bne loop
	bx lr
.end
