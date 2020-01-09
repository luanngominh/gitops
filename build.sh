#!/bin/bash

DOCKER_TAG="latest"

short_commit=`git rev-parse --short HEAD`
if [[ $? == 0 || `echo ${short_commit} | wc -c` != 8 ]]; then
   DOCKER_TAG=${short_commit}
fi

echo "Build docker image with tag ${short_commit}"
docker build -t luanngominh/gitops:${short_commit} .

if [[ $? != 0 ]]; then
    echo "Build docker image error!"
    exit 1
fi

docker push luanngominh/gitops:${short_commit}
