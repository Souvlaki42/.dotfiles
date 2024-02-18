#!/usr/bin/zsh

# Check if the gcc package is installed
if ! command -v gcc &> /dev/null; then
    echo "Error: The 'gcc' package is required to install rust."
    return 1
fi

# Check if the rustup package is installed
if ! command -v rustup &> /dev/null; then
    echo "Error: The 'rustup' package is required to install rust."
    return 1
fi

# Check if stable toolchain is installed
output=$(rustup toolchain list 2>&1)
if echo "$output" | grep -q "no installed toolchains"; then
  rustup toolchain install stable
  rustup default stable
fi
