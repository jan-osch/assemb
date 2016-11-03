;PISZ JAKO 32 bit

; Zadanie 3 użyj wskaźników
mov eax, [rsp +8]
mov eax, [rax] ; dereferencja wskaźnika

; Zadanie 4
; Zwracanie struktury
; Pod linuxem - pierwszy argument to wskaźnik gdzie ma umiescic
; pierwszy argument to wskaźnik na strukturę powrotu
; kolejność w C etykiet w sturkturze się liczy
; czyli
; dla struktury:
typedef struct{
    int max;
    int min;
} MM;

; należy umieścić max w pierwszej 32bit wartości pod wskaźnikiem
; min w drugiej
