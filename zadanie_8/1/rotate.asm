segment .data
  one   dq 1.0

segment .text
  global _Z6rotateji ;extern unsigned int rotate(unsigned int x, int n = 1)
  global _Z6rotatehi  ;extern unsigned char rotate(unsigned char x, int n = 1);

_Z6rotateji:
  enter 0, 0

  _int_rotation:
    mov rax, rdi ; n
    mov rcx, rsi ; x
    ror eax, cl ;rotation of 32 bit int

  _int_rotation_done:
    leave
    ret

_Z6rotatehi:
  enter 0, 0

  _char_rotation:
    mov rax, rdi ; n
    mov rcx, rsi ; x
    ror al, cl

  _char_rotation_done:
    leave
    ret
