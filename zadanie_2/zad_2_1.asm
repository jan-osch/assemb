%include "asm64_io.inc"

segment .data
text db "Proszę podaj liczbę", 0
is_prime db "Liczba jest pierwsza", 0
is_not db "Liczba nie jest pierwsza", 0
number db 0

segment .bss

segment .text
global asm_main
asm_main:
 enter 0,0

ask_for_number:
  mov eax, text ; przenies tekst który będzie printowany
  call print_string
  call print_nl

  call read_int   ; wczytanie liczby int
  mov [number], eax ; liczba jest teraz w eax

check_is_two:
  cmp eax, 2 ; 2 zostałaby przez pętle wyłapana
  je found_prime ; 2 jest pierwsze
  jl found_not_prime ; 1 nie jest pierwsze

start_checking:
  mov ecx, 2    ; zaczynamy sprawdzanie od 2, ecx jest dzielnikiem

while_check_number:
  mov eax, [number]  ; ustawiamy number
  mov edx, 0 ; resetujemy resztę
  div ecx  ; dzielimy -reszta z dzielenia jest w edx

  cmp edx, 0
  je found_not_prime ; jeżeli reszta z dzielenia jest zerem to nie jest pierwsza

  inc ecx ; ecx++; do następnego obrotu pętli

  cmp ecx, [number]  ; jeżeli exc ma wartość ebx to liczba jest pierwsza
  jge found_prime

  jmp while_check_number

found_prime:
  mov eax, is_prime
  call print_string
  call print_nl
  jmp done

found_not_prime:
  mov eax, is_not
  call print_string
  call print_nl
  jmp done

done:
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret
