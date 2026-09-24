#ifndef _STDLIB_H
#define _STDLIB_H

typedef struct { int quot; int rem; } div_t;
typedef struct { long quot; long rem; } ldiv_t;
typedef struct { long long quot; long long rem; } lldiv_t;

int		 abs(int);
long		 labs(long);
long long	 llabs(long long);
int		 atoi(const char *);
long		 atol(const char *);
long long	 atoll(const char *);

div_t		 div(int, int);
ldiv_t		 ldiv(long, long);
lldiv_t	 lldiv(long long, long long);

int		 rand(void);
void		 srand(unsigned int);
void		 exit(int);
void		 abort(void);

#endif
