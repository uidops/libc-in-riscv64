#include <stdlib.h>

int
main(void)
{
	ldiv_t r;

	r = ldiv(7, 3);
	if (r.quot != 2 || r.rem != 1)
		return 1;
	r = ldiv(-7, 3);
	if (r.quot != -2 || r.rem != -1)
		return 2;
	r = ldiv(10000000000L, 7);
	if (r.quot != 1428571428L || r.rem != 4L)
		return 3;
	return 0;
}
