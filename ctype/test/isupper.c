#include <ctype.h>

int
main(void)
{
	return !(isupper('Z') & !isupper('z'));
}

