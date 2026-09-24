#include <ctype.h>

int
main(void)
{
	if (!ispunct('!'))
		return 1;
	if (!ispunct('.'))
		return 2;
	if (!ispunct('~'))
		return 3;
	if (ispunct('a'))
		return 4;
	if (ispunct('Z'))
		return 5;
	if (ispunct('5'))
		return 6;
	if (ispunct(' '))
		return 7;
	if (ispunct('\t'))
		return 8;
	return 0;
}
