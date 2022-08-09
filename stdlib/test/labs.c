#include <stdlib.h>

int
main(void)
{
	if ((labs(0) == 0 && labs(-0xff) == 0xff) &&
		(labs(-0x7fffffffffffffff) == 0x7fffffffffffffff &&
		 labs(0xfffffffffffffff) == 0xfffffffffffffff))
		return 0;
	return 1;
}

