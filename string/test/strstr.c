#include <string.h>

int
main(void)
{
	char *s = "hello world";
	if (strstr(s, "world") != s + 6)
		return 1;
	if (strstr(s, "") != s)
		return 2;
	if (strstr(s, "abc") != NULL)
		return 3;
	return 0;
}
