#include <ctype.h>

int
main(void)
{
	return !(islower('h') & !islower('H'));
}

