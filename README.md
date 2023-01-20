# Docker Auto Installer
Docker install scripts for Proxmox Containers.

Just run the command in the containers console.

## Alpine
First install curl on the container
```bash
apk add curl
```
Then paste the script in the containers console
```bash
sh -c "$(curl -L https://raw.githubusercontent.com/hxcde/Docker-Installer/main/alpine.sh)"
```
- I recommend using Alpine 3.15 and not 3.16. Alpine 3.16 creates OCI errors.
## Debian
First install curl on the container
```bash
apt-get install curl -y
```
Then paste the script in the containers console
```bash
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/debian.sh)"
```
## Ubuntu
First install curl on the container
```bash
apt-get install curl -y
```
Then paste the script in the containers console
```bash
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/ubuntu.sh)"
```
