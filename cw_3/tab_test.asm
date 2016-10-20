%include "asm64_io.inc"

section .data
  array db 1, 2, 3, 4, 5, 6, 7
section .bss

section .text
global asm_main
asm_main:
 enter 0,0

initialize_data:
  mov rcx, 7 ; wielkość tablicy
  mov rax, 0  ;w sumowaniu bierze udział
  mov rdx, 0  ;tu będzie wynik
  mov rbx, array ; adres tablicy

add_next_element:
  cmp rcx, 0 ; jeżeli jest zerem to znaczy że przeszliśmy wszystkie elementy tablicy
  je print_result

  mov al, [rbx] ; jedno ściagamy jedno słowo ; PYTANIE co by by było gdybyśmy tutaj ściagneli słowo? 
  add dx, ax ; sumujemy tylko jeden bajt

  inc rbx ; rbx ++ kolejny index
  dec rcx ; rcx nasz licznik stopu
  jmp add_next_element

print_result:
  mov eax, edx
  call print_int
  call print_nl

end_program:
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret
