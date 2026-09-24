#include <stdlib.h>

int
main(void)
{
	if (atoll("3503335") != 3503335LL)
		return 1;
	if (atoll("-9393153") != -9393153LL)
		return 2;
	if (atoll("  -42abc") != -42LL)
		return 3;
	if (atoll("") != 0)
		return 4;
	if (atoll("398fjdkfjdk395") != 398)
		return 5;
	if (atoll("1234567890123") != 1234567890123LL)
		return 6;
	if (atoll("9223372036854775807") != 9223372036854775807LL)
		return 7;
	return 0;
}
