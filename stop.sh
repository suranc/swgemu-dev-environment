#!/bin/bash

pushd $(dirname $0)

export IMAGE_NAME=swgbase_$(echo $PWD | md5sum | awk '{ print $1 }')

docker-compose down
