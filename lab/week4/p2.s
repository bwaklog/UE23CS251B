.section .data
  n1:     .word 0x90000000
  n2:     .word 0x90000000
  result:    .word 0x0
.section .text
  ldr r0, =n1
  ldr r1, =n2
  ldr r2, =result

  ldr r0, [r0]
  ldr r1, [r1]

  stmea sp!, {r0, r1}
  bl bcd_add

  ldmea sp!, {r4, r5}
  stmia r2, {r4, r5}

  swi 0x011
bcd_add:
  ldmea sp!, {r4, r5}
  mov r0, #0 ; this is the amount 
             ; to shift the sum by
  mov r1, #8

loop:
  and r6, r4, #0xF
  and r7, r5, #0xF
  add r6, r6, r7
  add r6, r6, r8      ; adding the carry
  mov r8, #0
  cmp r6, #10
  subge r6, r6, #10
  movge r8, #1        ; 1 is the carry

  add r9, r9, r6, lsl r0
  add r0, r0, #4
  subs r1, r1, #1
  mov r4, r4, lsr #4
  mov r5, r5, lsr #4
  bne loop

  stmea sp!, {r9, r8}
  bx lr
.end
