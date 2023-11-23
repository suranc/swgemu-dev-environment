#!/bin/bash

pushd $(dirname $0)

mkdir mysql
chmod 777 mysql

git submodule update --init --recursive

pushd Core3
ln -sf ../engine3/MMOEngine
popd

mkdir SWGEmu-tre-files

echo "Copy TRE files to the $(readlink -f $PWD)/SWGEmu-tre-files/ directory."
echo "Press [ENTER] when complete."
read tre
while [ $(SWGEmu-tre-files/*.tre|wc -l) -lt 54 ]
do
    echo "ERROR: Minimum of 54 .tre files not found in (readlink -f $PWD)/SWGEmu-tre-files/"
    echo "Press [ENTER] when complete."
    read tre
done
    
echo "un ./engine3-build.sh and ./build.sh"
