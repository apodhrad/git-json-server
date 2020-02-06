#!/bin/sh
TAG="0.2"
DOCKER_IMAGE_NAME=docker.io/apodhrad/git-json-server

docker rmi --force=true ${DOCKER_IMAGE_NAME}:${TAG}
docker build --force-rm=true --rm=true -t ${DOCKER_IMAGE_NAME}:${TAG} .

echo =========================================================================
echo Docker image is ready.  Try it out by running the following command:
echo     docker run -it --rm -p 3000:3000 --network=host --name=git-json-server -e SSH_KEY_URL={SSH_KEY_URL} -e GIT_REPOSITORY={GIT_REPOSITORY} ${DOCKER_IMAGE_NAME}:${TAG}
echo =========================================================================
