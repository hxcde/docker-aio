# Docker Auto Installer
Docker install scripts for Proxmox Containers.

Just run the command in the containers console.

## Alpine
```bash
apk add curl
sh -c "$(curl -L https://raw.githubusercontent.com/hxcde/Docker-Installer/main/alpine.sh)"
```
- I recommend using Alpine 3.15 and not 3.16. Alpine 3.16 creates OCI errors.
## Debian
```bash
apt-get install curl -y
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/debian.sh)"
```
## Ubuntu
```bash
apt-get install curl -y
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/ubuntu.sh)"
```
