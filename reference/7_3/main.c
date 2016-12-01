#include <stdio.h>
#include <stdlib.h>

extern int iloczyn(int n, ...);

int main(int argc, char **argv)
{
	int result = iloczyn(4, 3, 2, 2);
	printf("Iloczyn tablicy to: %d", result);
	return 0;
}

