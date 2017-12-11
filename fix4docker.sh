#!/bin/bash
DOCKER_SOCKET="/var/run/docker.sock"
DOCKER_GROUP="dockerhost"
HUBOT_USER="hubot"

if [ -S ${DOCKER_SOCKET} ]; then
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
    groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}
    usermod -aG ${DOCKER_GROUP} ${HUBOT_USER}
fi
