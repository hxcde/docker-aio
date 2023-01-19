echo Starting docker installation
apk add docker -y
rc-update add docker boot
service docker start
apk add docker-compose -y
echo Docker Installed
docker ps
