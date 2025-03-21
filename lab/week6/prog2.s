.global _start
.section .data
Digits:
  .word 0xED
  .word 0x60
  .word 0xCE
  .word 0xFA
  .word 0x63
  .word 0xAB
  .word 0xAF
  .word 0xE0
  .word 0xEF
  .word 0xE3
  .word 0xE7
  .word 0x2F
  .word 0x8D
  .word 0x6E
  .word 0x8F
  .word 0x87
  .word 0 ; blank
.section .text
_start:
  mov r0, #0
  mov r2, #0
  swi 0x202 ; check which button
            ; left -> r0 = 2 -> dsc
            ; right -> r0 = 1 -> asc

  ldr r1, =Digits
  cmp r0, #1
  moveq r5, #0
  bleq asc

  movne r5, #15
  mov r4, r5, LSL #2
  add r1, r1, r4
  blne desc
asc:
  ldr r0, [r1]
  swi 0x200

  mov r6, #64000
  stmea sp!, {r6}
  bl delay

  cmp r5, #16 ; count reaches 0
  ldreq r1, =Digits
  moveq r5, #0

  addne r5, r5, #1
  addne r1, r1, #4
  b asc
desc:
  ldr r0, [r1]
  swi 0x200
  mov r6, #64000
  stmea sp!, {r6}
  bl delay
  cmp r5, #0
  sub r5, r5, #1
  ldreq r1, =Digits
  moveq r5, #15
  addeq r1, r1, r4

  subne r1, r1, #4

  b desc
delay:
  ldmea sp!, {r8}
loop:
  cmp r8, #0
  bxeq lr
  sub r8, r8, #1
  b loop
.end
