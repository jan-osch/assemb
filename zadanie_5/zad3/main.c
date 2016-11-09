#include <stdio.h>

extern long double iloczyn_skalarny(int n, long double *x, long double *y);

int main() {
  int MAX_ARRAY_SIZE = 256;
  long double x[MAX_ARRAY_SIZE];
  long double y[MAX_ARRAY_SIZE];

  int size;
  printf("Enter array size: ");
  scanf("%d", &size);

  int index = 0;
  while (index < size) {
    printf("Enter next digit of first array\n");
    scanf("%Lf", &x[index]);
    index++;
  }

  index = 0;
  while (index < size) {
    printf("Enter next digit of second array\n");
    scanf("%Lf", &y[index]);
    index++;
  }

  long double product = iloczyn_skalarny(size, x, y);
  printf("result: %.10Lg \n", product);

  return 0;
}
