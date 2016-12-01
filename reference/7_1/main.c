#include <stdio.h>
#include <stdlib.h>

extern int iloczyn(int N, int* arr);

int main(int argc, char **argv)
{
	int N = 0;
	printf("Podaj ilosc elementow: ");
	scanf("%d", &N);
	int tmp = 0;
int i ;
	int* arr = malloc(sizeof(int) * N);
	for( i = 0; i < N; i++){		
		printf("Podaj nowy element: ");
		scanf("%d", &tmp);
		arr[i] = tmp;
	}		
	//~ int c = &arr;
	//~ printf("%d",c);
	int result = iloczyn(N, arr);
	printf("Iloczyn tablicy to: %d", result);
	return 0;
}

