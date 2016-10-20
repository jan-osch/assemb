%include "asm64_io.inc"

section .data
array dd 1,2,3,4,5,6,-17,8,9,10 ; nasza tablica
len dd 10

section .bss

section .text
global asm_main
asm_main:
 enter 0,0

 push array ;adres

 mov rax, [len]
 push rax ;dlugosc tablicy

 call find_max

 call print_int ;printuje wynik

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret

; funkcja znajduje maksymalny element w tablicy 32bit int
; funkcja spodziewa się na stosie:
; długość tablicy
; wskaźnik na poczatek tablicy
; wynik bedzie w rejestrze rax
find_max:
  mov rcx, [rsp + 8] ; długość tablicy
  mov rbx, [rsp + 16] ; wskaźnik na poczatek tablicy
  mov rdx, 0 ; index

_check_next_number:
  cmp rdx, rcx
  je _done ;jeśli index jest równy długości to wychodzimy

  cmp rdx, 0 ; pierwszy element
  je _found_bigger

  cmp eax, [rbx + 4 * rdx ]
  jge _next_step

_found_bigger:
  mov rax, [rbx + 4 * rdx ]

_next_step:
  inc rdx
  jmp _check_next_number

_done:
  ret 16
