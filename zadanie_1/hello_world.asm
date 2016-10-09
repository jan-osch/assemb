section .text


global _start

_start:
  mov rax, 1; rejestr rax oznacza numer funkcji systemowej 1 oznacza write

  mov rdi, 1; rejestr rdi oznacza destination dla najbliższego sys calla
            ; 1 oznacza ekran

  mov rsi, text    ; co czytaj
  mov rdx, length  ; ile czytaj

  syscall

end:
  mov rax, 60
  syscall ; wyjdz


section .data
  text db "Hello world!", 0ah
  length equ $ - text
