#!/usr/bin/env bash
echo docker_build.sh arg11 is $1
DOCKER_BUILDKIT=1 docker build --shm-size 256m --build-arg IMAGE=$1 -t rr --output=out . 
