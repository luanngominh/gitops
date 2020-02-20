#!/bin/bash

echo $TOKEN | docker login --username luanngominh --password-stdin

if [[ $? != 0 ]]; then
    echo "Login to docker hub error"
    exit 1
fi

DOCKER_TAG="latest"

short_commit=`git rev-parse --short HEAD`
if [[ $? == 0 || `echo ${short_commit} | wc -c` != 8 ]]; then
   DOCKER_TAG=${short_commit}
fi

echo "Build docker image with tag ${short_commit}"
docker build -t luanngominh/gitops:${TRAVIS_BRANCH}-${short_commit} .

if [[ $? != 0 ]]; then
    echo "Build docker image error!"
    exit 1
fi

docker push luanngominh/gitops:${TRAVIS_BRANCH}-${short_commit}
