#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -g -felf32 -o multiply.o multiply.asm
gcc -g -m32 -o multiply multiply.o main.o

./multiply #execute

rm main.o multiply.o multiply #cleanup
