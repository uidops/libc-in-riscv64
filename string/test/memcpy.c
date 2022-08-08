#include <string.h>

int
main(void)
{
	int a[5] = {1, 2, 3, 4, 5};	
	int b[5] = {0, 0, 0, 0, 0};	

	memcpy(b, a, sizeof(int)*4);

	if ((b[0] == 1 && b[1] == 2) &&
			(b[2] == 3 && b[3] == 4) &&
			(b[4] == 0))
		return 0;

	return 1;
}

