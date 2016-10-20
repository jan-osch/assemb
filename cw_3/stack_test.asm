%include "asm64_io.inc"


section .text
global asm_main
asm_main:
 enter 0,0

initialize_data:
  mov rax, 1
  push rax
  mov rax, 2
  push rax
  mov rax, 3
  push rax
  dump_regs 0
  call function



end_program:
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret

function:
  pop rax
  dump_regs 1
  pop rax
  dump_regs 2
  pop rax
  dump_regs 3
  ret
