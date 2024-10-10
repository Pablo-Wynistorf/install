#!/bin/bash

NVM_DIR="/usr/local/nvm"

LATEST_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${LATEST_VERSION}/install.sh | NVM_DIR=$NVM_DIR bash

echo "export NVM_DIR=\"$NVM_DIR\"" | sudo tee -a /etc/profile
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" | sudo tee -a /etc/profile
echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" | sudo tee -a /etc/profile

nvm --version

echo "NVM has been installed. Please run 'source /etc/profile' or restart your terminal to use it."

