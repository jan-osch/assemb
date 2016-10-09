section .text

global _start

_start: ; read system time
    mov rax, 201
    syscall
    mov [systime], rax

_print_time:
  mov rax, 1; sys read
  mov rdi, 1; ekran

  mov rsi, systime    ; co czytaj
  mov rdx, 10  ; ile czytaj
  syscall

end:
    mov rax, 60 ; sys_exit
    syscall

section .data
  systime times 32 db 0
