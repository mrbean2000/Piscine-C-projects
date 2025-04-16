#include <stdio.h>

extern void ft_ultimate_ft(int *********nbr);

int main()
{
	int i = 0;
	int *i1 = &i;
	int **i2 = &i1;
	int ***i3 = &i2;
	int ****i4 = &i3;
	int *****i5 = &i4;
	int ******i6 = &i5;
	int *******i7 = &i6;
	int ********i8 = &i7;
	int *********i9 = &i8;

	printf("Before: %i\n", *********i9);
	ft_ultimate_ft(i9);
	printf("After: %i\n", *********i9);
	return 0;
}
