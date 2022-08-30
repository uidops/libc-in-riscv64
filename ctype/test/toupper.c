#include <ctype.h>

int
main(void)
{
	return !(toupper('a') == 'A' && toupper('Z') == 'Z' && toupper('*') == '*');
}

