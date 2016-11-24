# Rozwiązanie:

## Uruchomić program w debuggerze
`gdb debug64`

## Ustawić "smak" disassemblera
`set disassembly-flavor intel`

## Patrzymy jakie są funkcje

`info functions`

## Podejrzana funkcja
`_stop`

Czyli ustawiamy breakpoint `break _stop`

i uruchamiamy

`run`


## Rozkładamy na czynniki pierwsze:

`disassemble _stop`

## Analiza problemu
widzimy instrukcje
```
0x00000000004000b0 <+0>:	mov    eax,0x1
0x00000000004000b5 <+5>:	mov    edi,0x1
0x00000000004000ba <+10>:	mov    rsi,QWORD PTR ds:0x6000d8
0x00000000004000c2 <+18>:	mov    edx,0xd
0x00000000004000c7 <+23>:	syscall
```

Błąd jest w linijce
`mov    rsi,QWORD PTR ds:0x6000d8`

Prawdopodobnie zapis wyglądatak:

`mov rsi, [Hello]`

A powinno być

`mov rsi, Hello`

## rozwiązanie
Przechodzimy do kroku `0x00000000004000c2`

i ustawiamy:

`set $rsi=0x6000d8`
