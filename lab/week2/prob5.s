.global _start
.section .data
	N: .word 10
	result: .word 0
.section .text
_start:
	ldr r0, =result
	mov r1, #0
	mov r2, #1
	add r3, r2, r1

	ldr r4, =N
	ldr r4, [r4]

	cmp r4, #1
	beq single

	cmp r4, #2
	beq two

	stmia r0!, {r1, r2}
	bl loop
	swi 0x011
loop:
	str r3, [r0], #4
	mov r1, r2
	mov r2, r3
	add r3, r1, r2
	subs r4, r4, #1
	bne loop
	bx lr
single:
	str r1, [r0]
	swi 0x011
two:
	stmia r0!, {r1, r2}
	swi 0x011
.end
