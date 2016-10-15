%include "asm64_io.inc"

section .data
text db "Proszę podaj liczbę", 0
answer db "Liczby pierwsze:", 0
separator db " ", 0

current dq 0
upper dq 0
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
  dec eax
  mov [current], eax ; current = wczytana -1

  mov eax, text ; przenies tekst który będzie printowany
  call print_string
  call print_nl

  call read_int   ; wczytanie liczby int
  mov [upper], eax ; wczytana górna granica przedziału

  mov eax, answer
  call print_string

check_next_suspect:
  mov eax, [current]
  inc eax
  mov [current], eax ; current++ będzie używane przez obie gałęzie

  mov ebx, [upper]

  cmp [current], ebx ; sprawdzamy czy current jest większy od upper
  jg  end_program ; jeżeli tak to kończymy program

  mov eax, [current]
  call check_is_prime

  cmp ebx, 1 ; jeżeli reszta z dzielenia jest zerem to znaleźliśmy kolejny dzielnik
  je suspect_is_prime

  jmp check_next_suspect

suspect_is_prime:
  mov eax, separator
  call print_string

  mov eax, [current]
  call print_int

  jmp check_next_suspect

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret


section .functions

check_is_prime: ; function that checks if number in eax is a prime number
  cmp eax, 1
  je found_not_prime ; 1 nie jest pierwsze

  mov [check_is_prime_number], eax ; kopiujemy liczbę do zachowania
  cmp eax, 2 ; 2 zostałaby przez pętle wyłapana
  je found_prime

  start_checking:
    mov ecx, 2    ; zaczynamy sprawdzanie od 2

  while_check_number:
    mov eax, [check_is_prime_number]  ; ustawiamy number
    mov edx, 0 ; resetujemy resztę
    div ecx  ; dzielimy -reszta z dzielenia jest w edx

    cmp edx, 0
    je found_not_prime ; jeżeli reszta z dzielenia jest zerem to nie jest pierwsza

    inc ecx ; ecx++;
    cmp ecx, [check_is_prime_number]  ; jeżeli exc ma wartość ebx to liczba jest pierwsza
    jge found_prime

    jmp while_check_number

  found_prime:
    mov ebx, 1
    jmp check_is_prime_done

  found_not_prime:
    mov ebx, 0
    jmp check_is_prime_done

  check_is_prime_done:
    ret ; the result is stored in ebx
