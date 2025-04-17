#include <stdio.h>

extern void ft_ultimate_div_mod(int*, int*);

int main()
{
	int a = 37, b = 8;

	printf("a: %i, b: %i, ", a, b);
	ft_ultimate_div_mod(&a, &b);
	printf("div: %i, mod: %i\n", a, b);

	return 0;
}
