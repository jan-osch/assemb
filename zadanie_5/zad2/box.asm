 %define a dword [ebp+8]
 %define b dword [ebp+12]
 %define c dword [ebp+16]
 %define volume dword [ebp+20]
 %define area dword [ebp+24]

 segment .data
  two dw 2

 segment .text
 global prostopadloscian

 prostopadloscian:
   push ebp
   mov ebp, esp
   push ebx

  _compute_volume:
    fld a
    fld b
    fld c  ; stack: c, b, a
    fmulp st1 ; stack: c*b, a
    fmulp st1 ; stack: c*b*a

  _save_volume:
    mov ebx, volume
    fstp dword [ebx]

  _compute_area:
    fild word [two]
    fld a
    fld b
    fmulp st1
    fmulp st1 ; stack: 2*a*b

    fild word [two]
    fld c
    fld b
    fmulp st1
    fmulp st1
    fadd ; stack: 2*b*c + 2*a*b

    fild word [two]
    fld c
    fld a
    fmulp st1
    fmulp st1
    fadd ; stack: 2*a*c + 2*b*c + 2*a*b

  _save_area:
    mov ebx, area
    fstp dword [ebx]

 done:
  pop ebx
  mov esp, ebp
  pop ebp
  ret
