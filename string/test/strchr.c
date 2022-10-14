#include <string.h>

int
main(void)
{
	const char *a = "Hello, World\n Who am I???";
	if (strchr(a, ' ') == a+0x06 && strchr(a, 0x00) == a+0x19 &&
			strchr(a, 'a') == a+0x12 && strchr(a, '?') == a+0x16 &&
			strchr(a, 'Z') == NULL && strchr(a, 'w') == NULL)
		return 0;

	return 1;
}
