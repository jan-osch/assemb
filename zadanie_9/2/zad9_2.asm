section .data

section .bss

section .text

global gradientSSE

; rdi - grad
; rsi - data
; rdx - n
gradientSSE:
  push	rbp
  mov	rbp, rsp
  xor rax, rax

  mov rax, rdx ;n
  sub rax, 2   ;n-2

  and rax, -3
  xor rcx, rcx

  ;grad[i] = sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2)
  _main_loop:
    movups xmm0, [rsi + rcx*4 + 4] ;data[i+1] right px
    movups xmm1, [rsi + rcx*4 - 4] ;data[i-1] left px
    subps xmm0, xmm1 ;xmm0-xmm1
    mulps xmm0, xmm0 ;xmm0^2

    xor r8, r8  ; r8 = 0
    mov r8, rcx ;i
    xor r9, r9
    mov r9, rcx
    add r8, rdx ;i+n
    sub r9, rdx ;i-n

    movups xmm1, [rsi + r8*4] ;data[i+n]
    movups xmm2, [rsi + r9*4] ;data[i-n]
    subps xmm1, xmm2
    mulps xmm1, xmm1
    addps xmm0, xmm1
    sqrtps xmm0, xmm0
    movups [rdi + rcx*4], xmm0

    inc rcx;i++
    cmp rcx, rax
    jl _main_loop ;if rcx<n-2

  _end:
    xor rax, rax
    leave
    ret
