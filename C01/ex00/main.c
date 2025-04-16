#include <stdio.h>

extern void ft_ft(int *);

int main()
{
	int i = 0;

	printf("Before: %i\n", i);
	ft_ft(&i);
	printf("After: %i\n", i);

	return 0;
}
