#!/bin/bash
#this will backup the db in zip file and delete the file after 30days

/usr/bin/mysqldump -u root -p'~!Yamaha@123#' yamaha_live | gzip >/db-backup/yamaha_live-`date +%Y-%m-%d_%H-%M-%S`.sql.gz

find /db-backup -type f -mtime +30 –delete

#for unzip this file used this cmd
#gunzip yamaha.live-`date +%Y-%m-%d_%H-%M-%S`.sql.gz




###add this in cronjob run this cmd and add
# crontab -e

#daily @12AM
0 0 * * * sh /db-backup/db-backup.sh
