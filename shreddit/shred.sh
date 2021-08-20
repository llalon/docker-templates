#!/bin/sh

# If config doesn't exist yet, create it
if [ ! -f /home/docker/config/shreddit.yml ]; then
    cp /home/docker/Shreddit/shreddit.yml.example /home/docker/config/shreddit.yml
fi

# Update config
cp /home/docker/config/shreddit.yml /home/docker/shreddit.yml

# Insert tokens into file
mkdir -p /home/docker/.config
AUTH_FILE=/home/docker/.config/praw.ini
echo "[default]" > ${AUTH_FILE}
echo "client_id=${CLIENT_ID}" >> ${AUTH_FILE}
echo "client_secret=${CLIENT_SECRET}" >> ${AUTH_FILE}
echo "username=${USERNAME}" >> ${AUTH_FILE}
echo "password=${PASSWORD}" >> ${AUTH_FILE}

# Start backup
while true
 do shreddit -c /home/docker/shreddit.yml
 sleep "${SCHEDULE}"
done