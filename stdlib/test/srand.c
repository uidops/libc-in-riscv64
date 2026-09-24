#include <stdlib.h>

int
main(void)
{
	int seq1[3], seq2[3];
	int i;

	srand(1);
	for (i = 0; i < 3; i++)
		seq1[i] = rand();
	srand(42);
	for (i = 0; i < 3; i++)
		seq2[i] = rand();
	if (seq1[0] == seq2[0])
		return 1;
	srand(1);
	for (i = 0; i < 3; i++)
		if (rand() != seq1[i])
			return 2;
	return 0;
}
