#include <string.h>

int
main(void)
{
	return !(strnlen("", 100) == 0 && strnlen("__#$(4mfm)", 5) == 5 &&
			strnlen("xxxxx", 100) == 5 && strnlen("xxxxxxxx", 0) == 0);
}

