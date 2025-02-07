.section .data
  BCD:      .word 0x98765432
  result: .word 0x0
.section .text
  ldr r0, =BCD
  ldr r1, =result
  ldr r0, [r0]
  stmea sp!, {r0}
  bl smallest
  ldmea sp!, {r0}
  str r0, [r1]
  swi 0x011
smallest:
  ldmea sp!, {r4}
  mov r3, #0x7FFFFFFF
  mov r5, #8
  loop:
    and r6, r4, #0xF
    cmp r6, r3
    movlt r3, r6
    mov r4, r4, LSR #4
    subs r5, r5, #1
    bne loop
  stmea sp!, {r3}
  bx lr
.end
