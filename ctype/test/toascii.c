#include <ctype.h>

int
main(void)
{
	return !(toascii(0xff) == 0x7f);
}

