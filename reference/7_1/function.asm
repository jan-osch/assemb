segment .data

segment .bss

segment .text
global  iloczyn
iloczyn:
mov rax, 1
mov rcx, 0
counting_loop:
	cmp rdi, 0
	je return
	imul dword [rsi+rcx*4]
	dec rdi
	inc rcx
	jmp counting_loop
return:
        ret
