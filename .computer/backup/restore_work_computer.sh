#!/bin/bash

# SSH keys
cp -r ~/work/ssh ~/.ssh

# Password store
cp -r ~/work/password-store ~/.password-store

# GPG keys
gpg --import ~/work/gpg/henrik-work-secret-gpg.key
gpg --import-ownertrust ~/work/gpg/henrik-work-ownertrust-gpg.txt

# Wallpapers
mkdir -p ~/Pictures/wallpapers
cp -r ~/work/wallpapers/ ~/Pictures/wallpapers/
