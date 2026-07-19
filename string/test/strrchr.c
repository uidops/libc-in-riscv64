#include <string.h>

int
main(void)
{
	char *s = "hello world";
	if (strrchr(s, 'l') != s + 9)
		return 1;
	if (strrchr(s, 'x') != NULL)
		return 2;
	if (strrchr(s, '\0') != s + 11)
		return 3;
	return 0;
}
