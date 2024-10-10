#!/bin/bash

ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL -o eksctl_checksums.txt "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt"

if [ ! -f eksctl_checksums.txt ]; then
  echo "Failed to download eksctl_checksums.txt"
  exit 1
fi

CHECKSUM=$(grep "$PLATFORM" eksctl_checksums.txt | awk '{print $1}')
if [ -z "$CHECKSUM" ]; then
  echo "Checksum for $PLATFORM not found in eksctl_checksums.txt"
  exit 1
fi

echo "$CHECKSUM  eksctl_$PLATFORM.tar.gz" | sha256sum --check --status
if [ $? -ne 0 ]; then
  echo "eksctl checksum failed"
  exit 1
fi

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin

echo "eksctl version $(eksctl version) installed successfully"
