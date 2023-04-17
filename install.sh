#!/bin/bash

# Check if script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Check which Linux distribution is installed
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based system."
    DISTRO="debian"
elif [ -f /etc/redhat-release ]; then
    echo "Detected Red Hat-based system."
    DISTRO="redhat"
elif [ -f /etc/alpine-release ]; then
    echo "Detected Alpine Linux."
    DISTRO="alpine"
else
    echo "Unsupported Linux distribution."
    exit 1
fi

# Install Docker
echo "Installing Docker..."
if [ "$DISTRO" = "debian" ] || [ "$DISTRO" = "ubuntu" ]; then
    apt-get update
    apt-get install -y docker.io
elif [ "$DISTRO" = "redhat" ]; then
    yum install -y docker
elif [ "$DISTRO" = "alpine" ]; then
    apk add docker
fi

# Start Docker
echo "Starting Docker..."
systemctl start docker

# Install Docker Compose
read -p "Do you want to install Docker Compose? (y/n) " INSTALL_COMPOSE
if [ "$INSTALL_COMPOSE" = "y" ]; then
    echo "Installing Docker Compose..."
    if [ "$DISTRO" = "debian" ] || [ "$DISTRO" = "ubuntu" ]; then
        apt-get install -y docker-compose
    elif [ "$DISTRO" = "redhat" ]; then
        yum install -y epel-release
        yum install -y python-pip
        pip install docker-compose
    elif [ "$DISTRO" = "alpine" ]; then
        apk add py-pip
        pip install docker-compose
    fi
fi

echo "Docker and Docker Compose installation completed."
