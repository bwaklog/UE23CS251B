.global _start
.section .data
  msg: .asciiz "prompt> "
  NEWLINE: .ascii "\n"
  buff: .space 1
.section .text
  ldr r0, =msg
  swi 0x02

  ldr r0, =buff
  mov r1, #1
  swi 0x01

  ldr r0, =NEWLINE
  swi 0x00
  ldr r0, [r1]
  swi 0x00

  swi 0x011
.end
