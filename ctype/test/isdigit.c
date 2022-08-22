#include <ctype.h>

int
main(void)
{
	return !(isdigit('5') & !isdigit('a'));
}

