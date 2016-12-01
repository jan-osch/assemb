// Kompilacja i linkowanie na systemie 64 bitowym
//  gcc  -c sumuj64.c -o sumuj64.o
//  nasm -felf64 suma64.asm -o suma64.o
//  gcc sumuj64.o suma64.o -o suma64

#include <stdio.h>
extern int iloczyn(int n, int *tab);

int main() {
  int len;
  printf("Podaj długość tablicy : ");
  scanf("%d", &len);

  int tab[len];
  for (int i = 0; i < len; i++) {
    printf("Podaj kolejny element tablicy: ");
    scanf("%d", &tab[i]);
  }

  int c = iloczyn(len, tab);
  printf("Iloczyn = %d \n", c);

  return 0;
}
