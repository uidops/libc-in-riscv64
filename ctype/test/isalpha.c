#include <ctype.h>

int
main(void)
{
	return !(isalpha('A') & !isalpha('0'));
}

