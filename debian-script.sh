#!/bin/bash

echo "===================update & upgrading systems==================="
sudo apt-get update && sudo apt-get upgrade -y

echo "===================installing essential tools==================="
sudo apt-get install vim openvpn wget curl xz-utils -y

echo "===================installing nodejs==================="
wget https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.xz

echo "===================unzipping nodejs==================="
tar -xvf node-v16.15.0-linux-x64.tar.xz

echo "===================moving nodejs to system==================="
sudo cp -r node-v16.15.0-linux-x64/{bin,include,lib,share} /usr/

echo "===================checking if nodejs installed correctly==================="
node --version

echo "===================installinig docker==================="
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "===================checking if docker installed correctly==================="
docker --version

echo "===================install portainer==================="
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.9.3
sudo docker ps



