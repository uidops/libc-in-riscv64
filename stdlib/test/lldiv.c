#include <stdlib.h>

int
main(void)
{
	lldiv_t r;

	r = lldiv(7, 3);
	if (r.quot != 2 || r.rem != 1)
		return 1;
	r = lldiv(-7, 3);
	if (r.quot != -2 || r.rem != -1)
		return 2;
	r = lldiv(9223372036854775807LL, 2);
	if (r.quot != 4611686018427387903LL || r.rem != 1)
		return 3;
	return 0;
}
