#include <stdlib.h>

/*
 * abort() must terminate abnormally: this test passes only when the
 * exit status is 134 (128 + SIGABRT), never 0.
 */
int
main(void)
{
	abort();
	return 1;
}
