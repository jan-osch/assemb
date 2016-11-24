#include <stdio.h>

extern void sort(int *a, int *b, int *c);

int main() {
  int a, b, c;
  printf("Enter a b c: ");
  scanf("%d %d %d", &a, &b, &c);

  sort(&a, &b, &c);

  printf("result: %d %d %d\n", a, b, c);

  return 0;
}
