.global _start
.section .data
  msg: .asciiz "only one char\n"
.section .text
_start:
  ldr r1, =msg
loop:
  ldrb r0, [r1], #1
  cmp r0, #0
  swine 0x00
  bne loop 
  swi 0x011
.end
