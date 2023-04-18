<img src="https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/dockeraio.png" width="350"/>
<br>
<br>

> Docker all in one install script for linux machines or containers.<br>
> Just run the commands in the console as root user.

- Works on `Debian`,`Ubuntu`,`CentOS`,`Alpine`,`OpenSuse`
- You need to install curl on your system.
#### Paste the script in the machines console, thats all!
```bash
sh -c "$(curl -L http://gitlink.moelle.space/docker-aio)"
```

<br>
<br>
<details> 
<summary>Old, individual OS installation scripts </summary>

## Individual systems
### Alpine
First install curl on the machine
```bash
apk add curl
```
Then paste the script in the machines console
```bash
sh -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/alpine.sh)"
```
- I recommend using Alpine 3.15 and not 3.16. Alpine 3.16 creates OCI errors.
### Debian
First install curl and sudo on the machine
```bash
apt-get install curl sudo -y
```
Then paste the script in the machines console
```bash
bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/debian.sh)"
```
### Ubuntu
First install curl on the machine
```bash
apt-get install curl -y
```
Then paste the script in the machines console
```bash
bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/ubuntu.sh)"
```
### CentOS
Paste the script in the machines console
```bash
bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/centos.sh)"
```
</details> 