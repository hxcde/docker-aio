#!/bin/bash

# Docker-aio ascii
curl https://git.moelle.space/hxcde/docker-aio/raw/branch/main/ascii

# Check if script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Check which Linux distribution is installed
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ]; then
        echo "Detected Ubuntu."
        PACKAGE_MANAGER="apt-get-ubuntu"
    elif [ "$ID" = "opensuse" ]; then
        echo "Detected openSUSE."
        PACKAGE_MANAGER="zypper"
    elif [ "$ID" = "raspbian" ]; then
        echo "Detected Raspbian."
        PACKAGE_MANAGER="apt-get-raspbian"
    elif [ "$ID" = "debian" ]; then
        echo "Detected Debian."
        PACKAGE_MANAGER="apt-get"
    elif [ "$ID" = "alpine" ]; then
        echo "Detected Alpine Linux."
        PACKAGE_MANAGER="apk"
    elif [ "$ID" = "centos" ]; then
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
read -p "Do you want to install Docker? (y/n) " INSTALL_DOCKER
if [ "$INSTALL_DOCKER" = "y" ]; then
    echo "Installing Docker ..."
    if [ "$PACKAGE_MANAGER" = "apt-get" ]; then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-aio/raw/branch/main/debian.sh)"
    elif [ "$PACKAGE_MANAGER" = "apt-get-ubuntu" ]; then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-aio/raw/branch/main/ubuntu.sh)"
    elif [ "$PACKAGE_MANAGER" = "apt-get-raspbian" ]; then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-aio/raw/branch/main/raspbian.sh)"    
    elif [ "$PACKAGE_MANAGER" = "zypper" ]; then
        sh -c "$(curl -L https://git.moelle.space/hxcde/docker-aio/raw/branch/main/opensuse.sh)"
    elif [ "$PACKAGE_MANAGER" = "apk" ]; then
        sh -c "$(curl -L https://git.moelle.space/hxcde/docker-aio/raw/branch/main/alpine.sh)"
    elif [ "$PACKAGE_MANAGER" = "yum" ]; then
        bash -c "$(curl -L https://git.moelle.space/hxcde/docker-aio/raw/branch/main/centos.sh)"
    fi
fi

echo "Completed!"