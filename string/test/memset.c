#include "string.h"

int
main(int argc, char **argv)
{
	int a[5] = {1, 2, 3, 4, 5};
	memset((void *)a, 0xff, 4);
	if ((a[0] == 0xff && a[1] == 0xff) &&
			(a[2] == 0xff && a[3] == 0xff) &&
			(a[4] == 0x05))
		return 0;
	return 1;
}
