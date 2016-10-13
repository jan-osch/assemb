#!/bin/bash
nasm -f elf64 "$1".asm  -o "$1".o;

gcc driver64.o asm64_io.o "$1".o  -o "$1"
  ./"$1";

rm "$1".o && \
  rm "$1"; #cleanup
