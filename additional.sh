#!/usr/bin/env bash

git clone --recurse https://github.com/austinwhite/backup_bookmarks.git ~/.backup_bookmarks

# cronjobs
crontab -l > mycron

echo "00 */4 * * * cd ~/.backup_bookmarks && ./backup.sh" >> mycron

crontab mycron
rm mycron
