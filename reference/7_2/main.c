#include <stdio.h>
#include <stdlib.h>

extern double wartosc(double a, double b, double x, int n);

int main(int argc, char **argv)
{
	
	double result = wartosc(4, 3, 2, 2);
	printf("Wartosc to: %f", result);
	return 0;
}

