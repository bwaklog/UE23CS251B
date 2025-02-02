.global _start
.section .data
  A: .hword 10, 100, 21, 30, 40, 12, 5, 65, 48, 72
.section .text
  ldr r0, =A
  mov r1, #200
  mov r2, #0
  mov r3, #10

  bl loop
  swi 0x011
loop:
  ldrh r4, [r0]
  add r0, r0, #2
  cmp r4, r1
  moveq r2, #1
  bxeq lr
  subs r3, r3, #1
  bne loop
  bx lr 
.end
