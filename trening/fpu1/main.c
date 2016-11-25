#include <stdio.h>

extern double square_root(double value, double precision);

int main() {
  double value, precision;

  printf("Enter value, precision: ");
  // scanf("%lf %lf", &value, &precision);
  value = 17;
  precision = 0.1;

  double result = square_root(value, precision);
  printf("result: %lf \n", result);
  return 0;
}
