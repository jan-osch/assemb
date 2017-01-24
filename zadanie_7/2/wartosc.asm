segment .data
one   dq 1.0

segment .text
global wartosc

wartosc:
  push rbp
  mov rbp, rsp

  _prepare_registers:
    push rcx
    movsd xmm3, xmm0 ; save a
    movsd xmm0, [one] ; load 1 as result

  _get_n_and_check_0:
    mov rcx, rdi
    cmp ecx, 0
    je _restore_registers ; if 0 then any power is equal 1

  _prepare_inner_number:
    mulsd xmm3, xmm2 ; a*x
    addsd xmm3, xmm1 ; a*x + b
    movsd xmm1, xmm3 ; copy number

  _check_multiply_or_divide:
    cmp ecx, 0
    jl _divide ; if less than 0 then

  _multiply:
    mulsd xmm0, xmm1
    loop _multiply

    jmp _restore_registers

  _divide:
    cmp ecx, 0 ; cannot use loop
    je _restore_registers
    divsd xmm0, xmm1
    inc ecx
    jmp _divide

  _restore_registers:
    pop rcx

  _exit:
    mov rsp, rbp       ; zwolnienie pamięci na stosie
    pop rbp            ; przywrócenie poprzedniej wartości ebp
    ret                ; powrót
