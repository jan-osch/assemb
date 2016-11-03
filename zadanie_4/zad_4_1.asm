
section .text

extern scanf          ; definicja funkcji printf znajduje się w bibliotece standardowej C
extern printf          ; definicja funkcji printf znajduje się w bibliotece standardowej C

global main
main:                  ; punkt wejścia - funkcja main
  enter 0, 0

  push dword napis  ;rsp -4
  call printf

  push dword druga ; rsp -8
  push dword pierwsza ; rsp -8
  push dword format ; rsp -12
  call scanf

  xor edx, edx ; konkatenacja

  mov eax, [pierwsza]
  mov ebx, [druga]  ;wlasciwe dodawnia
  div ebx

  push eax ; rsp -16
  push dword format_wynik ; rsp -20
  call printf

  add    esp, 20         ; posprzątanie stosu - rejestr ESP wskazuje to samo, co przed wywołaniem

  xor    eax, eax         ; return 0;
  leave
  ret                     ; wyjście z programu

section .data

  napis: db "Podaj dwie liczby calkowite oddzielone spacja", 10, 0
  format: db "%d %d", 0
  format_wynik: db "wynik %d", 10, 0 ; printf oczekuje double

section .bss
  pierwsza: resb 4
  druga: resb 4
