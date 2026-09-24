#include <ctype.h>

int
main(void)
{
	if (!isgraph('!'))
		return 1;
	if (!isgraph('~'))
		return 2;
	if (isgraph(' '))
		return 3;
	if (isgraph('\n'))
		return 4;
	if (isgraph(0x7f))
		return 5;
	return 0;
}
