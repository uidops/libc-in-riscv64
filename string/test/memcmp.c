#include <string.h>

int
main(void)
{
	char *s1 = "hello";
	char *s2 = "hella";
	if (memcmp(s1, s2, 4) != 0)
		return 1;
	if (memcmp(s1, s2, 5) <= 0)
		return 2;
	return 0;
}
