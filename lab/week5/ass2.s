.global _start
.section .data
  str:  .asciz "dog"
  newline: .asciz "\n"
  old_string_text: .asciz "original: "
  new_string_text: .asciz "new string: "
.section .text
_start:
  ldr r0, =old_string_text
  swi 0x02

  ldr r0, =str
  swi 0x02 ; display original string

  ldr r0, =newline
  swi 0x02

  ldr r0, =str

  stmea sp!, {r0}
  bl get_len
  ldmea sp!, {r2}
  cmp r2, #0
  swieq 0x011
  sub r2, r2, #1

  ldrb r3, [r0, #0]
  ldrb r4, [r0, r2]
  strb r4, [r0, #0]
  strb r3, [r0, r2]

  mov r9, r0
  ldr r0, =new_string_text
  swi 0x02

  mov r0, r9
  swi 0x02 ; display reversed string

  swi 0x011

get_len:
  ldmea sp!, {r9}
  mov r8, #0
loop:
  ldrb r7, [r9], #1
  cmp r7, #0
  stmeqea sp!, {r8}
  bxeq lr
  add r8, r8, #1
  b loop
.end
