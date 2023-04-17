# Docker Auto Installer
Docker install scripts for linux machines or containers.
Just run the commands in the console as root user.

- Installs automaticly on `Debian`,`Ubuntu`,`CentOS`,`Alpine`,`openSUSE`
- You need to install curl and sudo on your system.
- The script will ask if you want to install Docker Compose.
```bash
sh -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/install.sh)"
```

<br>
<br>

## Older version below
## Alpine
First install curl on the machine
```bash
apk add curl
```
Then paste the script in the machines console
```bash
sh -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/alpine.sh)"
```
- I recommend using Alpine 3.15 and not 3.16. Alpine 3.16 creates OCI errors.
## Debian
First install curl and sudo on the machine
```bash
apt-get install curl sudo -y
```
Then paste the script in the machines console
```bash
bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/debian.sh)"
```
## Ubuntu
First install curl on the machine
```bash
apt-get install curl -y
```
Then paste the script in the machines console
```bash
bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/ubuntu.sh)"
```
## CentOS
Paste the script in the machines console
```bash
bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/centos.sh)"
```