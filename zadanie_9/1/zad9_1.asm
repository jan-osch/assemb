section .data

section .bss

section .text

global diff ; void diff(char *out,char *wiersz1,char *wiersz2,int n);

;rdi - out
;rsi - row1
;rdx - row2
;rcx - n
diff:
  _prepare_registers:
    xor rax, rax ; prepare
    xor r8, r8

    mov rax, rcx
    mov r8, rcx ;count
    mov rcx, 0

  _loop:
    movdqu xmm0, [rsi+rcx] ;row1
    movdqu xmm1, [rdx+rcx] ;row2
    psubb xmm0, xmm1 ;w1[x] - w2[x]

    movdqu [rdi+rcx], xmm0
    add rcx, 16 ;repeat

    cmp rcx, rax
    jl _loop

  _done:
    xor rax, rax
    ret
