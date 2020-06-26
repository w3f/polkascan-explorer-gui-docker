#!/bin/sh
set -ex

source /scripts/common.sh

IMAGE=${1}
TAG=engineering-${NETWORK_ID}-${CIRCLE_TAG}
ORIGIN_TAG=engineering-${NETWORK_ID}-${CIRCLE_SHA1}

docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}

docker pull ${IMAGE}:${ORIGIN_TAG}

docker_tag_and_push ${TAG}
