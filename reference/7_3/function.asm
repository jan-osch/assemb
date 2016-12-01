segment .data
segment .bss
segment .text

global  iloczyn
iloczyn:		
cmp rdi,0
je if_zero
pop r10
push r9
push r8
push rcx
push rdx
push rsi		
mov rax, 1
mov rcx, 0
couting_loop:
	cmp rdi, 0
	je quit
	mul dword [rsp+rcx*8]
	dec rdi
	inc rcx
	jmp couting_loop	
quit:
push r10
ret
if_zero:
divsd xmm0, xmm0
ret
