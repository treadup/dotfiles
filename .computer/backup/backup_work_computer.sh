#!/bin/bash

# SSH keys
cp -r ~/.ssh ~/work/ssh

# Password store
cp -r ~/.password-store/ ~/work/password-store/

# GPG keys
mkdir -p ~/work/gpg
gpg -a --export henrik@trell.se > ~/work/gpg/henrik-work-public-gpg.key
gpg -a --export-secret-key henrik@trell.se > ~/work/gpg/henrik-work-secret-gpg.key
gpg --export-ownertrust > ~/work/gpg/henrik-work-ownertrust-gpg.txt

# Wallpapers
cp -r ~/Pictures/wallpapers/ ~/work/wallpapers

# Backup work folder
zip -r ~/work_computer_backup.zip ~/work/
