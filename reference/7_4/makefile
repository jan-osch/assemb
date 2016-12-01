all: main

main: podateko wypiszo maino
	gcc -m64 -o main podatek.o wypisz.o main.o
	
maino: main.cpp
	gcc -m64 -o main.o -c main.cpp
	
podateko: podatek.asm
	nasm -felf64 -o podatek.o podatek.asm

wypiszo: wypisz.asm
	nasm -felf64 -o wypisz.o wypisz.asm
