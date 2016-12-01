segment .data
segment .bss
segment .text

global  wartosc
wartosc:
cmp rdi,0
je if_zero
mulsd xmm0, xmm2
addsd xmm0, xmm1        
movsd xmm1, xmm0
counting_loop:
	dec rdi
	cmp rdi, 0
	je return			
	mulsd xmm0, xmm1
	jmp counting_loop
return:
    ret

if_zero:
	divsd xmm0, xmm0
	ret
