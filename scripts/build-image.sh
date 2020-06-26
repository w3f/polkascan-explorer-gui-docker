#!/bin/bash

IMAGE=web3f/polkascan-explorer-gui
TAG=engineering-${NETWORK_ID}-${CIRCLE_SHA1}

git submodule update --init --recursive

cp nginx/polkascan-${NETWORK_ID}.conf polkascan-pre-explorer-gui/nginx/polkascan-prod.conf

/scripts/build-image.sh \
    ${IMAGE}:${TAG} \
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
