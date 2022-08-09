#include <stdlib.h>

int
main(void)
{
	if ((abs(0) == 0 && abs(-0xff) == 0xff) &&
		(abs(0x7f) == 0x7f && abs(-0xfffffff) == 0xfffffff))
		return 0;
	return 1;
}

