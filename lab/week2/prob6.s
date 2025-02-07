.global _start
.section .text
_start:
	mov r0, #50
	mov r0, r0, LSL #5

	mov r1, #32
	add r1, r1, r1, LSL #2
	mov r1, r1, LSL #1
	add r1, r1, r1, LSL #2
	swi 0x011
.end
