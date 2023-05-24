#include <string.h>

int
main(void)
{
	const char *a = "Hello, World\n Who am I???";
	size_t length = strlen(a) + 1;
	if (memchr(a, ' ', length) == a+0x06 && memchr(a, 0x00, length) == a+0x19 &&
			memchr(a, 'a', length) == a+0x12 && memchr(a, '?', length) == a+0x16 &&
			memchr(a, 'Z', length) == NULL && memchr(a, 'w', length) == NULL)
		return 0;

	return 1;
}
