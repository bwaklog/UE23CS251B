.global _start
.section .data
	A: .word 1, 5, 10, -5, 2, 100, 24, 0, -12
	pos: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
	neg: .word 0, 0, 0, 0, 0, 0, 0, 0, 0	
.section .text
_start:
	ldr r0, =A
	ldr r1, =pos
	ldr r2, =neg
	mov r3, #9

	bl loop
	swi 0x11
loop:
	ldr r4, [r0], #4
	cmp r4, #0
	strge r4, [r1], #4
	strlt r4, [r2], #4

	subs r3, r3, #1
	bne loop
	bx lr
.end
