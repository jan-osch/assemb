section .text

global _start

_start: ;zapytaj o pierwsza liczbe
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
            ; 1 oznacza ekran

  mov rsi, prompt    ; co czytaj
  mov rdx, prompt_length  ; ile czytaj

  syscall

_load_first:
  mov rax, 0; systemowe read

  mov rdi, 0; deksryptor pliku klawiatura

  mov rsi, first    ; destination
  mov rdx, 2  ; ile wczytaj

  syscall

_prompt_second: ;zapytaj o druga liczbe
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
            ; 1 oznacza ekran

  mov rsi, prompt_sec    ; co czytaj
  mov rdx, prompt_sec_length  ; ile czytaj

  syscall

_load_second:
  mov rax, 0; systemowe read

  mov rdi, 0; deksryptor pliku klawiatura

  mov rsi, second    ; destination
  mov rdx, 2  ; ile wczytaj

  syscall

_parse_numbers:
  mov eax, [first]
  sub eax, '0'; parsuje pierwszy number odejmujac od niego 0

  mov edx, [second]
  sub edx, '0'

  add eax, edx ; dodwania numerków

  add eax, '0' ; konwertuje do ASCII
  mov [res], eax

_print:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write
  mov rdi, 1; rejestr rdi oznacza destination - ekran

  mov rsi, res    ; czytaj rezultat
  mov rdx, 1  ; 1 cyfrowy wynik

  syscall

_print_new_line:
  mov rax, 1 ;write
  mov rdi, 1 ;ekran
  mov rsi, endline
  mov rdx, 1 ;1 byte
  syscall

end:
  mov rax, 60
  syscall ; wyjdz


section .data
  prompt db "Podaj liczbe:", 0ah
  prompt_length equ $ - prompt

  prompt_sec db "Podaj druga liczbe:", 0ah
  prompt_sec_length equ $ - prompt_sec

  first db " ", 0ah
  second db " ", 0ah

  endline db "", 0ah

section .bss
  res: resb 1
