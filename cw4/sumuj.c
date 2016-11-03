// Kompilacja i linkowanie na systemie 64 bitowym
//  gcc -m32 -c sumuj.c -o sumuj.o
//  nasm -felf suma.asm -o suma.o
//  gcc -m32 sumuj.o suma.o -o suma

#include <stdio.h>
extern int suma(int, int);
int main(){
   int a, b;

   printf("Podaj dwie liczby : ");
   scanf("%d%d",&a,&b);

   int c = suma(a, b);
   printf("\n Suma = %d \n", c);

   return 0;
}
