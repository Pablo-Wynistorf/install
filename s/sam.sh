#!/bin/bash

if ! [ -x "$(command -v unzip)" ]; then
  echo 'Info: unzip is not installed.' >&2
  echo 'Trying to install unzip...'
  sudo apt-get install unzip -y
  if ! [ -x "$(command -v unzip)" ]; then
    echo 'Error: unzip install faild' >&2
    exit 1
  fi
fi

curl -L "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "sam-cli.zip"
mkdir -p sam-cli
unzip sam-cli.zip -d sam-cli
sudo ./sam-cli/install --update
rm -rf sam-cli.zip sam-cli

sam --version
