# SWGEmu Development Environment

A local development and runtime environment setup for the SWGEmu project.  Builds inside of a docker container to provide the corect dependancies, but against a local volume mount to enable development directly against your local file system.  Uses docker-compose to run the local build and mysql database, with the database persistence also stored locally.  

## Setup

Setup only needs to be run once.

Requirements:
* docker
* docker-compose

To setup: `./setup.sh`

# Build

Clones of the upstream `Core3` and `engine3` repos are tracked as submodules, and cloned as part of setup.  Development can be done against these locally.

To build the `engine3` code, run `./engine3-build.sh`, but only needs to be done when incorporating upstream changes.

To build `Core3`, run `./build.sh`.  Only changes in the `Core3` directory will be built after the first compile.  So subsequent runs to incorporate your changes are fast.

You can also run `./refresh.sh` to compile and restart in one shot.

# Run

To run your latest build, run `./start.sh`

# Stop

To stop the running instance, run `./stop.sh`
