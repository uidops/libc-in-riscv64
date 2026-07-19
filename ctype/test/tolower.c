#include <ctype.h>

int
main(void)
{
	if (tolower('A') != 'a')
		return 1;
	if (tolower('z') != 'z')
		return 2;
	if (tolower('5') != '5')
		return 3;
	return 0;
}
