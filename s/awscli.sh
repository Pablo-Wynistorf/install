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

sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
sudo rm -rf awscliv2.zip aws

aws --version
