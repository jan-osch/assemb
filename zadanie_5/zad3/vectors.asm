%define size dword [ebp+8]

segment .text
global iloczyn_skalarny

iloczyn_skalarny:
  push ebp
  mov ebp, esp
  push ecx ; for index
  push ebx
  push eax
  push edx

_start:
  mov eax, [ebp+12]
  mov ebx, [ebp+16]
  fldz

  xor ecx, ecx ;index
  xor edx, edx ;rozmiar 12 bajtowy dorównane do rozmiaru ramki stosu przez kompilator C

  _pop_digit_pair:
    cmp ecx, size ; warunek stopu
    je done

    fld tword [eax + edx] ;UWAGA znalezienie tword zajęło mi 4 godziny czasu
    fld tword [ebx + edx]
    fmulp st1
    fadd

    inc ecx ;index++
    add edx, 12 ;skaczemy co 12 bajtów
    jmp _pop_digit_pair

done:
  pop edx
  pop eax
  pop ebx
  pop ecx
  mov esp, ebp
  pop ebp
  ret
