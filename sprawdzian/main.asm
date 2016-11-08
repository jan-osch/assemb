
; kompilacja: nasm -felf64 main.asm -o main.o
; linkowanie: ld main.o -o main


BITS 64

section .text
global _start
_start:
  mov     rax, 0
  mov     rdi, 0
  mov     rsi, tekst
  mov     edx, [dlugosc]
  syscall
  mov [dlugosc], eax
;  -------------------
; Napisz tutaj fragment kodu, który dla każdą wczytaną cyfrę zastąpi jej
; resztą z dzielenia przez 3. Reszta znaków powinna pozostać niezmieniona.
; Przykład.
; IN:  To jest 1 przyklad z 7. Tutaj 4==1 a 2!=9. 4753
; OUT: To jest 1 przyklad z 1. Tutaj 1==1 a 2!=0. 1120
;  -------------------
  mov ecx, 0 ; index

_check_is_complete:
  cmp ecx, [dlugosc]
  jge _done ; warunek stopu

_convert_next_digit:
  xor ax, ax ; do dzielenia będa brane 2 bajty
  mov al, [tekst + ecx]
  sub al, '0' ; konwersja na int

  cmp al, 0
  jl _go_to_next

  cmp al, 9
  jg _go_to_next

_change_to_remainer:
  xor dx, dx

  mov bl, 3
  div bl ; dzielenie 2 bajtowe

  add ah, '0'
  mov [tekst + ecx], ah

_go_to_next:
  inc ecx
  jmp _check_is_complete

_done:

;  -------------------
  mov     rax, 1
  mov     rdi, 1
  mov     rsi, tekst
  mov     edx, [dlugosc]
  syscall

  mov     rax, 60
  syscall

section .data                   ; początek sekcji danych.
  tekst times 500 db "X"
  dlugosc dd tekst-dlugosc
