
%define a dword [ebp+8]
%define b dword [ebp+12]
%define x qword [ebp+16]
%define n dword [ebp+24]

segment .text
global oblicz

oblicz:
 push ebp
 mov ebp, esp

 mov ecx, n ; n times ; zakładamy że jest wykładnik dodatni
 fld1 ;stack: 1 ; początkowa wartość

_iterate: ;stack: previous
  fld b ;stack: b, previous
  fld x ;stack: x, b, previous
  fmulp st1 ;stack: b*x, previous

  fld a ;stack: a, b*x, previous
  fld x ;stack: x, a, b*x, previous
  fmulp st1 ;stack: a*x, b*x, previous

  fadd ;stack: (a*x + b*x), previous
  fmulp st1 ; stack: ((a*x + b*x) * previous)

  loop _iterate

; wynik jest w st0 - zgodnie ze standardem

done:
  mov esp, ebp
  pop ebp
  ret
