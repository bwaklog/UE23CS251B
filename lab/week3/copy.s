.global _start
.section .data
	a:	.word	1, 2, 3, 4, 5, 6
	b:	.word	0, 0, 0, 0, 0, 0

.section .text
_start:
	ldr r0, =a
	ldr r1, =b
	mov r2, #2
	bl loop
	swi 0x011

loop:	ldmia r0!, {r4-r6}
	stmia r1!, {r4-r6}
	subs r2, r2, #1
	cmp r2, #0
	bne loop
	bx lr
.end
