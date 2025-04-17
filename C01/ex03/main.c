#include <stdio.h>

extern void ft_div_mod(int, int, int*, int*);

int main()
{
	int a, b, div, mod;

	a = 37;
	b = 8;

	div = 0;
	mod = 0;

	ft_div_mod(a, b, &div, &mod);
	printf("a: %i, b: %i, div: %i, mod: %i\n", a, b, div, mod);

	return 0;
}
