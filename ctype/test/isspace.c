#include <ctype.h>

int
main(void)
{
	if (!isspace(' '))
		return 1;
	if (!isspace('\t'))
		return 2;
	if (!isspace('\n'))
		return 3;
	if (isspace('a'))
		return 4;
	return 0;
}
