#include <string.h>

int
main(void)
{
	const char *a = "hello world";
	char b[12];
	char c[10] = "abcdefg";
	char d[10] = "abcdefg";
	char e[4] = "xy";

	/* plain copy, returns dest */
	if (memmove(b, a, 12) != b)
		return 1;
	if (!(b[0] == 'h' && b[5] == ' ' && b[10] == 'd' && b[11] == '\0'))
		return 2;

	/* overlapping, dest > src: backward copy */
	if (memmove(c + 1, c, 7) != c + 1)
		return 3;
	if (!(c[0] == 'a' && c[1] == 'a' && c[2] == 'b' && c[7] == 'g'))
		return 4;

	/* overlapping, dest < src: forward copy */
	if (memmove(d, d + 1, 7) != d)
		return 5;
	if (!(d[0] == 'b' && d[5] == 'g' && d[6] == '\0'))
		return 6;

	/* n == 0 copies nothing */
	memmove(e, e + 1, 0);
	if (!(e[0] == 'x' && e[1] == 'y' && e[2] == '\0'))
		return 7;

	return 0;
}
