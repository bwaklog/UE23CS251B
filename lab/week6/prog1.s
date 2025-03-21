.global _start
.section .text
_start:
  mov r0, #0
blink:
  mov r0, #1
  swi 0x201

  ; start delay
  mov r1, #64000
  stmea sp!, {r1}
  bl delay

  mov r0, #2
  swi 0x201

  ; start delay
  mov r1, #64000
  stmea sp!, {r1}
  bl delay

  b blink

delay:
  ldmea sp!, {r8}
loop:
  cmp r8, #0
  bxeq lr
  sub r8, r8, #1
  b loop
.end
