#!/usr/bin/zsh

# Check if the unzip package is installed
if ! command -v unzip &> /dev/null; then
    echo "Error: The 'unzip' package is required to install Bun."
    return 1
fi

# Set BUN_INSTALL environment variable
export BUN_INSTALL="$HOME/.bun"

if [ ! -d "$BUN_INSTALL" ]; then
    # Download and install Bun
    curl -fsSL https://bun.sh/install | bash
fi
