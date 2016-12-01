segment .text

; int suma(int a, int b)
; zwraca sumę a+b
/**
typedef struct {
  int a;
  int b;
} Dane;

*/

global suma
suma:
  ; rdi zawiera  dane.a,dane.b

  mov eax, edi   ; mov rax, [b]
  shr rdi, 32   ;;PRZESUNIECIE BITOWE 32 bit ;; ABY PRZEKAZAĆ STRUKTURE Dane


  add eax, edi   ; add rax, [a]
                 ; wynik jest juz w eax

  ret                ; powrót



;; OBLICZENIA NA JEDNOSTCE SSE
;;ZADANIA 2
;mamy dane
XMM0 a ;ma 128 bitów
XMM1 b
XMM2 x
RDI n

mul d xmm0, xmm2 ;(a*x) ; d oznacza ze na podówjnej precyzji zrobimy
