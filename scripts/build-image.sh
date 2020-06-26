#!/bin/bash

git submodule update --init --recursive

/scripts/build-image.sh \
    web3f/polkascan-explorer-gui \
    --build-arg API_URL \
    --build-arg NETWORK_NAME \
    --build-arg NETWORK_ID \
    --build-arg NETWORK_TYPE \
    --build-arg CHAIN_TYPE \
    --build-arg NETWORK_TOKEN_SYMBOL \
    --build-arg NETWORK_TOKEN_DECIMALS \
    --build-arg NETWORK_COLOR_CODE \
    -f polkascan-pre-explorer-gui/Dockerfile \
    ./polkascan-pre-explorer-gui
