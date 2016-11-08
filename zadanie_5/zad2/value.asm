
; funkcja wartosc
; Zwraca wartość dla równania
; a*x^3 + b*x^2 + c*x +d
; prototyp C:
; double wartosc(double a, double b, double  c, double d, double x);
; Parametry:
; a, b,c, d - współczynniki równania
; x - wartość x
; Wartość zwracana:
; wynik równania

 %define a qword [ebp+8]
 %define b qword [ebp+16]
 %define c qword [ebp+24]
 %define d qword [ebp+32]
 %define x qword [ebp+40]

 segment .text
 global wartosc

 wartosc:
   push ebp
   mov ebp, esp

  _load_stack:
    fld d
    fld x
    fld c  ; stack: c, x, d
    fmulp st1 ; stack: c*x, d
    fadd ; stack: c*x+d

    fld x
    fld x
    fld b   ; stack: b, x, x, c*x+d
    fmulp st1 ; stack: b*x, x, c*x+d
    fmulp st1 ; stack: b*x^2, c*x+d
    fadd ; stack: b*x^2 + c*x+d

    fld x
    fld x
    fld x
    fld a ; stack: a, x, x, x, b*x^2 + c*x+d
    fmulp st1 ; stack: a*x, x, x, b*x^2 + c*x+d
    fmulp st1 ; stack: a*x^2, x, b*x^2 + c*x+d
    fmulp st1 ; stack: a*x^3, b*x^2 + c*x+d
    fadd ; stack: a*x^3 +b*x^2 + c*x+d

 done:
  mov esp, ebp
  pop ebp
  ret
