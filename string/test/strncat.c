#include <string.h>

int
main(void)
{
	char dest[20] = "hello";
	strncat(dest, " world!!!", 6);
	if (strcmp(dest, "hello world") != 0)
		return 1;
	return 0;
}
