segment .text
  global multiply

multiply:
 push ebp
 mov ebp, esp

 push ecx ; will be used
 push ebx

 mov ecx, [ebp+8] ;size
 mov ebx, [ebp+12] ;address
 mov eax, 1 ; result

_multiply_next:
  imul eax, dword [ebx + ecx*4 -4]

loop _multiply_next

done:
  pop ebx ;restore
  pop ecx

  mov esp, ebp
  pop ebp
  ret
