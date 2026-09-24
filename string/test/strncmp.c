#include <string.h>

int
main(void)
{
	if (strncmp("hello", "hello", 10) != 0)
		return 1;
	if (strncmp("hello", "helloworld", 5) != 0)
		return 2;
	if (strncmp("hello", "hella", 5) <= 0)
		return 3;
	return 0;
}
