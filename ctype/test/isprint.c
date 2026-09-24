#include <ctype.h>

int
main(void)
{
	if (!isprint(' '))
		return 1;
	if (!isprint('~'))
		return 2;
	if (!isprint('a'))
		return 3;
	if (isprint(0x1f))
		return 4;
	if (isprint(0x7f))
		return 5;
	if (isprint(-1))
		return 6;
	return 0;
}
