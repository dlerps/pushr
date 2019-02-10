#!/bin/sh

set -e

echo "Logging into Docker Hub"
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

echo "Publishing App"
export DOCKER_TAG=dlerps/pushr:latest
cd Pushr

docker build . -t $DOCKER_TAG
docker push $DOCKER_TAG