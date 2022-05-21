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
echo Install kubectl
echo --------------------------------

echo Installing kubectl prerequisites
apt-get install -y apt-transport-https ca-certificates curl

echo Download Google Public Signing Key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo Add Kubernetes apt repository
printf "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] " > /etc/apt/sources.list.d/kubernetes.list
echo "https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
cat /etc/apt/sources.list.d/kubernetes.list

echo Installing kubectl
sudo apt-get update
sudo apt-get install -y kubectl

echo ---------------------------------------
echo Installing Kubernetes implementation
echo ---------------------------------------

echo Installing k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

