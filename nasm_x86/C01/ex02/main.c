#include <stdio.h>

extern void ft_swap(int*, int*);

int main()
{
	int a = 1;
	int b = 2;

	printf("Before, a: %i, b: %i\n", a, b);
	ft_swap(&a, &b);
	printf("After, a: %i, b: %i\n", a, b);

	return 0;
}
