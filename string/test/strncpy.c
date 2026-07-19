#include <string.h>

int
main(void)
{
	char dest[10] = "123456789";
	strncpy(dest, "abc", 5);
	if (dest[0] != 'a' || dest[1] != 'b' || dest[2] != 'c' || dest[3] != '\0' || dest[4] != '\0')
		return 1;
	
	char dest2[10] = "123456789";
	strncpy(dest2, "abcdefghijk", 3);
	if (dest2[0] != 'a' || dest2[1] != 'b' || dest2[2] != 'c' || dest2[3] != '4')
		return 2;

	return 0;
}
