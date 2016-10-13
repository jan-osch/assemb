%include "asm64_io.inc"

segment .data
;
; dane zainicjalizowane
;

text db "Nie będę więcej pisać kłamst", 0

segment .bss
;
; dane niezainicjalizowane
;

segment .text
global asm_main
asm_main:
 enter 0,0

; ----
; Właściwy kod wstawiamy tu.
; Nie należy modyfikować kodu przed i po tym komentarzu

mov ecx, 256

mov eax, text ; przenies tekst który będzie printowany
loop_start:
  call print_string
  call print_nl
  dec ecx ; exc--

  cmp ecx, 0 ; sprawdz czy jest większy od zera
  ja loop_start ; jeżeli jest większe od zer

; ---

mov rax, 0 ; kod zwracany z funkcji
leave
ret
