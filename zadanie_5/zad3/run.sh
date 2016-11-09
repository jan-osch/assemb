#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -felf32 -o vectors.o vectors.asm
gcc -m32 -o vectors vectors.o main.o
./vectors;

rm main.o vectors.o
