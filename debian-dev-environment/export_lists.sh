#!/bin/bash

# Run this script on the host to generate package lists and source keys for the docker image

mkdir -p ./apt/sources/
mkdir -p ./apt/keyrings

dpkg --get-selections > ./apt/packages.list
cp -rv /etc/apt/sources.list* ./apt/sources
apt-key exportall > ./apt/repo.keys
cp -rv /usr/share/keyrings/* ./apt/keyrings/

debconf-get-selections > ./apt/debconf-selections
