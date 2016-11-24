


; KROK 1: ustawiamy breakpoint na main
; KROK 2: oglądamy co tam jest wywoływane


; KROK 3: oglądamy funkcje check
;; Podejrzana funkcja check
;; hasło jest w rax

push   rbp
mov    rbp,rsp
mov    [rbp-18],rdi
mov    [rbp-4], 0
jmp    _step

_entry:
  mov    rax,[rbp -18]
  lea    rdx,[rax +1]
  mov    [rbp -18], rdx
  movzx  eax, [rax]
  movsx  eax, al
  add    [rbp-4], eax

_step:
  mov    rax, [rbp-18]
  movzx  eax, [rax]
  test   al, al
  jne    _entry

cmp    [rbp-4], 0x2ad ; decimal 685
sete   al
movzx  eax,al
pop    rbp
ret

;; Niestety funkcja jest nieczytelna

;; KROK 4
;; oglądamy funkcje top_secret
;; jest to wywołanie syscall który coś wypisze na ekran

;; KROK 5 podglądamy adres:

`x/s 0x4a0c48`

;; Tajna informacja
;; "TOP SECRET\n----------\nPuk puk.\n- Kto tam?\n(d\305\202uga cisza)\n- Java.\n\nPuk puk.\n- Kto tam?\n- C++.\n\nPuk puk.\n- Assembler."
