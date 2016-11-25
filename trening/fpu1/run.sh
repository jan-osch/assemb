#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -felf32 -o sqrt.o sqrt.asm
gcc -m32 -o sqrt sqrt.o main.o
# ./sqrt
# rm main.o sqrt.o sqrt
