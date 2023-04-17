#!/bin/bash

# Check if script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Check which Linux distribution is installed
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        echo "Detected Ubuntu."
        PACKAGE_MANAGER="apt-get-ubuntu"
    elif [[ "$ID" == "opensuse" ]]; then
        echo "Detected openSUSE."
        PACKAGE_MANAGER="zypper"
    elif [[ "$ID" == "debian" ]]; then
        echo "Detected Debian."
        PACKAGE_MANAGER="apt-get"
    elif [[ "$ID" == "alpine" ]]; then
        echo "Detected Alpine Linux."
        PACKAGE_MANAGER="apk"
    elif [[ "$ID" == "centos" ]]; then
        echo "Detected CentOS."
        PACKAGE_MANAGER="yum"
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi
else
    echo "Unsupported Linux distribution."
    exit 1
fi

# Install Docker
echo "Installing Docker..."
$PACKAGE_MANAGER update
$PACKAGE_MANAGER install -y docker

# Start Docker
echo "Starting Docker..."
systemctl start docker

# Enable Docker to start at boot
echo "Enabling Docker at boot..."
systemctl enable docker

# Install Docker Compose
read -p "Do you want to install Docker Compose? (y/n) " INSTALL_COMPOSE
if [ "$INSTALL_COMPOSE" == "y" ]; then
    echo "Installing Docker Compose..."
    if [ "$PACKAGE_MANAGER" == "apt-get" ] then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/debian.sh)"
    elif [ "$PACKAGE_MANAGER" == "apt-get-ubuntu" ]; then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/ubuntu.sh)"
    elif [ "$PACKAGE_MANAGER" == "zypper" ]; then
        sh -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/opensuse.sh)"
    elif [ "$PACKAGE_MANAGER" == "apk" ]; then
        sh -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/alpine.sh)"
    elif [ "$PACKAGE_MANAGER" == "yum" ]; then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/centos.sh)"
    fi
fi

echo "Docker and Docker Compose installation completed."