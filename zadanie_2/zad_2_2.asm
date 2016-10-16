%include "asm64_io.inc"

section .data
text db "Proszę podaj liczbę", 0
answer db "Dzielniki:", 0
separator db " ", 0

number dq 0
divisor dq 0

section .bss

section .text
global asm_main
asm_main:
 enter 0,0

ask_for_number:
  mov eax, text ; przenies tekst który będzie printowany
  call print_string
  call print_nl

  call read_int   ; wczytanie liczby int
  mov [number], eax ; liczba jest teraz w eax

  mov eax, 2
  mov [divisor], eax ;zaczynamy od 2

  mov eax, answer
  call print_string

check_next_divisor:
  mov eax, [number]
  cmp eax, 1 ; sprawdzamy czy numer jaki pozostał to 1
  je  end_program ; jeżeli tak to kończymy program

  mov ecx, [divisor]
  mov edx, 0
  div ecx ; dzielimy numer przez obecny dzielnik

  cmp edx, 0 ; jeżeli reszta z dzielenia jest zerem to znaleźliśmy kolejny dzielnik
  je found_divisor

  mov eax, [divisor]
  inc eax
  mov [divisor], eax ; divisor++

  jmp check_next_divisor

found_divisor:
  mov [number], eax ; zachowujemy rezultat z dzielenia w eax
  mov eax, separator
  call print_string

  mov eax, [divisor]
  call print_int

  jmp check_next_divisor

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret
