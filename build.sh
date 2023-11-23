#!/bin/bash

pushd $(dirname $0)

docker build . -t swgbase
docker run -it -v $PWD:/work swgbase sh -c "cd /work/Core3/MMOEngine && make && cd /work/Core3/MMOCoreORB/ && make" 
