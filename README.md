# libc in riscv-64 - just for learning

An experimental libc in riscv-64

Any contributions are welcome

## Development & Testing on macOS

### 1. Install Compilers and Simulators
Use Homebrew to install the RISC-V toolchain, simulator, and proxy kernel:
```bash
brew tap riscv-software-src/riscv
brew install riscv-gnu-toolchain spike riscv-pk
```

### 2. Compile and Run Tests
To compile and run a test (e.g., `strlen`):
```bash
# Compile using the cross-compiler
riscv64-unknown-elf-gcc -fno-builtin -Iinclude string/strlen.s string/test/strlen.c -o strlen_test

# Run using Spike and the Proxy Kernel (pk)
spike /opt/homebrew/opt/riscv-pk/riscv64-unknown-elf/bin/pk ./strlen_test

# Check exit status (0 means success)
echo $?
```
