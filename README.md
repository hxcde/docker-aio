# Docker Auto Installer
Docker install scripts for linux machines or containers.

Just run the commands in the console as root.

## Alpine
First install curl on the machine
```bash
apk add curl
```
Then paste the script in the machines console
```bash
sh -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/alpine.sh)"
```
- I recommend using Alpine 3.15 and not 3.16. Alpine 3.16 creates OCI errors.
## Debian
First install curl on the machine
```bash
apt-get install curl -y
```
Then paste the script in the machines console
```bash
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/debian.sh)"
```
## Ubuntu
First install curl on the machine
```bash
apt-get install curl -y
```
Then paste the script in the machines console
```bash
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/ubuntu.sh)"
```
## CentOS
Paste the script in the machines console
```bash
bash -c "$(curl -L https://raw.githubusercontent.com/hxcde/docker-auto-installer/main/centos.sh)"
```
