.global _start
.section .data
	A: .word 10, 50, 41, 55, 30, 20, 11, 5, 100, 77
	B: .word 0
.section .text
_start:
	ldr r0, =A
	ldr r1, =B
	mov r2, #10
	mov r4, #0x7FFFFFFF
	bl loop
	str r4, [r1]
	swi 0x011
loop:
	ldr r3, [r0], #4
	cmp r3, r4
	movlt r4, r3
	subs r2, r2, #1
	bne loop
	bx lr
.end
