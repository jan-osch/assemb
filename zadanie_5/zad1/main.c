// kod C w main.c, kod asemblerowy w quad.asm
// KOMPILACJA:
// gcc -m32 -o main.o -c main.c
// nasm -felf32 -o quad.o quad.asm
// gcc -m32 -o quad quad.o main.o

#include <stdio.h>

extern double wartosc(double a, double b, double  c, double d, double x);

int main()
{
    double a, b, c, d, x;

    printf("Enter a , b, c, d, x: ");
    scanf("%lf %lf %lf %lf %lf", &a, &b, &c, &d, &x);

    double result = wartosc(a,b,c,d,x);
    printf ("result: %lf \n", result);
    return 0;
}
