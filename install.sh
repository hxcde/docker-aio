#!/bin/bash

# This script installs Docker and Docker Compose on a Linux system.
# It detects the Linux distribution (Ubuntu, Debian, CentOS, Alpine, or openSUSE) and installs the packages accordingly.
# The script also asks the user if they want to install Docker Compose.

# Function to install Docker on Ubuntu and Debian
install_docker_deb() {
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
  curl -fsSL https://download.docker.com/linux/${1}/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/${1} $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io || { echo "Unable to install 'docker-ce'. Exiting."; exit 1; }
}

# Function to install Docker on CentOS
install_docker_centos() {
  sudo yum install -y yum-utils device-mapper-persistent-data lvm2
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  sudo yum install -y docker-ce docker-ce-cli containerd.io
  sudo systemctl enable docker
  sudo systemctl start docker
}

# Function to install Docker on Alpine
install_docker_alpine() {
  sudo apk add --no-cache docker
  sudo rc-update add docker boot
  sudo service docker start
}

# Function to install Docker on openSUSE
install_docker_opensuse() {
  sudo zypper install -y docker
  sudo systemctl enable docker
  sudo systemctl start docker
}

# Function to install Docker Compose
install_docker_compose() {
  LATEST_COMPOSE_VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
  sudo curl -L "https://github.com/docker/compose/releases/download/${LATEST_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

echo "Detecting Linux distribution..."
DISTRO=""
if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRO=$ID
elif [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  DISTRO=$DISTRIB_ID
else
  echo "Unsupported Linux distribution."
  exit 1
fi

echo "Detected Linux distribution: $DISTRO"

case "$DISTRO" in
  "ubuntu" | "debian")
    echo "Installing Docker on $DISTRO..."
    install_docker_deb $DISTRO
    ;;
  "centos")
    echo "Installing Docker on CentOS..."
    install_docker_centos
    ;;
  "alpine")
    echo "Installing Docker on Alpine..."
    install_docker_alpine
    ;;
  "opensuse" | "opensuse-leap" | "opensuse-tumbleweed")
    echo "Installing Docker on openSUSE..."
    install_docker_opensuse
