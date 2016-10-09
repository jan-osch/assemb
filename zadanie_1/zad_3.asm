section .text

global _start

_start: ; open file
    mov rax, 2
    mov rdi, file_name
    mov rsi, 0102 ; Create + Write
    mov rdx, 02000 ; suid
    syscall

_write_content:
    mov [fd], rax ; FD = file descriptor
    mov rax, 1
    mov rdi, [fd]
    mov rsi, text
    mov rdx, text_len
    syscall

_close_file:
    mov rax, 3
    mov rdi, fd
    syscall

end:
    mov rax, 60 ; sys_exit
    syscall

section .data
    fd times 10 db 0
    file_name db "plik.txt", 0

    text db "Zupełnie losowy tekst", 0ah
    text_len equ $ - text
