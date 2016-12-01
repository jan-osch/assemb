segment .data
segment .bss
segment .text

global	podatek
podatek:
shr rdi, 32			
movq xmm2, rdi		
movq rcx, xmm0		
shr rcx, 32			
movq xmm1, rcx		
subss xmm2, xmm0	
mulss xmm2, xmm1	
movss xmm0, xmm2
jmp return

return:
ret

