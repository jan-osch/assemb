segment .text
  global sort

sort:
    push ebp
    mov ebp, esp
    push eax
    push ebx;
    push ecx;

_fix_first:
   mov ecx, [ebp+8]
   mov eax, [ecx]
   mov ecx, [ebp+12]
   mov ebx, [ecx]

   cmp eax, ebx
   jge _fix_second ; if a > b

   mov eax, [ebp+8]  ;swap
   mov ebx, [ebp+12]
   mov [ebp+8],  ebx
   mov [ebp+12], eax

_fix_second:
  mov ecx, [ebp+12]
  mov eax, [ecx]
  mov ecx, [ebp+16]
  mov ebx, [ecx]

  cmp eax, ebx
  jge _fix_first_again

  mov eax, [ebp+12]  ;swap
  mov ebx, [ebp+16]
  mov [ebp+12], ebx
  mov [ebp+16], eax

_fix_first_again:
  mov ecx, [ebp+8]
  mov eax, [ecx]
  mov ecx, [ebp+12]
  mov ebx, [ecx]

  cmp eax, ebx
  jge done

  mov eax, [ebp+8]  ;swap
  mov ebx, [ebp+12]
  mov [ebp+8], ebx
  mov [ebp+12], eax



done:
  mov [ebp+8], dword 4
  mov [ebp+12], dword 4
  mov [ebp+16], dword 4

  pop ecx;
  pop ebx;
  pop eax;

  mov esp, ebp
  pop ebp
  ret
