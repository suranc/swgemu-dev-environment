#!/bin/bash

pushd $(dirname $0)

IMAGE_NAME=swgbase_$(echo $PWD | md5sum | awk '{ print $1 }')
echo $IMAGE_NAME
docker build - -t $IMAGE_NAME < Dockerfile
docker run -it --rm -u $UID -v $PWD:/work $IMAGE_NAME sh -c "cd /work/engine3/MMOEngine && make -j$(($(nproc)+1))" 
