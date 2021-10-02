#!/bin/bash

set -e
set -u

COMPUTER="henrik@oak.mountainrainforest.org"
TAR_COMMAND="tar -X .oak_backup_exclude  -czvf - . 2> ~/.sshbackup.log"

BACKUP_DIR=/backups/oak
mkdir -p $BACKUP_DIR
BACKUP_FILENAME="$BACKUP_DIR/oak$(date +%Y%m%d-%H%M).tar.gz"
echo Copying over exclude file
scp ~/.computer/scripts/backups/oak_backup_exclude.txt $COMPUTER:~/.oak_backup_exclude
echo "Creating backup $BACKUP_FILENAME"
ssh $COMPUTER "$TAR_COMMAND" > $BACKUP_FILENAME
