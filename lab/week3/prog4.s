.global _start
.section .data
  ; a square matrix, in row major order
  matrix: .word 10, 20, 30, 40, 50, 60, 70, 80, 90 
  N: .word 3      @ number of elements per row

  ; (i, j) ~ (row, col)
  X: .word 2      @ x coord
  Y: .word 1      @ y coord
  addr: .word 0   @ stores address at B
  result: .word 0 @ store
.section .text
  ldr r0, =matrix
  ldr r1, =N
  ldr r2, =X
  ldr r3, =Y
  ldr r4, =addr
  ldr r5, =result
  mov r7, #4      ; multiplication constant

  ldr r1, [r1]    ; number of elemnts
  ldr r2, [r2]    ; column number
  ldr r3, [r3]    ; row number

  mul r9, r2, r1
  add r8, r9, r3
  mul r9, r8, r7
  add r9, r0, r9
  ldr r6, [r9]
  str r6, [r5]
  str r9, [r4]

  swi 0x011 
.end
