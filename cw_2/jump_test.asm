section .text


global _start

_start:
  mov eax, 2
  call square

  cmp eax, 25
  jge if_true ;if true

  call say_second ; else
  jmp cmp_done

if_true:
  call say_first
  jmp cmp_done

cmp_done:

end:
  mov rax, 60
  syscall ; wyjdz


section .functions

say_first:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
  ; 1 oznacza ekran

  mov rsi, text    ; co czytaj
  mov rdx, length  ; ile czytaj

  syscall
  ret

say_second:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
  ; 1 oznacza ekran

  mov rsi, text_2    ; co czytaj
  mov rdx, length_2  ; ile czytaj

  syscall
  ret

square:
  imul eax, eax
  ret

section .data
  text db "Is greater or equal to", 0ah
  length equ $ - text

  text_2 db "Is not", 0ah
  length_2 equ $ - text
