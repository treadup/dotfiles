# Backups
Backups can be run on a normal Linux machine using SSH and tar. First
create a folder called /backups and change the owner of that folder
to the current user.

    mkdir /backups
    chown henrik:henrik /backups

This is a non standard folder location but it works for me.

Next create a script that will backup the remote computer. For example
if you want to backup oak then you might have the script backup-oak.sh
somewhere.

Run this script at regular intervals with cron. To do this we have to
edit the crontab file and add our script.

To edit the crontab file use the following command.

    crontab -e

The file should contain a line like the following.

    0 4 * * * /home/henrik/.computer/scripts/backups/backup-oak.sh

The above cron pattern means run the script at 04:00 every day.
