#!/bin/sh

# Check if we are running as root
if [ $(id -u) != 0 ]; then
    echo This script needs to be run as root.
    echo Execute this script as root
    exit 1
fi

echo -------------------------------
echo Updating FreeBSD
echo -------------------------------
# Apply security patches to freebsd
# env PAGER=cat freebsd-update fetch
# freebsd-update install

echo -------------------------------
echo Creating user
echo -------------------------------

if [ $(cat /etc/group | cut -d: -f1 | grep henrik) ]; then
    echo Group henrik exists
else
    echo Creating group henrik
    pw groupadd henrik
fi

if [ $(id -u henrik) ]; then
    echo User henrik exists
else
    echo Creating user henrik
    pw user add -n henrik -c "Henrik Treadup" -g henrik -G wheel -m
fi

echo -------------------------------------
echo Setup authorized_keys for user henrik
echo -------------------------------------

mkdir -p /home/henrik/.ssh
chown henrik:henrik /home/henrik/.ssh
if [ -f /root/.ssh/authorized_keys ]; then
    echo Using root authorized_keys file for user henrik
    cp /root/.ssh/authorized_keys /home/henrik/.ssh/
    chown henrik:henrik /home/henrik/.ssh/authorized_keys
fi

echo -------------------------------------
echo Installing base packages
echo -------------------------------------

echo Installing git
pkg install -y git

echo -------------------------------------
echo Installing shells
echo -------------------------------------

echo Installing fish
pkg install -y fish

echo -------------------------------------
echo Installing command line tools
echo -------------------------------------

echo Installing zip
pkg install -y zip unzip

echo Installing ag
pkg install -y the_silver_searcher

echo -------------------------------------
echo Finished
echo -------------------------------------
echo This script has now finsihed setting up FreeBSD
