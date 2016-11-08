#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -felf32 -o quad.o quad.asm
gcc -m32 -o quad quad.o main.o
./quad
