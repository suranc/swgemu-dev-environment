#!/bin/bash
cd /home/chris/workspace/swgemu/dev-environment
docker run -it -v $PWD:/work swgbase
# cd both MMO dirs in /work/Core3 and make -j6 - builds binary in /bin/ of MMOCoreOrb
