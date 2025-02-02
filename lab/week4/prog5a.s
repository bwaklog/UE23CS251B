.global _start
.section .data
 matA:    .word 10, 20, 30
 matB:    .word 40, 50, 60
 result:  .word 0
.section .text
  ldr r0, =matA
  ldr r1, =matB
  ldr r2, =result
  mov r3, #3
  bl loop
  str r6, [r2]
  swi 0x011
loop:
  ldr r4, [r0], #4
  ldr r5, [r1], #4
  mul r7, r4, r5
  add r6, r6, r7
  subs r3, r3, #1
  bne loop
  bx lr
.end
