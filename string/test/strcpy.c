#include "string.h"

int
main(void)
{
	char a[] = "OHOY";
	char b[] = "GOOD?+";

	strcpy(b, a);

	if ((b[0] == 'O' && b[1] == 'H') &&
			(b[2] == 'O' && b[3] == 'Y') &&
			(b[4] == '\0' && b[5] == '+'))
		return 0;

	return 1;
}

