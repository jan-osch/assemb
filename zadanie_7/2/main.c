// Kompilacja i linkowanie na systemie 64 bitowym
//  gcc  -c sumuj64.c -o sumuj64.o
//  nasm -felf64 suma64.asm -o suma64.o
//  gcc sumuj64.o suma64.o -o suma64

#include <stdio.h>
extern double wartosc(double a, double b, double x, int n);

int main() {
  double c = wartosc(4, 3, 2, -2);
  printf("Wartosc = %lf\n", c);

  return 0;
}
