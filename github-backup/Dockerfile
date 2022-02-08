#TAG docker.io/llalon/github-backup
FROM debian:bullseye-slim

RUN mkdir -p /home/docker/github-backup/config;
ENV HOME /home/docker

COPY requirements.txt /tmp/requirements.txt
COPY github-backup.py /app/github-backup.py
COPY config.json.example /home/docker/github-backup/config.json.example
COPY backup.sh /app/backup.sh

WORKDIR /tmp
RUN apt-get update && \
    apt-get install -y python3-pip python3 python-is-python3 git curl
RUN pip3 install --upgrade pip && \
    pip3 install -r /tmp/requirements.txt

WORKDIR /app
RUN chmod -R 777 /home/docker && \
    chmod +x /app/backup.sh && \
    chmod +x /app/github-backup.py

ENTRYPOINT ["bash", "/app/backup.sh"]
