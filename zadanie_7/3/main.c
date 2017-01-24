// Kompilacja i linkowanie na systemie 64 bitowym
//  gcc  -c sumuj64.c -o sumuj64.o
//  nasm -felf64 suma64.asm -o suma64.o
//  gcc sumuj64.o suma64.o -o suma64

#include <stdio.h>
extern int iloczyn(int n, ...);

int main() {
  int c = iloczyn(10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10); // 30
  printf("Iloczyn = %d \n", c);

  return 0;
}
