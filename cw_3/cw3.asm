tab1 times 100 db 1       ; kolejne bajty to 1,1,1,1,1,1,1,1,...
tab2 times  50 dw 1       ;                  1,0,1,0,1,0,1,0,...
; dlatego że 1 na dwóch bajtach to 0 1
; czytamy od lewej do prawej

mov eax, 0   ;zerowanie
xor eax, eax ;zerowanie super szybkie fancy


;; LOAD effective address
lea rdx, [rbx + 2*rcx -2] ; przypisuje do rejestru rdx adres komórki
; jest szybsze



;STOS
push rbp
push rax
push rbx

;to jest to samo
sub rsp, 24 ; obniżamy rsp w dół o 24 bajty
mov [rsp+16], rbp ; 8 bajtów
mov [rsp+8], rax ; 8 bajtów
mov [rsp], rbx ; 8 bajtów

; call

call ;  zapisuje RIP  czyli rejestr z następna instrukcja na stos
; RIP to adres powrotu

;call robi:
push rip
jmp etykieta ; skacze pod etykiete

;ret ;robi
pop rip

;ENTER i leave
enter rozmiar, 0 ;alokuje na stosie rozmiar bajtów
;ekwiwalent:
push rbp
mov rbp, rsp
sub rsp, rozmiar

leave ; przywraca ramkę stosu
;ekwiwalent
mov rsp, rbp
pop rbp


;RAMKA
int suma (int a, int b)
;konwencja jest taka że najpierw wrzucamy b a potem a na stos

; RET
ret 16
;ekwiwalent
pop rip ; następna instrukcja
add rsp, 16 ; przesuwamy o 16 zaalokowanych


; WYNIK funkcji
;zazwyczaj w rax

; zadanie 1 pamietaj o porównywaniu eax

;zadanie 3
; konwersja na liczbe
; wskazówka eax * 10 + [eax]- '0'
; każ funkcji wywołujej przygotowac bufor w ktorym zwracamy wynik
