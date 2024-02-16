#!/usr/bin/zsh

export PNPM_HOME="$HOME/.local/share/pnpm"

if [ ! -d "$PNPM_HOME" ]; then
    # Download and install PNPM
    curl -fsSL https://get.pnpm.io/install.sh | sh -
    echo "PNPM was installed successfully!"
fi
