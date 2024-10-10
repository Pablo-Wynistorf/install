#!/bin/bash

sudo curl -LO get.golang.org/$(uname)/go_installer
sudo chmod +x go_installer
sudo ./go_installer --version $(curl https://go.dev/dl/?mode=json | jq -r '.[0].version')
sudo rm go_installer