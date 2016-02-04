#!/bin/bash

DOCKER_REGISTRY='docker.achinthagunasekara.com.au'
DOCKER_IMAGE='docker-site'
CONTAINER='docker-site-name'
HOST_PORT=80
DOCKER_PORT=80

function startContainer {
  docker pull $DOCKER_REGISTRY/$DOCKER_IMAGE
  docker run -d --name=oracle_docker -p $HOST_PORT:$DOCKER_PORT $DOCKER_REGISTRY/$DOCKER_IMAGE
}

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

if [ $? -eq 1 ]; then
  echo "UNKNOWN - $CONTAINER does not exist. Starting Container..."
  startContainer
fi

if [ "$RUNNING" == "false" ]; then
  echo "CRITICAL - $CONTAINER is not running. Starting Container..."
  startContainer
fi

GHOST=$(docker inspect --format="{{ .State.Ghost }}" $CONTAINER)

if [ "$GHOST" == "true" ]; then
  echo "WARNING - $CONTAINER has been ghosted. Starting Container..."
  startContainer
fi

STARTED=$(docker inspect --format="{{ .State.StartedAt }}" $CONTAINER)
NETWORK=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $CONTAINER)

echo "OK - $CONTAINER is running. IP: $NETWORK, Started at: $STARTED"
