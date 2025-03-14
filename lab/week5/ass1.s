.global _start
.section .data
  str:    .asciz "banana"
  sub:    .asciz "ga"
  index:  .word 0

.section .text
_start:
  ldr r0, =str
  ldr r1, =sub

  stmea sp!, {r0}
  bl get_len
  ldmea sp!, {r2}

  stmea sp!, {r1}
  bl get_len
  ldmea sp!, {r3}

  cmp r2, r3
  swilt 0x011 ; early exit

  sub r4, r2, r3

  mov r5, #0 ; i value
  mov r2, #0 ; flag to confim if presnt

  bl outer
  cmp r2, #1
  ldr r0, =index
  streq r5, [r0]
  movne r2, #-1
  strne r2, [r0]
  swi 0x011

outer:
  cmp r5, r4
  bxeq lr

  mov r6, #0 ; j value
  ldrb r7, [r0, r5]
  ldrb r8, [r1]

  cmp r7, r8
  addne r5, r5, #1
  bne outer
inner:
  cmp r6, r3
  mov r2, #1
  bxeq lr

  add r9, r5, r6
  ldrb r7, [r0, r9]
  ldrb r8, [r1, r6]

  cmp r7, r8
  addne r5, r5, #1
  bne outer
  addeq r6, r6, #1
  b inner

get_len:
  ldmea sp!, {r7}
  mov r9, #0
loop:
  ldrb r8, [r7], #1
  cmp r8, #0
  stmeqea sp!, {r9}
  bxeq lr
  add r9, r9, #1
  b loop
.end
