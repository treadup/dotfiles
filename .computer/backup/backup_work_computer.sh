#!/bin/bash

# SSH keys
cp -r ~/.ssh ~/work/ssh

# GPG keys
mkdir -p ~/work/gpg
gpg -a --export henrik@trell.se > ~/work/gpg/henrik-work-public-gpg.key
gpg -a --export-secret-key henrik@trell.se > ~/work/gpg/henrik-work-private-gpg.key
gpg --export-owner-trust > ~/work/gpg/henrik-work-owner-trust-gpg.txt

# Backup work folder
zip ~/work_computer_backup.zip ~/work/
