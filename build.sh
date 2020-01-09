#!/bin/bash

docker build -t luanngominh/gitops:0.0.1 .

if [[ $? != 0 ]]; then
    echo "Build docker image error!"
    exit 1
fi

docker push luanngominh/gitops:0.0.1
