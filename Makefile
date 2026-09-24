# Build and test the libc the way the README does:
#
#   make               build every test binary as <name>_test
#   make test          build + run all of them under spike/pk
#   make strlen_test   build a single test
#   make clean
#
# A test passes when its exit status is 0 (134 for abort_test).

CC     = riscv64-unknown-elf-gcc
CFLAGS = -fno-builtin -Iinclude
PK     = /opt/homebrew/opt/riscv-pk/riscv64-unknown-elf/bin/pk
SPIKE  = spike

# <dir>/test/<name>.c  ->  <name>_test, built from <dir>/<name>.s
TESTS := $(addsuffix _test,$(basename $(notdir $(wildcard ctype/test/*.c string/test/*.c stdlib/test/*.c))))

# broken before this Makefile existed: memset guards on 'ptr & len',
# strcat scans past the NUL, strncmp test expects a wrong result
XFAIL := memset_test strcat_test strncmp_test

vpath %.s ctype string stdlib
vpath %.c ctype/test string/test stdlib/test

all: $(TESTS)

%_test: %.s %.c
	$(CC) $(CFLAGS) $^ -o $@

# rand() and srand() share the seed living in rand.s, so both objects
# always link together
rand_test srand_test: rand.s srand.s

test: all
	@pass=0; fail=0; xfail=0; \
	for t in $(TESTS); do \
		exp=0; [ $$t = abort_test ] && exp=134; \
		$(SPIKE) $(PK) ./$$t >/dev/null 2>&1; st=$$?; \
		if [ $$st -eq $$exp ]; then \
			pass=$$((pass + 1)); \
			case " $(XFAIL) " in \
			*" $$t "*) echo "xpass $$t (fixed: drop it from XFAIL)";; \
			*) echo "ok    $$t";; \
			esac; \
		else \
			case " $(XFAIL) " in \
			*" $$t "*) xfail=$$((xfail + 1)); echo "xfail $$t (known broken)";; \
			*) fail=$$((fail + 1)); echo "FAIL  $$t (exit $$st, want $$exp)";; \
			esac; \
		fi; \
	done; \
	echo "---- $$pass passed, $$fail failed, $$xfail known broken"; \
	[ $$fail -eq 0 ]

clean:
	rm -f *_test */*_test */test/*_test

.PHONY: all test clean
