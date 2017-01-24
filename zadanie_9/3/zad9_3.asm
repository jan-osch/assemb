
;~ Prototyp:

;~ void scaleSSE(float * out,float *in,int N);

segment .data
	fours dd 4.0,4.0,4.0,4.0
segment .bss

segment .text
  global	scaleSSE

scaleSSE:
		mov rax, rdx
		mov r9,  rdx

		and rax, -3
		mov rcx, -4

_loop:
		add rcx, 4 ; skaczemy co 4 bajty
		cmp rcx, rax
		je _done

		mov r8, rcx					;i
		imul r8, 4					;mul by 4. because bytes
		imul r8, 2					;mul i by 2 because scale is further
		movups xmm0, [rsi+r8]		;get upper row A B
		movups xmm2, [rsi+r8+16]	;get upper row C D
		mov r8, rcx					;get iterator val

    imul r8, 2					;mul i by 2 because scale is further
		add r8, r9					;add the row width go get row below
		imul r8, 4					;mul by 4. because bytes

    movups xmm3, [rsi+r8+16]    ; C i D
		movups xmm1, [rsi+r8]		;A i B
		haddps xmm0, xmm2
		haddps xmm1, xmm3
		addps xmm0, xmm1
		movups xmm1, [fours]
		divps xmm0, xmm1
		movups [rdi+rcx*4], xmm0  	;write to output

    jmp _loop

_done:
		xor rax, rax
    ret
