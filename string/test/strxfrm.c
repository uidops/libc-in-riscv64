#include <string.h>

int
main(void)
{
	char buf[8];
	size_t n;

	n = strxfrm(buf, "abc", sizeof buf);
	if (n != 3)
		return 1;
	if (!(buf[0] == 'a' && buf[1] == 'b' &&
			buf[2] == 'c' && buf[3] == '\0'))
		return 2;

	/* truncated when n is too small, length still returned */
	n = strxfrm(buf, "abcdef", 4);
	if (n != 6)
		return 3;
	if (!(buf[0] == 'a' && buf[1] == 'b' &&
			buf[2] == 'c' && buf[3] == '\0'))
		return 4;

	/* n == 0 stores nothing */
	buf[0] = 'X';
	n = strxfrm(buf, "abc", 0);
	if (n != 3)
		return 5;
	if (buf[0] != 'X')
		return 6;
	return 0;
}
