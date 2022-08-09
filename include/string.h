#ifndef _STRING_H
#define _STRING_H

#include <stddef.h>

size_t		 strlen(const char *);
char		*strcpy(char *, const char *);
int		 strcmp(const char *, const char *);

void		*memset(void *, int, size_t);
void		*memcpy(void *, const void *, size_t);

#endif
