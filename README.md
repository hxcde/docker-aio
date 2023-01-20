# Docker Auto Installer
Docker install scripts for Proxmox Containers

## Alpine
sh -c "$(curl -L https://raw.githubusercontent.com/hxcde/Docker-Installer/main/alpine.sh)"
- If there is an error because curl is missing, install it with 'apk add curl'
- I recommend using Alpine 3.15 and not 3.16. Alpine 3.16 creates OCI errors.
## Debian
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/debian.sh)"
- If there is an error because curl is missing, install it with 'apt-get install curl'
## Ubuntu
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/ubuntu.sh)"
- If there is an error because curl is missing, install it with 'apt-get install curl'
