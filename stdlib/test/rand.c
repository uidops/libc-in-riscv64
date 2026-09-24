#include <stdlib.h>

int
main(void)
{
	int a, b;

	srand(1);
	a = rand();
	b = rand();
	if (a != 16838)
		return 1;
	if (b != 5758)
		return 2;

	/* same seed, same sequence */
	srand(1);
	if (rand() != a || rand() != b)
		return 3;

	/* different seed, different sequence */
	srand(42);
	if (rand() != 19081)
		return 4;

	/* always in the range [0, 32767] */
	srand(0);
	a = rand();
	if (a < 0 || a > 32767)
		return 5;
	return 0;
}
