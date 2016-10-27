%include "asm64_io.inc"

section .data
parse db "2020000", 0
stringify_result db "          ", 0

section .bss

section .text
global asm_main
asm_main:
 enter 0,0

 ;stringify_number demo
 push stringify_result
 mov rax, -120123000
 push rax

 call stringify_number
 mov rax, stringify_result
 call print_string

 ;parse_number demo
 call print_nl
 push parse
 call parse_number

 call print_int

end_program:
  call print_nl ; na koniec by nie zlewało się z promptem
  mov rax, 0 ; kod zwracany z funkcji
  leave
  ret

; Function that parses a 64 bit number from a string.
; Result will be in register rax.
; Argument passing:
;
; address - address of string to be parsed
; RSP
;
parse_number:
  mov rbx, [rsp + 8] ; value of the number to be parsed

  xor rax, rax ; result = 0
  xor rdx, rdx ; helper = 0
  xor rcx, rcx ; digit = 0

  _parnum_check_sign:
    mov dl, "-"
    cmp [rbx], dl
    je _parnum_found_negative

    push 1 ; store information that found a positive number
    jmp _parnum_start_parsing

  _parnum_found_negative:
    push 0 ; store information that found non positive number
    inc rbx

  _parnum_start_parsing:
    mov al, [rbx]
    sub al, '0' ; rax is now first digit of the number
    inc rbx

  _parnum_parse_next_digit:
    mov dl, 0
    cmp [rbx], dl ;rbx is address of currentChar
    je _parnum_fix_sign ; if currentChar == 0 then fix numbers

    mov dl, 10
    mul rdx ; result *= 10

    mov cl, [rbx] ; cl is currentChar
    add rax, rcx ; result += currentChar
    sub rax, '0' ; currentChar to digit

    inc rbx

    jmp _parnum_parse_next_digit

  _parnum_fix_sign:
    pop rdx;
    cmp dl, 1 ; number is positive, no need for changing sign
    je _parnum_done

    imul rax, -1 ; inverse sign

  _parnum_done:
    ret 8


; Function that changes given number, with sign, to a string
; Argument passing:
;
; address - address of the result buffer
; number - signed int subject to be parsed
; RSP
;
stringify_number:
  mov rax, [rsp + 8] ; value of the number to be parsed
  mov rcx, [rsp + 16] ; address of result

  xor rbx, rbx ; zero out helper registers
  xor rdx, rdx ; quick zero

  push 0 ; zero that finishes the string

  _strnum_check_sign:
    cmp rax, 0
    jge _strnum_start_parsing ; if number is positive

    mov rbx, "-" ; number is negative, first character must be a minus sign
    mov [rcx], rbx

    inc rcx
    imul rax, rax, -1 ; make sign positive

  _strnum_start_parsing:
    mov rbx, 10 ; again divisor must be zero

  _strnum_parse_next_digit:
    cmp rax, 0
    jle _strnum_pop_string ; if remainder is less than 0 it means should be next phase

    div rbx ; now rdx should be remainder from division

    add dx, '0' ; convert to ASCII code

    push rdx
    xor rdx, rdx

    jmp _strnum_parse_next_digit

  _strnum_pop_string:
    xor rdx, rdx ; quick zero, it will be used as an index

  _strnum_pop_digit:
    pop rbx
    cmp rbx, 0
    je _strnum_done ; while rbx != 0

    mov [rcx + rdx], rbx ; put next character to the result
    inc rdx

    jmp _strnum_pop_digit

  _strnum_done:
    ret 16
