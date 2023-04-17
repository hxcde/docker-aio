#!/bin/bash
# This script installs Docker and Docker Compose on a Linux system.
# It detects the Linux distribution (Ubuntu, Debian, CentOS, Alpine, or openSUSE) and installs the packages accordingly.
# The script also asks the user if they want to install Docker Compose.

# Function to install Docker on Ubuntu and Debian
install_docker_deb() {
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/${1}/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/${1} $(lsb_release -cs) stable"
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
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
    ;;
  *)
    echo "Unsupported Linux distribution."
    exit 1
    ;;
esac

echo "Docker installed successfully."

# Prompt user for Docker Compose installation
while true; do
  read -p "Do you want to install Docker Compose? (y/n): " yn
  case $yn in
    [Yy]* )
      echo "Installing
