#!/bin/bash
echo Starting docker installation
apk add docker
rc-update add docker boot
service docker start
apk add docker-compose
echo Docker Installed
docker ps
