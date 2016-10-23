%include "asm64_io.inc"

section .data
  array dw 1, 1, 1, 1, 1, 2
section .bss

section .text
global asm_main
asm_main:
 enter 0,0

initialize_data:
  mov rcx, 6 ; wielkość tablicy
  mov rax, 0  ; czyścimy w sumowaniu bierze udział
  mov rdx, 0  ; tu będzie wynik
  mov rbx, array ; adres tablicy

add_next_element:
  add dx, [rbx + 2 * rcx - 2] ; PYTANIE - dlaczego tu nie może być cx ? ; czyli w indeksach zawsze używaj rcx
  loop add_next_element

print_result:
  mov eax, edx
  call print_int
  call print_nl

end_program:
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret
