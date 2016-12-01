segment .text
 
; int suma(int a, int b)
; zwraca sumę a+b 
global suma
suma: 
  push rbp           ; zachowujemy starą wartość ebp
  mov rbp, rsp     
  
  sub rsp, 4     ; przydzielenie pamięci na zmienna lokalna c
                 ; troche sztuczne w tej funkcji
  
  mov eax, edi   ; mov rax, [a]
  add eax, esi   ; add rax, [b]     
  mov [rbp-4], eax   ; mov [c], eax
                     ; wynik jest juz w eax
  
  mov rsp, rbp       ; zwolnienie pamięci na stosie
  pop rbp            ; przywrócenie poprzedniej wartości ebp
  ret                ; powrót
