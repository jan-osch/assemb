// kod C w main.c, kod asemblerowy w quad.asm
// KOMPILACJA:
// gcc -m32 -o main.o -c main.c
// nasm -felf32 -o quad.o quad.asm
// gcc -m32 -o quad quad.o main.o

#include <stdio.h>

extern double oblicz(float a, float b, double x, int n);

int main() {
  double wynik = oblicz(-1, -1, 9, 6);
  printf("oblicz(-1, -1, 9, 6) = %lf\n", wynik); // -8.0

  double wyn = oblicz(2.0, -6.0, 0.5, 3);
  printf("oblicz(2.0, -6.0, 0.5, 3) = %lf\n", wyn); // -8.0
}
