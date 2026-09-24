#include <stdlib.h>

/*
 * Passes only if exit(0) terminates with status 0: returning from
 * main instead would leave status 1.
 */
int
main(void)
{
	exit(0);
	return 1;
}
