section .text


global _start

_start: ;zapytaj o imię
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
            ; 1 oznacza ekran

  mov rsi, prompt    ; co czytaj
  mov rdx, prompt_length  ; ile czytaj

  syscall

_load_name:
  mov rax, 0; systemowe read

  mov rdi, 0; deksryptor pliku klawiatura

  mov rsi, name    ; destination
  mov rdx, name_length  ; ile wczytaj

  syscall


_print_hello:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
            ; 1 oznacza ekran

  mov rsi, hello    ; co czytaj
  mov rdx, hello_length  ; ile czytaj

  syscall

_print_name:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
            ; 1 oznacza ekran

  mov rsi, name    ; co czytaj
  mov rdx, name_length  ; ile czytaj

  syscall

end:
  mov rax, 60
  syscall ; wyjdz


section .data
  prompt db "Podaj imię:", 0ah
  prompt_length equ $ - prompt

  hello db "Witaj "
  hello_length equ $ - hello

  name db "                ", 0ah
  name_length equ $ - name
