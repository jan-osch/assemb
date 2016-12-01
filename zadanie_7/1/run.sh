#!/bin/bash
PROGRAM_NAME="iloczyn"

gcc -c main.c -o main.o
nasm -felf64 $PROGRAM_NAME.asm -o $PROGRAM_NAME.o
gcc main.o $PROGRAM_NAME.o -o $PROGRAM_NAME
./$PROGRAM_NAME
rm main.o $PROGRAM_NAME.o $PROGRAM_NAME
