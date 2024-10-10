#!/bin/bash

LATEST_RELEASE=$(sudo curl -s https://api.github.com/repos/Pablo-Wynistorf/lambda-layergen/releases/latest)

ASSET_URL=$(echo "$LATEST_RELEASE" | grep "browser_download_url" | cut -d '"' -f 4)

DEST="/usr/local/bin/layergen"

sudo curl -L $ASSET_URL -o $DEST

sudo chmod +x $DEST

echo "layergen has been installed to $DEST"