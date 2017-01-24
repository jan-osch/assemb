#!/bin/bash
PROGRAM_NAME="zad9_3"

nasm -felf64 -g $PROGRAM_NAME.asm -o $PROGRAM_NAME.o
g++ -c main.cpp -o main.o
g++ -g main.o $PROGRAM_NAME.o -o $PROGRAM_NAME
./$PROGRAM_NAME
rm main.o $PROGRAM_NAME.o $PROGRAM_NAME
rm dum.bmp
