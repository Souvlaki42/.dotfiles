#!/usr/bin/zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [ ! -d "$NVM_DIR" ]; then
    echo "Installing NVM..."
    # Download and install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # Source NVM script to make it available in the current shell
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    # Install the latest LTS version of Node.js
    echo "Installing the latest LTS version of Node.js..."
    nvm install --lts

    # Set the installed LTS version as the default
    nvm alias default "lts/*"

    echo "Node.js and NVM installed successfully."
fi
