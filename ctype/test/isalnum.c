#include <ctype.h>

int
main(void)
{
	return !((isalnum('9') & isalnum('a')) & !isalnum('#'));
}

