#!/bin/bash

APP_DIR="/app"
HOME_DIR="/home/docker"

mkdir -p ${HOME_DIR}/.config/
mkdir -p ${APP_DIR}/config/

# If config doesn't exist yet, create it
if [ ! -f ${APP_DIR}/config/shreddit.yml ]; then
    shreddit -g
    cp ${APP_DIR}/shreddit.yml ${APP_DIR}/config/shreddit.yml
fi

# Update config
cp ${APP_DIR}/config/shreddit.yml ${APP_DIR}/shreddit.yml

# Insert tokens into file
AUTH_FILE=${HOME_DIR}/.config/praw.ini

echo "[default]" > ${AUTH_FILE}
echo "client_id=${CLIENT_ID}" >> ${AUTH_FILE}
echo "client_secret=${CLIENT_SECRET}" >> ${AUTH_FILE}
echo "username=${USERNAME}" >> ${AUTH_FILE}
echo "password=${PASSWORD}" >> ${AUTH_FILE}

# Start backup
while true
do shreddit -c ${APP_DIR}/shreddit.yml
    sleep "${SCHEDULE}"
done