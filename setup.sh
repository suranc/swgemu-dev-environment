#!/bin/bash

pushd $(dirname $0) > /dev/null

git submodule update --init --recursive

pushd Core3 > /dev/null
ln -sf ../engine3/MMOEngine
popd > /dev/null

mkdir -p SWGEmu-tre-files

# Ensure TRE files are in place
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

# Setup database if it does not exist.
if [ ! -d mysql/swgemu ]
then
    mkdir -p mysql
    chmod 777 mysql 2>/dev/null

    echo "Setting up MySQL Database"
    mysql_container=$(docker run -d --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=true -v $PWD/mysql:/var/lib/mysql -v $PWD:/work mysql)
    sleep 30
    docker exec -it $mysql_container sh -c "/work/mysql-setup.sh"
    docker stop $mysql_container > /dev/null
fi

# Create config-local.lua with correct database name if it does not already exist
if [ ! -f Core3/MMOCoreORB/bin/conf/config-local.lua ]
then
    cat Core3/MMOCoreORB/bin/conf/config.lua | sed 's/DBHost = "127.0.0.1"/DBHost = "mysql"/g' > Core3/MMOCoreORB/bin/conf/config-local.lua
fi

echo "Done!"
echo
echo "Run ./engine3-build.sh to build engine."
echo "Run ./build.sh Core3"
