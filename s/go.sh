#!/bin/bash

curl -LO get.golang.org/$(uname)/go_installer
chmod +x go_installer
./go_installer --version $(curl https://go.dev/dl/?mode=json | jq -r '.[0].version')
rm go_installer