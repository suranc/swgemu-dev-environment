# SWGEmu Development Environment

A local development and runtime environment setup for the SWGEmu project.  Builds inside of a docker container to provide the corect dependancies, but against a local volume mount to enable development directly against your local file system.  Uses docker-compose to run the local build and mysql database, with the database persistence also stored locally.  

## Setup

Setup only needs to be run once.

Requirements:
* linux
* docker
* docker-compose

To setup: `./setup.sh`

# Build

The upstream `Core3` repo is cloned and tracked as a submodule.  Development can be done locally against this clone, or you can symlink your `Core3` working directory into this location.

Run `./build.sh` to build Core3.  Only changes in the `Core3` directory will be built after the first compile.  So subsequent runs to incorporate your changes are fast.

You can also run `./refresh.sh` to compile your latest changes and restart a running SWGEmu server in one shot.

# Run

To run your latest build, run `./start.sh`

# Stop

To stop the running instance, run `./stop.sh`
