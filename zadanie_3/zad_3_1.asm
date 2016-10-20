%include "asm64_io.inc"

section .data
text_welcome db "Proszę podawać dowolne liczby całkowite różne od 0:", 0
text_reference db "Proszę podawać dowolna liczbe całkowita ", 0
answer db "Wynik:", 0

section .bss

section .text
global asm_main
asm_main:
 enter 0,0

print_welcome:
  mov eax, text_welcome ; przenies tekst który będzie printowany
  call print_string
  call print_nl
  mov rdx, rsp ;odkładamy wskaźnik na szczyt stosu

read_number:
  call read_int   ; wczytanie liczby int
  cmp eax, 0
  je read_reference ; jeżeli jest zero to wczytujemy stop

  push rax
  jmp read_number

read_reference:
  mov eax, text_reference
  call print_string
  call print_nl ; prosimy usera o wpisanie reference

  call read_int ; liczba referencyjna jest w eax
  mov rcx, 0 ; zliczamy wynik tutaj

check_numbers:
  cmp rsp, rdx
  je print_result ;wróciliśmy do stanu stosu z print_welcome

  pop rbx ;sciagamy ze stosu
  cmp ebx, eax
  jge check_numbers

  inc ecx ;inkrementujemy wynik
  jmp check_numbers

print_result:
  mov eax, answer
  call print_string
  call print_nl ; printujemy zapowiedź wyniku

  mov eax, ecx
  call print_int

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret
