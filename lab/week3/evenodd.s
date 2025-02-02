.global _start
.section .data
	a:	.word	1, 2, 3, 4, 5, 6	
	b:	.word	0, 0, 0
	c:	.word	0, 0, 0
.section .text
_start:
	ldr r0, =a
	ldr r1, =b
	ldr r2, =c
	mov r3, #6
	bl loop
	swi 0x011

loop:	ldr r4, [r0], #4
	tst r4, #0x01
	streq r4, [r1], #4
	strne r4, [r2], #4
	subs r3, r3, #1
	bne loop
	bx lr
.end
