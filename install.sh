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
    bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/debian.sh)"
elif [ "$DISTRO" = "redhat" ]; then
    bash -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/centos.sh)"
elif [ "$DISTRO" = "alpine" ]; then
    sh -c "$(curl -L https://git.moelle.space/hxcde/docker-auto-installer/raw/branch/main/alpine.sh)"
fi

# Start Docker
echo "Starting Docker..."
systemctl start docker

echo "Docker and Docker Compose installation completed."
