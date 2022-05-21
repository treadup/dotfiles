#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Check if we are running with root permissions
if [ $EUID -ne 0 ]; then
    echo This script must be run with root permissions.
    echo Execute this script as root or using sudo.
    exit 1
fi

echo ---------------------------------
echo Upgrading system
echo ---------------------------------

# Run all Ubuntu commands non interactively
export DEBIAN_FRONTEND=noninteractive

echo Updating apt
apt-get --yes update

echo Upgrading system
apt-get --yes upgrade

echo --------------------------------
echo Install Docker
echo --------------------------------

echo Installing Docker prerequesites
apt-get install ca-certificates curl gnupg lsb-release

echo Add dockers GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

printf "deb [arch=$(dpkg --print-architecture) " > /etc/apt/sources.list.d/docker.list
printf "signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] " >> /etc/apt/sources.list.d/docker.list
printf "https://download.docker.com/linux/ubuntu " >> /etc/apt/sources.list.d/docker.list
echo "$(lsb_release -cs) stable" >> /etc/apt/sources.list.d/docker.list
 
echo Updating source with new repo info
apt-get --yes update

echo Installing Docker
apt-get --yes install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo Add user henrik to docker group
usermod -a -G docker henrik


echo --------------------------------
echo Install Minikube
echo --------------------------------

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb

echo --------------------------------
echo Instructions
echo --------------------------------

echo You might have to change the permissions on the docker socket
echo to be able to run minikube start
echo
echo sudo chmod 666 /var/run/docker.sock
echo
echo Run the following command to start Docker
echo systemctl start docker
echo 
echo Run the following command to start minikube
echo minikube start

