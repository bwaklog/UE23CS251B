.global _start
.section .data
	array: 		.word 10, 2, -5, 100, -20, 5, 10, -5
	negsum: 	.word 0
.section .text
_start:
	ldr r0, =array
	ldr r1, =negsum
	mov r2, #8
	bl loop
	str r4, [r1]
	swi 0x11
loop:
	ldr r3, [r0], #4
	cmp r3, #0
	addlt r4, r4, r3
	subs r2, r2, #1
	bne loop
	bx lr
.end
