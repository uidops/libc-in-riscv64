#include <stdlib.h>

int
main(void)
{
	if (llabs(123456789012345LL) != 123456789012345LL)
		return 1;
	if (llabs(-123456789012345LL) != 123456789012345LL)
		return 2;
	return 0;
}
