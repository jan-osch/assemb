segment .data
MinusOne dw  -1
previous dd 0;
current dd 0;
difference dd 0;
two dd 2;

segment .text
global square_root

square_root:
  push ebp
  mov ebp, esp

_compare_with_zero:
  fldz ;; 0
  fld qword [ebp+8] ;; value, 0

  fcom
  jb _incorrenct_data

_compute_delta: ;; current, previous
  fst qword [current]
  fxch st1 ;; previous, current
  fst qword [previous]
  fxch st1 ;; curent, previous
  fld qword [current] ;; current, current, previous

  fmul ;; current^2, previous

  fld qword [ebp+8] ;; value, current^2
  fsub ;; value - current^2
  fst qword [difference]
  fabs ;; abs(value - current^2)
  fld qword [ebp+12] ;; precision, abs(value - current^2)

  fcomp ;; abs(value - current^2)
  ja _found_result

_compute_next_step:
  fldz ;; 0, abs(value - current^2)
  fmul ;; 0
  ffree st0;;
  fld qword [difference] ;; difference

  fcomp
  jb _make_smaller

_make_bigger:

  fld qword [current] ;; current
  fld qword [current] ;; current, current
  fld qword [ebp+12] ;; value, current, current
  fsub ;; (value-current), current
  fld qword [two] ;; 2, (value-current), current
  fdivp st1 ;; ((value-current)/2), current
  fld qword [current] ;; current, ((value-current)/2), current
  fadd ;; (current+((value-current)/2)), current
  jmp _compute_delta

_make_smaller:
  fld qword [current] ;; current
  fld qword [previous] ;; previous, current;
  fld qword [current] ;; current, previous, current;
  fsub ;; (current - previous), current
  fld qword [two] ;; 2, (current - previous), current
  fdivp st1  ;; ((current - previous)/2), current

  fld qword [current] ;; current, ((current - previous)/2), current
  fsub ;; (current -((current - previous)/2)), current
  jmp _compute_delta

_found_result:
  fld qword [current]
  jmp done

_incorrenct_data:
  fild word [MinusOne]

done:
  mov esp, ebp
  pop ebp
  ret
