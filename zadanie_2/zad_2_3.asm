%include "asm64_io.inc"

section .data
text db "Proszę podaj liczbę", 0
answer db "NWW: ", 0

smaller dq 0
greater dq 0
multiplier dq 0
result dq 0

check_is_prime_number dq 0

section .bss

section .text
global asm_main
asm_main:
 enter 0,0

ask_for_numbers:
  mov eax, text ; przenies tekst który będzie printowany
  call print_string
  call print_nl

  call read_int   ; wczytanie liczby int
  mov [smaller], eax ;

  mov eax, text ; przenies tekst który będzie printowany
  call print_string
  call print_nl

  call read_int   ; wczytanie liczby int
  mov [greater], eax ; wczytana górna granica przedziału

  mov eax, answer
  call print_string

initialize_multiplier:
  mov eax, 2
  mov [multiplier], eax ; mnożnik

swap_numbers_if_needed:
  mov eax, [smaller]
  mov ebx, [greater]

  cmp eax, ebx
  je print_result ; jeżeli sa rowne to wynikiem jest smaller || greater
  jl find_scm ;kolejność jest ok

  mov [smaller], ebx ;zamieniamy kolejność
  mov [greater], eax

find_scm:
  call multiply_multiplier_and_smaller ; eax to teraz mnożnik * mniejsza

  mov edx, 0 ; zerujemy do resztę z dzielenia
  mov ebx, [greater] ; przenosimy do rejestru aby zadeklarować wielkość dzielenia
  div ebx ; edx = eax `mod` edbx

  cmp edx, 0
  je found_result ; jeżeli reszta z dzielenia jest zero to mamy mnożnik

  mov eax, [multiplier]
  inc eax
  mov [multiplier], eax ; multiplier ++

  jmp find_scm

multiply_multiplier_and_smaller:
  mov edx, [multiplier]
  mov eax, [smaller]

  mul edx;
  ret

found_result:
  call multiply_multiplier_and_smaller ; multiplies multuplier * smaller for print_result

print_result:
  call print_int ;expects result to be in rax

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret
