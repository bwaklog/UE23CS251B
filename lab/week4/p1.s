.global _start
.section .data
  start:  .word 1 ; start of natural numbers
  gap:    .word 1 ; gap between each natural number
  matrix: .word 0 ; start address of (0,0) element
                  ; of the 3x3 column major matrix
.section .text
  ldr r0, =start
  ldr r1, =gap
  ldr r0, [r0]
  ldr r1, [r1]
  ldr r2, =matrix

  mov r3, #0
  mov r4, #0
  mov r5, #3

  mul r6, r1, r5  ; repurpose r5 count register
                  ; gap * next element in 3x3

  bl loop
  swi 0x011
loop:
  mov r7, r0
  add r8, r7, r6
  add r9, r8, r6
  stmia r2!, {r7-r9}
  add r0, r0, #1
  subs r5, r5, #1
  bne loop
  bx lr
.end
