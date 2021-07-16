# Debian Development Environment

Creates a copy of your local machine in a docker image. Used to quickly run a copy of your local development environment in the cloud.

Prior to building the container, generate package and source/key lists of the current running environment:
```bash
./export_lists.sh
```