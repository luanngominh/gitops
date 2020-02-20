#!/bin/bash

kubectl -n flux create secret generic flux-git-deploy --from-file=identity=./id_rsa
