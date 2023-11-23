#!/bin/bash

pushd $(dirname $0)

mkdir mysql
chmod 777 mysql

git submodule update --init --recursive

cd Core3

ln -sf ../engine3/MMOEngine

mkdir SWGEmu-tre-files
echo "Copy TRE files to the $(readlink -f $PWD)/SWGEmu-tre-files/ directory"
