segment .text

; int suma(int a, int b)
; zwraca sumÄ a+b
global suma
suma:
  push ebp           ; zachowujemy stara wartosc ebp
  mov ebp, esp

  sub esp, 4         ; przydzielamy pamiec na zmienna lokalna c
  mov eax, [ebp+8]   ; mov eax, [a]
  add eax, [ebp+12]  ; add eax, [b]
  mov [ebp-4], eax   ; mov [c], eax
                     ; wynik jest juz w eax

  mov esp, ebp       ; zwolnienie pamiÄci na stosie
  pop ebp            ; przywrĂłcenie poprzedniej wartoĹci ebp
  ret                ; powrót
