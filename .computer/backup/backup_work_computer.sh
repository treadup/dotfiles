#!/bin/bash

# SSH keys
cp -r ~/.ssh ~/work/ssh

# GPG keys
mkdir -p ~/work/gpg
gpg -a --export henrik@trell.se > ~/work/gpg/henrik-work-public-gpg.key
gpg -a --export-secret-key henrik@trell.se > ~/work/gpg/henrik-work-private-gpg.key
gpg --export-ownertrust > ~/work/gpg/henrik-work-owner-trust-gpg.txt

# Wallpapers
cp -r ~/Pictures/wallpapers/ ~/work/wallpapers

# Backup work folder
zip -r ~/work_computer_backup.zip ~/work/
