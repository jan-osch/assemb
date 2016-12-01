segment .data
	texta db 'Faktura %d :Obrut %f Podatek %f',0,13
segment .bss
	
segment .text
        extern	podatek
        extern printf
        global	wypisz
wypisz:
push rbp			
mov r10, rdi			
mov rcx, [r10]			
mov rdi, rcx			
mov rcx, [r10+8]		
movq xmm0, rcx			
call podatek			
movss xmm1, xmm0		
mov rdi, texta			
mov rdx, [r10]			
mov rsi, 0				
mov esi, edx	 	
shr rdx, 32				
movq xmm0, rdx			
mov rax, 2				
cvtss2sd xmm0, xmm0		
cvtss2sd xmm1, xmm1
call printf
pop rbp
jmp quit
quit:
nop		
ret

