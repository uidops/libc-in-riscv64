# Build the whole libc into build/libc.a once, then link each test
# against it — same flags as the README (riscv64-unknown-elf-gcc
# -fno-builtin -Iinclude), run under spike/pk:
#
#   make               build build/libc.a + all test binaries
#   make test          build + run them all
#   make strlen_test   build a single test
#   make clean
#
# A test passes when its exit status is 0 (134 for abort_test).
#
# Static archive, not a .so: this toolchain's linker has no -shared
# support and pk cannot run dynamic executables.

CC     = riscv64-unknown-elf-gcc
AR     = riscv64-unknown-elf-ar
CFLAGS = -fno-builtin -Iinclude
PK     = /opt/homebrew/opt/riscv-pk/riscv64-unknown-elf/bin/pk
SPIKE  = spike
BUILD  = build
LIB    = $(BUILD)/libc.a

# every <dir>/<name>.s becomes one object in the archive
SRCS := $(wildcard ctype/*.s string/*.s stdlib/*.s)
OBJS := $(addprefix $(BUILD)/,$(addsuffix .o,$(basename $(notdir $(SRCS)))))

# <dir>/test/<name>.c  ->  build/<name>_test, linked against $(LIB)
NAMES := $(addsuffix _test,$(basename $(notdir $(wildcard ctype/test/*.c string/test/*.c stdlib/test/*.c))))
TESTS := $(addprefix $(BUILD)/,$(NAMES))

vpath %.s ctype string stdlib
vpath %.c ctype/test string/test stdlib/test

all: $(LIB) $(TESTS)

$(BUILD):
	mkdir -p $@

$(BUILD)/%.o: %.s | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

# rm first so members of deleted sources do not linger in the archive
$(LIB): $(OBJS) | $(BUILD)
	rm -f $@
	$(AR) rcs $@ $^

$(BUILD)/%_test: %.c $(wildcard include/*.h) $(LIB) | $(BUILD)
	$(CC) $(CFLAGS) $< $(LIB) -o $@

# "make <name>_test" builds build/<name>_test
$(NAMES): %_test: $(BUILD)/%_test
	@:

test: all
	@pass=0; fail=0; \
	for t in $(NAMES); do \
		exp=0; [ $$t = abort_test ] && exp=134; \
		$(SPIKE) $(PK) $(BUILD)/$$t >/dev/null 2>&1; st=$$?; \
		if [ $$st -eq $$exp ]; then \
			echo "ok    $$t"; pass=$$((pass + 1)); \
		else \
			echo "FAIL  $$t (exit $$st, want $$exp)"; fail=$$((fail + 1)); \
		fi; \
	done; \
	echo "---- $$pass passed, $$fail failed"; \
	[ $$fail -eq 0 ]

clean:
	rm -rf $(BUILD) *_test */*_test */test/*_test

.PHONY: all test clean
