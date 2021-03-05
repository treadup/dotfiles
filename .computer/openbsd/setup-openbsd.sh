#!/bin/sh

# Check if we are running as root
if [ $(id -u) != 0 ]; then
    echo This script needs to be run as root.
    echo Execute this script as root
    exit 1
fi

echo ------------------------------------------------
echo Creating user
echo ------------------------------------------------

if [ $(id -u henrik) ]; then
    echo User henrik exists
else
    echo Creating user henrik
    useradd -G wheel -m henrik
fi

echo ------------------------------------------------
echo Setup authorized_keys for user henrik
echo ------------------------------------------------

mkdir -p /home/henrik/.ssh
chown henrik:henrik /home/henrik/.ssh
if [ -f /root/.ssh/authorized_keys ]; then
    echo Using root authorized_keys file for user henrik
    cp /root/.ssh/authorized_keys /home/henrik/.ssh/
    chown henrik:henrik /home/henrik/.ssh/authorized_keys
fi

echo ------------------------------------------------
echo Installing base packages
echo ------------------------------------------------

echo Installing git
pkg_add git

echo ------------------------------------------------
echo Installing shells
echo ------------------------------------------------

echo Installing fish
pkg_add fish

echo ------------------------------------------------
echo Installing command line tools
echo ------------------------------------------------

echo Installing zip
pkg_add zip

echo Installing ag
pkg_add the_silver_searcher

echo ------------------------------------------------
echo Finished
echo ------------------------------------------------
echo This script has now finsihed setting up OpenBSD
