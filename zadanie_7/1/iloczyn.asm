segment .text
global iloczyn

; rdi - array length
; rsi - array location
iloczyn:
  push rbp           ; zachowujemy starą wartość ebp
  mov rbp, rsp

  _prepare_registers:
    push rbx
    push rcx

  _prepare_helpers:
    mov eax, 1 ; result
    mov rcx, rdi ; counter

  _multiply:
    mov ebx, [rsi + rcx * 4 - 4]
    mul ebx
    loop _multiply

  _restore_registers:
    pop rcx
    pop rbx

  _exit:
    mov rsp, rbp       ; zwolnienie pamięci na stosie
    pop rbp            ; przywrócenie poprzedniej wartości ebp
    ret                ; powrót
