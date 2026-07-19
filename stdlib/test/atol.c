#include <stdlib.h>

int
main(void)
{
	if (atol("1234567890") != 1234567890L)
		return 1;
	if (atol("  -987654321") != -987654321L)
		return 2;
	return 0;
}
