#include <ctype.h>

int
main(void)
{
	return !(isascii('a') & !isascii(0x80));
}

