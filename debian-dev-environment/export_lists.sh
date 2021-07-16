#!/bin/bash

# Run this script on the host to generate package lists and source keys for the docker image

mkdir -p ./apt/sources/
mkdir -p ./apt/keys

dpkg --get-selections > ./apt/packages.list
cp -R /etc/apt/sources.list* ./apt/sources
apt-key exportall > ./apt/repo.keys
cp -R /usr/share/keyrings ./apt/keys
