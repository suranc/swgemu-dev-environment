#!/bin/bash

pushd $(dirname $0)

IMAGE_NAME=swgbase_$(echo $PWD | md5sum | awk '{ print $1 }')

docker build - -t $IMAGE_NAME < Dockerfile
docker run -it --rm -u $UID -v $PWD:/work $IMAGE_NAME sh -c "cd /work/Core3/MMOCoreORB/ && make -j$(($(nproc)+1))"
