#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -felf32 -o box.o box.asm
gcc -m32 -o box box.o main.o
./box
rm main.o box.o
