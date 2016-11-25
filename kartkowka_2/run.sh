#!/bin/bash
gcc -m32 -o main.o -c main.c
nasm -felf32 -o modul.o modul.asm
gcc -m32 -o modul modul.o main.o
./modul
rm main.o modul.o modul
