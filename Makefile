# Build and test the libc the way the README does:
#
#   make               build every test binary into build/
#   make test          build + run them all under spike/pk
#   make strlen_test   build a single test
#   make clean
#
# A test passes when its exit status is 0 (134 for abort_test).

CC     = riscv64-unknown-elf-gcc
CFLAGS = -fno-builtin -Iinclude
PK     = /opt/homebrew/opt/riscv-pk/riscv64-unknown-elf/bin/pk
SPIKE  = spike
BUILD  = build

# <dir>/test/<name>.c  ->  build/<name>_test, built from <dir>/<name>.s
NAMES := $(addsuffix _test,$(basename $(notdir $(wildcard ctype/test/*.c string/test/*.c stdlib/test/*.c))))
TESTS := $(addprefix $(BUILD)/,$(NAMES))

# broken before this Makefile existed: memset guards on 'ptr & len',
# strcat scans past the NUL, strncmp test expects a wrong result
XFAIL := memset_test strcat_test strncmp_test

vpath %.s ctype string stdlib
vpath %.c ctype/test string/test stdlib/test

all: $(TESTS)

$(BUILD):
	mkdir -p $@

$(BUILD)/%_test: %.s %.c | $(BUILD)
	$(CC) $(CFLAGS) $^ -o $@

# "make <name>_test" builds build/<name>_test
$(NAMES): %_test: $(BUILD)/%_test
	@:

# rand() and srand() share the seed living in rand.s, so both objects
# always link together
$(BUILD)/rand_test $(BUILD)/srand_test: rand.s srand.s

test: all
	@pass=0; fail=0; xfail=0; \
	for t in $(NAMES); do \
		exp=0; [ $$t = abort_test ] && exp=134; \
		$(SPIKE) $(PK) $(BUILD)/$$t >/dev/null 2>&1; st=$$?; \
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
	rm -rf $(BUILD) *_test */*_test */test/*_test

.PHONY: all test clean
