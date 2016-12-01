all: main

main: iloczyno maino
	gcc -o iloczyn iloczyn.o main.o
	
maino: main.c
	gcc -o main.o -c main.c
	
iloczyno: iloczyn.asm
	nasm -felf64 -o iloczyn.o iloczyn.asm
