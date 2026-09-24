#include <stdlib.h>

int
main(void)
{
	div_t r;

	r = div(7, 3);
	if (r.quot != 2 || r.rem != 1)
		return 1;
	r = div(-7, 3);
	if (r.quot != -2 || r.rem != -1)
		return 2;
	r = div(7, -3);
	if (r.quot != -2 || r.rem != 1)
		return 3;
	r = div(0, 5);
	if (r.quot != 0 || r.rem != 0)
		return 4;
	return 0;
}
