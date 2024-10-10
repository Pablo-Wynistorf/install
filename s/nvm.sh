#!/bin/bash

LATEST_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${LATEST_VERSION}/install.sh | bash

nvm --version