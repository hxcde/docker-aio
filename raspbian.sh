#!/bin/bash

# Aktualisiere das Paketsystem
sudo apt update

# Installiere Abhängigkeiten
sudo apt install -y apt-transport-https ca-certificates software-properties-common

# Füge Docker GPG-Schlüssel hinzu
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Füge Docker Repository hinzu
echo "deb [arch=armhf] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Aktualisiere das Paketsystem erneut und installiere Docker
sudo apt update
sudo apt install -y docker-ce

# Aktiviere und starte den Docker Dienst
sudo systemctl enable docker
sudo systemctl start docker

# Installieren Docker Compose
sudo apt install -y docker-compose

# Zeige installierte Versionen
docker --version
docker-compose --version

echo "Docker und Docker Compose wurden erfolgreich installiert."