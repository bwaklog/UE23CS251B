.section .data
  m:      .word 3                 ; m rows
  n:      .word 2                 ; n columns
  row:    .word 2                 ; query row
  matrix: .word 2, 3, 4, 5, 6, 7  ; column major
  result: .word 0
.section .text
  ldr r0, =m
  ldr r1, =n
  ldr r2, =row
  ldr r3, =matrix
  ldr r4, =result

  ldr r0, [r0] ; m
  ldr r1, [r1] ; n
  ldr r2, [r2] ; row id
  ldr r5, [r4] ; result = 0

  sub r2, r2, #1 ; nth row = row (n - 1)
  add r3, r3, r2, LSL #2 ; move to query row
  mov r0, r0, LSL #2 ; m * 4 constant

  bl sum
  str r5, [r4]
  swi 0x011
sum:
  ldr r6, [r3], r0
  add r5, r5, r6
  subs r2, r2, #1
  bpl sum
  bx lr
.end
