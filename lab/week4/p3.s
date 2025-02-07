.section .data
  matA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9 ; row major matrix
  matB: .word 0, 0, 0, 0, 0, 0, 0, 0, 0 ; column major
.section .text
  mov r0, #3
  ldr r1, =matA
  ldr r2, =matB
  bl transpose
  swi 0x011
transpose:
  ldmia r1!, {r5, r6, r7}
  mov r3, r2
  str r5, [r3], #12
  str r6, [r3], #12
  str r7, [r3]
  add r2, r2, #4
  subs r0, r0, #1
  bne transpose
  bx lr
.end
