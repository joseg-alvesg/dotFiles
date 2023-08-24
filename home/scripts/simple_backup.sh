#!/usr/bin/env sh

backup_path="/home/backup"
external_path="/mnt/backup"
log_path="/var/log/simple_backup.log"

date_format=$(date "+%d-%m-%Y")
backup_file="backup_$date_format.tar."

if ! mountpoint -q -- "$external_path"; then
    printf "[$date_format] External drive not mounted.\n" >> "$log_path"
    exit 1
fi

if tar -czSpf "$external_path/$backup_file" "$backup_path"; then
  printf "[$date_format] Backup successful.\n" >> "$log_path"
else
  printf "[$date_format] Backup failed.\n" >> "$log_path"
fi

find "$external_path" -mtime +10 -delete
