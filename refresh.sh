#!/bin/bash

pushd $(dirname $0)

./build.sh

export IMAGE_NAME=swgbase_$(echo $PWD | md5sum | awk '{ print $1 }')

docker-compose stop
docker-compose up
