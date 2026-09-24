#include <ctype.h>

int
main(void)
{
	if (!isblank(' '))
		return 1;
	if (!isblank('\t'))
		return 2;
	if (isblank('\n'))
		return 3;
	if (isblank('a'))
		return 4;
	if (isblank(0))
		return 5;
	return 0;
}
