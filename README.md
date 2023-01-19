# Docker Auto Installer
Docker install scripts for Proxmox Containers

## Alpine
sh -c "$(curl -L https://raw.githubusercontent.com/hxcde/Docker-Installer/main/alpine.sh)"
- If there is an error because curl is missing, install it with 'apk add curl'

## Debian
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/debian.sh)"
- If there is an error because curl is missing, install it with 'apt-get install curl'
