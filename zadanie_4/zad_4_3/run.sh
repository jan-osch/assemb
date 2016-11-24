#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -g -felf32 -o sort.o sort.asm
gcc -g -m32 -o sort sort.o main.o

./sort #execute

rm main.o sort.o sort #cleanup
