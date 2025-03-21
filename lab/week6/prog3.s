.global _start
.section .data
  str: .asciz "Hello World"
  num: .word 15000
.section .text
_start:
  mov r0, #20
  mov r1, #7
  mov r7, #0

  ldr r8, =num
  ldr r8, [r8]

  ldr r2, =str

loop:
  swi 0x204
  bl delay
  cmp r0, #0
  subne r0, r0, #1
  swieq 0x011
  b loop

delay:
  cmp r7, r8
  addne r7, r7, #1
  bne delay
  swi 0x206
  mov r7, #0
  bx lr
.end
