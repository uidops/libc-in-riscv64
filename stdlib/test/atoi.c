#include <stdlib.h>

int
main(void)
{
	if (atoi("3503335") == 3503335 && atoi("+353020349") == 353020349 && atoi("1300") == 1300 &&
			atoi("-9393153") == -9393153 && atoi("-00085") == -85 && atoi("0") == 0 &&
			atoi("") == 0 && atoi("398fjdkfjdk395") == 398 && atoi("dfjkdkjfd") == 0)
		return 0;
	return 1;
}

