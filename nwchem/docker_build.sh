#!/usr/bin/env bash
DOCKER_BUILDKIT=1 docker build --build-arg IMAGE=$1 -t rr --output=out . 
