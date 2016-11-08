#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -felf32 -o value.o value.asm
gcc -m32 -o value value.o main.o
./value
rm main.o value.o
