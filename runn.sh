#!/bin/bash
nasm -felf64 "$1".asm -o "$1".o && ld -m elf_x86_64  "$1".o -o "$1" && ./"$1";
rm "$1".o;
rm "$1";
