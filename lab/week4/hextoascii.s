.global _start
.section .data
  digits: .word 0x1234
  ascii: .word 0
.section .text
_start:
  ldr r0, =digits
  ldr r1, =ascii
  ldr r0, [r0]
  mov r2, #8                ; 8 bytes in a 32 bit number
                            ; consider each represents a BCD
                            ; number
  bl loop
  swi 0x11
loop:
  mov r4, r0
  and r4, r4, #0x0000000F   ; masking for the last bit
  add r4, r4, #48
  str r4, [r1], #4
  mov r0, r0, ASR #4
  subs r2, r2, #1
  bne loop
  bx lr
.end
