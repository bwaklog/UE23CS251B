.text
	ldr r0, =a
	ldr r1, [r0]
	mov r3, #0x1

	ands r2, r3, r1
	beq even
	swi 0x011
even:
	mov r2, #0
	swi 0x011
.data
a:	.word 23
.end
