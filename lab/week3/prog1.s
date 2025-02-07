.global _start
.section .data
  A: .word 31
  B: .word 6
  C: .word 0
.section .text
_start:
  ldr r0, =A
  ldr r1, =B
  ldr r2, =C
  ldr r3, [r0]
  ldr r4, [r1]

  cmp r3, r4
  blt terminate
  b loop
loop:
  sub r3, r3, r4
  cmp r3, #0
  bgt loop
  beq terminate
  addlt r3, r3, r4
  b terminate
terminate:
  str r3, [r2]
.end
