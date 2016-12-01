#!/bin/bash

gcc  -c sumuj64.c -o sumuj64.o
nasm -felf64 suma64.asm -o suma64.o
gcc sumuj64.o suma64.o -o suma64
