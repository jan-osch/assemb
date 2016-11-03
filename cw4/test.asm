;KOMPILACJA:  plik źródłowy c_asm.asm
;nasm -o c_asm.obj -felf32 c_asm.asm
;gcc -m32 c_asm.obj -o c_asm

section .text



extern printf          ; definicja funkcji printf znajduje się w bibliotece standardowej C


global main
main:                  ; punkt wejścia - funkcja main
enter 0, 0
                        ; printf("Liczba jeden to: %d\n", 1);
push   dword 42192903          ; drugi argument
push   dword napis      ; pierwszy argument - UWAGA na właściwą kolejność argumentów wołanej funkcji
                        ; pierwszy argument funkcji dodajemy na stos jako ostatni!!!

call   printf          ; uruchomienie funkcji
add    esp, 2*4         ; posprzątanie stosu - rejestr ESP wskazuje to samo, co przed wywołaniem
                        ; funkcji printf

xor    eax, eax         ; return 0;
leave
ret                     ; wyjście z programu

section .data

napis: db "Liczba jeden to: %d", 10, 0
