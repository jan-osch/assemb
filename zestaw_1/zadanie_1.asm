; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 hello.asm -o hello.o
; linkowanie: ld hello.o -o hello
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.

global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu

  mov     rax, 0          ; odczyt z pliku

  mov     rdi, 0          ; deskryptor pliku klawiatura
  mov     rsi, name       ; label zmiennej do ktorej piszemy.
  mov     rdx, length_name    ; dlugość tekstu do wyczytani
  syscall

  mov     rax, 1          ; numer funkcji systemowej:
                          ; 1=sys_write - zapisz do pliku
  mov     rdi, 1          ; numer pliku, do którego piszemy.
                          ; 1 = standardowe wyjście = ekran
  mov     rsi, greeting      ; RSI = adres tekstu
  mov     rdx, length_greeting    ; RDX = długość tekstu
  syscall                 ; wywołujemy funkcję systemową


  mov     rax, 1          ; numer funkcji systemowej:
                          ; 1=sys_write - zapisz do pliku
  mov     rdi, 1          ; numer pliku, do którego piszemy.
                          ; 1 = standardowe wyjście = ekran
  mov     rsi, name      ; RSI = adres tekstu
  mov     rdx, length_name    ; RDX = długość tekstu
  syscall                 ; wywołujemy funkcję systemową

  mov     rax, 60         ; numer funkcji systemowej
                          ; (60=sys_exit - wyjdź z programu)
  syscall                 ; wywołujemy funkcję systemową

section .data                   ; początek sekcji danych.
  greeting db "Welcome!", 0ah   ; napis powitalny
  length_greeting equ $ - greeting   ; długość napisu powitalnego
  name db "           "   ; miejsce na imie
  length_name equ $ - name   ; długość z imieniem ( po adresach)
