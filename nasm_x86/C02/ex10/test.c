#include <string.h>
#include <stdio.h>

int	main()
{
	char *src = "Hello";
	char *dest;

	for (int i = 0; i < 10; i++)
	{
		int num = strlcpy(dest, src, i);
		printf("%i %s\n", num, dest);
	}

	return 0;
}
