#!/bin/bash

pushd $(dirname $0) > /dev/null

mkdir -p mysql
chmod 777 mysql

git submodule update --init --recursive

pushd Core3 > /dev/null
ln -sf ../engine3/MMOEngine
popd > /dev/null

mkdir -p SWGEmu-tre-files

if [ $(ls SWGEmu-tre-files/*.tre|wc -l) -lt 54 ]
then
    echo "Copy TRE files to the $(readlink -f $PWD)/SWGEmu-tre-files/ directory."
    echo "Press [ENTER] when complete."
    read tre
    while [ $(ls SWGEmu-tre-files/*.tre|wc -l) -lt 54 ]
    do
        echo "ERROR: Minimum of 54 .tre files not found in (readlink -f $PWD)/SWGEmu-tre-files/"
        echo "Press [ENTER] when complete."
        read tre
    done
fi

if [ ! -d mysql/swgemu ]
then
echo "Setting up MySQL Database"
    mysql_container=$(docker run -d --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=true -v $PWD/mysql:/var/lib/mysql -v $PWD:/work mysql)
    sleep 30
    docker exec -it $mysql_container sh -c "/work/mysql-setup.sh"
    docker stop $mysql_container > /dev/null
fi

echo "Done!"
echo "Run ./engine3-build.sh to build engine and run ./build.sh Core3"
