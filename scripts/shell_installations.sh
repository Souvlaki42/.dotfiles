#!/usr/bin/zsh

# Check if the unzip package is installed
if ! command -v unzip &> /dev/null; then
    echo "Error: The 'unzip' package is required to install Bun."
    return 1
fi

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

# Set BUN_INSTALL environment variable
export BUN_INSTALL="$HOME/.bun"

if [ ! -d "$BUN_INSTALL" ]; then
    # Download and install Bun
    echo "Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
fi

# Set NVM_DIR environment variable
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [ ! -d "$NVM_DIR" ]; then
     # Download and install NVM
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # Source NVM script to make it available in the current shell
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    # Install the latest LTS version of Node.js
    echo "Installing the latest LTS version of Node.js..."
    nvm install --lts
    # Set the installed LTS version as the default
    nvm alias default "lts/*"
fi

# Set PNPM_HOME environment variable
export PNPM_HOME="$HOME/.local/share/pnpm"


if [ ! -d "$PNPM_HOME" ]; then
    # Download and install PNPM
    echo "Installing PNPM..."
    curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

# Check if stable toolchain is installed
output=$(rustup toolchain list 2>&1)
if echo "$output" | grep -q "no installed toolchains"; then
  echo "Installing stable toolchain..."
  rustup toolchain install stable
  rustup default stable
fi
