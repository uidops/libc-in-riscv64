#include <ctype.h>

int
main(void)
{
	if (!isxdigit('0'))
		return 1;
	if (!isxdigit('9'))
		return 2;
	if (!isxdigit('a'))
		return 3;
	if (!isxdigit('f'))
		return 4;
	if (!isxdigit('A'))
		return 5;
	if (!isxdigit('F'))
		return 6;
	if (isxdigit('g'))
		return 7;
	if (isxdigit('G'))
		return 8;
	if (isxdigit(':'))
		return 9;
	if (isxdigit('/'))
		return 10;
	return 0;
}
