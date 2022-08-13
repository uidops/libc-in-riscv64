#include <string.h>

int
main(void)
{
	char a[13] = "DOROD";
	char *r = NULL;

	return ((r = strcat(a, " BAR TO")) && !strcmp(r, "DOROD BAR TO")) ? 0 : 1;
}
