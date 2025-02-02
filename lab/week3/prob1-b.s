.global _start
.section .text
_start:	
	MOV R1, #16
	RSB R1, R1, R1, LSL #5
	SWI 0x011
.end
