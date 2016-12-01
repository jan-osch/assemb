;~ Zadanie 4
;~ Dla powyższego kodu w C++ napisz moduł assemblerowy 
;~ implementujący funkcje:

    ;~ float podatek(Faktura f) - zwracającą należny podatek według wzoru:  
    ;~ podatek= (obrót - podatekNaliczony) * stawkaPodatku
    ;~ void wypisz(const Faktura & f) - wypisującą na ekran napis przy 
    ;~ pomocy standardowej funkcji printf 
    ;~ printf("Faktura %d : obrot %f podatek %f\n", f.id, 
    ;~ f.obrot, podatek(f));

;~ Wskazówki:
;~ Obiekt klasy Faktura przekazywany do funkcji podatek przez wartość 
;~ zostanie pocięty na kawałki 8 bajtowe: pierwszy trafi do RDI, 
;~ drugi do XMM0. 
;~ Funkcja printf wymaga aby  

    ;~ standard ABI64 był przestrzegany, w szczególności: stos był 
    ;~ wyrównany,  w rejestrze RAX umieszczona była liczba argumentów 
    ;~ w rejestrach XMM
    ;~ liczby typu float były przekazane 
    ;~ jako double (konwersja np. cvtss2sd). 
    
segment .data

segment .bss

segment .text
        global	podatek
        
podatek:
		shr rdi, 32			;get obrot from higher 32bits
		movq xmm2, rdi		;put them into vector reg
		movq rcx, xmm0		;get 64bit podatek/stawka from vector
		shr rcx, 32			;get stawka from higher 32bits
		movq xmm1, rcx		;put it back into vector
		subss xmm2, xmm0	;subtract
		mulss xmm2, xmm1	;multiply
		movss xmm0, xmm2	;put result in xmm0
		
		jmp quit
		
quit:
		nop		
        ret

