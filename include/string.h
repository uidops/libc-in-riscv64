#ifndef _STRING_H
#define _STRING_H

#include <stddef.h>

size_t		 strlen(const char *);
size_t		 strnlen(const char *, size_t);
char		*strcpy(char *, const char *);
char		*strncpy(char *, const char *, size_t);
char		*strcat(char *, const char *);
char		*strncat(char *, const char *, size_t);
char		*strchr(const char *, int);
char		*strrchr(const char *, int);
int		 strcmp(const char *, const char *);
int		 strncmp(const char *, const char *, size_t);
char		*strstr(const char *, const char *);

void		*memset(void *, int, size_t);
void		*memcpy(void *, const void *, size_t);
void		*memchr(const void *, int, size_t);
int		 memcmp(const void *, const void *, size_t);

#endif
