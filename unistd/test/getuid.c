#include <stdio.h>
#include <unistd.h>

int
main(void)
{
	printf("%u\n", getuid());
	return 0;
}

