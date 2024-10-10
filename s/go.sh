#!/bin/bash

GO_INSTALL_DIR="/usr/local/go"

curl -LO https://golang.org/dl/$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].files[] | select(.os == "'$(uname -s)'" and .arch == "'$(uname -m)'") | .filename')

GO_TAR=$(basename $(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].files[] | select(.os == "'$(uname -s)'" and .arch == "'$(uname -m)'") | .filename'))

tar -C /usr/local -xzf $GO_TAR
rm $GO_TAR

echo "export PATH=\$PATH:$GO_INSTALL_DIR/bin" >> /etc/profile.d/go.sh
chmod +x /etc/profile.d/go.sh

echo "Go has been installed successfully. Please restart your terminal or run 'source /etc/profile.d/go.sh' to update your PATH."
