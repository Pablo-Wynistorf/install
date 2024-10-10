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

curl "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "aws-sam-cli-linux-x86_64"
unzip aws-sam-cli-linux-x86_64.zip
sudo ./aws-sam-cli-linux-x86_64/install
rm -rf aws-sam-cli-linux-x86_64.zip aws-sam-cli-linux-x86_64

sam --version