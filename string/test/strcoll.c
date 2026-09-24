#include <string.h>

int
main(void)
{
	if (strcoll("abc", "abc") != 0)
		return 1;
	if (!(strcoll("abc", "abd") < 0))
		return 2;
	if (!(strcoll("b", "a") > 0))
		return 3;
	if (!(strcoll("", "a") < 0))
		return 4;
	return 0;
}
