.global _start
.section .data
  A:  .word 1
  B:  .word 2
.section .text
  ldr r0, =A
  ldr r1, =B
  ldr r2, [r0]
  ldr r3, [r1]
  stmea sp!, {r2, r3}
  bl swap
  ldmea sp!, {r2, r3}
  str r2, [r0]
  str r3, [r1]
  swi 0x011
swap:
  ldmea sp!, {r4, r5}
  stmea sp!, {r5}
  stmea sp!, {r4}
  bx lr
.end
