#include <ctype.h>

int
main(void)
{
	if (!iscntrl('\n'))
		return 1;
	if (!iscntrl('\0'))
		return 2;
	if (!iscntrl(0x7f))
		return 3;
	if (iscntrl(' '))
		return 4;
	if (iscntrl('a'))
		return 5;
	if (iscntrl(-1))
		return 6;
	return 0;
}
