.global _start
.section .data
  str: .asciz "hello, world!"
  len: .word 0
.section .text
_start:
  ldr r0, =str
  ldr r1, =len
  mov r2, #0

  bl loop
  str r2, [r1]
  swi 0x011

loop:
  ldrb r3, [r0], #1
  cmp r3, #0
  bxeq lr
  add r2, r2, #1
  b loop
.end
