section .text

global _start

_start:
  mov ecx, -1

loop_start:
  call say_first ; wykonaj pracę

  dec ecx ; exc--

  cmp ecx, 0 ; sprawdz czy jest większy od zera
  ja loop_start ; jeżeli jest większe od zer

end:
  mov rax, 60
  syscall ; wyjdz


section .functions

say_first:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; na ekran

  mov rsi, text    ; co czytaj
  mov rdx, length  ; ile czytaj

  syscall
  ret

section .data
  text db "Nie będę więcej pisać kłamst", 0ah
  length equ $ - text
