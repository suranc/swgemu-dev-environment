FROM ubuntu:16.04

RUN apt update && apt -y install build-essential libmysqlclient-dev liblua5.3-dev libdb5.3-dev libssl-dev cmake git default-jre libboost-all-dev
