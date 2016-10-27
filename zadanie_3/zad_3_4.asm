%include "asm64_io.inc"

section .data
s1 db "abcdefghijklmnopqrstuvwxyz", 0
s2 db "zyxwvutsrqponmlkjihgfedcba", 0

enter_message db "Podaj ciąg znaków: ", 0

section .bss

buffer times 255 resb 0

section .text
global asm_main
asm_main:
 enter 0,0

 mov rax, enter_message
 call println_string

 push buffer
 call read_line

 push s2
 push s1
 push buffer

 call encode_string

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret

; Function that reads a string terminated by \n
; Argument passing:
;
; dest - destination buffer
; RSP
read_line:
  push rax
  push rbx ; RSP -16

  xor rax, rax ; fast zero rax
  mov rbx, [rsp + 24] ;destination

  _read_next_character:
    call read_char

    cmp al, 0ah ;if currentChar == \n
    je _read_done ;then done

    mov [rbx], al
    inc rbx
    jmp _read_next_character

  _read_done:
    pop rbx
    pop rax

    ret 8

; Function that encodes string using S1 and S2
; Argument passing:
;
; dest - address of S2
; source - address of S1
; text - address of text to be encoded
; RSP
encode_string:
  push rax
  push rbx
  push rcx
  push rdx ; RSP - 32

  xor rax, rax ; reset
  mov rdx, [rsp + 40] ; subject text
  mov rbx, [rsp + 48] ; S1
  mov rcx, [rsp + 56] ; S2

  _encode_next_character:
    xor rax, rax ; fast reset

    mov al, 0
    cmp [rdx], al ; if currentChar == 0
    je _encode_done  ; then done

    mov al, [rdx] ; currentChar is in rax

    push rax ;currentChar
    push rbx ; find currentChar in S1
    call find_character ; now index of currentChar is in rax

    cmp rax, -1 ; if currentChar not found in S1
    je _encode_not_found

    mov al, [rcx + rax]
    jmp _encode_print_and_go_to_next

  _encode_not_found:
    mov al, [rdx] ; print original character

  _encode_print_and_go_to_next:
    call print_char
    inc rdx ; next character
    jmp _encode_next_character

  _encode_done:
    pop rdx
    pop rcx
    pop rbx
    pop rax ; RSP +32

    ret 24

; Function that finds a position of a 8-bit ASCII character in a string.
; If character is not found -1 is returned.
; Result will be in register rax.
; Argument passing:
;
; character - character to be found
; address - address of string to searched
; RSP
find_character:
  push rbx
  push rcx
  push rdx ; RSP - 24

  mov rbx, [rsp + 32] ; address
  mov rcx, [rsp + 40] ; character

  mov rax, 0 ; result
  xor rdx, rdx ; helper = 0

  _find_character_check_next:
    cmp [rbx + rax], dl ; if rbx == 0
    je _find_character_not_found ; then done

    cmp [rbx + rax ], cl ; if rbx == character
    je _find_character_done ;then found result

    inc rax
    jmp _find_character_check_next

  _find_character_not_found:
    mov rax, -1

  _find_character_done:
    pop rdx
    pop rcx
    pop rbx ; RSP +24

    ret 16
