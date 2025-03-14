.global _start
.section .data
  matA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
  matB: .word 1, 0, 0, 0, 1, 0, 0, 0, 1 
  matC: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
.section .text
_start:
  ldr r1, =matC

  mov r2, #0 @ i
  mov r3, #0 @ j
  mov r4, #0 @ k

  bl loop_a
  swi 0x011

loop_a:
  cmp r2, #3
  bxeq lr
  mov r3, #0

loop_b:
  cmp r3, #3

  addeq r2, r2, #1
  beq loop_a

  mov r0, #0 ; reset sum variable
  mov r4, #0

loop_c:
  cmp r4, #3
  ; calculating index for C[i][j]
  moveq r7, r2
  addeq r7, r7, r7, LSL #1
  addeq r7, r7, r3
  addeq r3, r3, #1
  streq r0, [r1, r7, LSL #2]
  beq loop_b

  ; calculating index for A[i][k]
  mov r5, r2
  add r5, r5, r5, LSL #1
  add r5, r5, r4

  ; calculating index for B[k][j]
  mov r6, r4
  add r6, r6, r6, LSL #1
  add r6, r6, r3


  ldr r8, =matA
  ldr r8, [r8, r5, LSL #2]
  ldr r9, =matB
  ldr r9, [r9, r6, LSL #2]
  mla r0, r8, r9, r0

  add r4, r4, #1
  b loop_c

.end
