.global _start
.section .data
  BCD: .word 0x1234
  sum: .word 0
.section .text
_start:
  ldr r0, =BCD
  ldr r1, =sum
  ldr r0, [r0]
  mov r2, #8                ; 8 bytes in a 32 bit number
                            ; consider each represents a BCD
                            ; number
  bl loop
  str r3, [r1]
  swi 0x11
loop: 
  mov r4, r0
  and r4, r4, #0x0000000F   ; masking for the last bit
  add r3, r4, r3
  mov r0, r0, ASR #4
  subs r2, r2, #1
  bne loop
  bx lr
.end
