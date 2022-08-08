#include "string.h"

int
main(void)
{
	if ((strcmp("OHOY", "GOOD?+") == 'O'-'G') &&
			(strcmp("OHO", "ODG") == 'H'-'D') &&
			 (strcmp("SALAM BAR RISCV", "SALAM BAR RISCV") == 0))
		return 0;

	return 1;
}

