#!/usr/bin/env bash

git clone --recurse https://github.com/austinwhite/backup-brave-bookmarks ~/.backup_bookmarks
git clone --recurse https://github.com/austinwhite/backup-brave-preferences ~/.backup_preferences

# cronjobs
crontab -l > mycron

echo "00 */4 * * * cd ~/.backup_bookmarks && ./backup.sh" >> mycron
echo "00 */4 * * * cd ~/.backup_preferences && ./backup.sh" >> mycron

crontab mycron
rm mycron
