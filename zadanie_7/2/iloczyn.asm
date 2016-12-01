segment .text
global iloczyn

; rdi - array length
; rsi - array location
iloczyn:
  pop r10 ;return address

  _prepare_registers:
    push r9  ; +56
    push r8  ; +48
    push rcx ; +40
    push rdx ; +32
    push rsi ; +24 - first element

    push rbx ; +16
    push rcx ; +8

  _prepare_helpers:
    mov eax, 1 ; result
    mov rcx, rdi ; counter

  _multiply:
    mov ebx, [rsp +rcx*8 +8] ; -8 + 16
    mul ebx
    loop _multiply

  _pik:
    pop rcx
    pop rbx

  _exit:
    push r10
    ret 56
