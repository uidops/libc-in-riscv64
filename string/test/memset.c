#include <string.h>

int
main(void)
{
	int a[5] = {1, 2, 3, 4, 5};
	unsigned char *p;

	/* memset fills bytes: 4 bytes of 0xff, the rest untouched */
	memset((void *)a, 0xff, 4);
	p = (unsigned char *)a;
	if (p[0] == 0xff && p[1] == 0xff && p[2] == 0xff && p[3] == 0xff &&
			p[4] == 0x02 && a[4] == 0x05)
		return 0;
	return 1;
}
