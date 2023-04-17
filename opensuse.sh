#!/bin/bash
zypper --non-interactive install docker
systemctl start docker
systemctl enable docker
zypper --non-interactive install python3-pip
pip3 install docker-compose
fi