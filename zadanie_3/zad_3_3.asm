%include "asm64_io.inc"

section .data
result db "          "

section .bss

section .text
global asm_main
asm_main:
 enter 0,0

 push result
 mov rax, -120123000
 push rax

 call stringify_number ;printuje wynik

 mov rax, result
 call print_string

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret


; Function that changes given number, with sign, to a string
; Argument passing:
;
; address - address of the result buffer
; number - signed int subject to be parsed
; RSP
;
stringify_number:
  mov rax, [rsp + 8] ; value of the number to be parsed
  mov rcx, [rsp + 16] ; address of result

  xor rbx, rbx ; zero out helper registers
  xor rdx, rdx ; quick zero

  push 0 ; zero that finishes the string

_strnum_check_sign:
  cmp rax, 0
  jge _strnum_start_parsing ; if number is positive

  mov rbx, "-" ; number is negative, first character must be a minus sign
  mov [rcx], rbx

  inc rcx
  imul rax, rax, -1 ; make sign positive

_strnum_start_parsing:
  mov rbx, 10 ; again divisor must be zero

_strnum_parse_next_digit:
  cmp rax, 0
  jle _strnum_pop_string ; if remainder is less than 0 it means should be next phase

  div rbx ; now rdx should be remainder from division

  add dx, '0' ; convert to ASCII code

  push rdx
  xor rdx, rdx

  jmp _strnum_parse_next_digit

_strnum_pop_string:
  xor rdx, rdx ; quick zero, it will be used as an index

_strnum_pop_digit:
  pop rbx
  cmp rbx, 0
  je _strnum_done ; while rbx != 0

  mov [rcx + rdx], rbx ; put next character to the result
  inc rdx

  jmp _strnum_pop_digit

_strnum_done:
  ret 16
