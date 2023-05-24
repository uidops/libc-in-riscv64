#ifndef _STRING_H
#define _STRING_H

#include <stddef.h>

size_t		 strlen(const char *);
size_t		 strnlen(const char *, size_t);
char		*strcpy(char *, const char *);
char		*strcat(char *, const char *);
char		*strchr(const char *, int);
int		 strcmp(const char *, const char *);

void		*memset(void *, int, size_t);
void		*memcpy(void *, const void *, size_t);
void		*memchr(const void *, int, size_t);

#endif
