#include <stdio.h>

extern int multiply(int size, int *firstElement);

int main() {
  int MAX_ARRAY_SIZE = 256;
  int elements[MAX_ARRAY_SIZE];
  int size;

  printf("Enter array size: ");
  scanf("%d", &size);

  for (int i = 0; i < size; i++) {
    printf("Enter next element: ");
    scanf("%d", &elements[i]);
  }

  int result = multiply(size, elements);

  printf("result: %d \n", result);

  return 0;
}
