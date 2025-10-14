#!/bin/bash

if [ -z "$1" ] ; then
echo "error: To use: $0 <log> example: $0 var/log "
exit 1
fi


if [ ! -d "$1" ] ; then
echo "error: directory not found 404"
exit 1
fi

ARCHIVE_DIR="./log-backup"
mkdir -p "$ARCHIVE_DIR"

DATE=$(date +"%Y%m%d")
ARCHIVE_NAME="log_backup_${DATE}.tar.gz"

tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$1" .

echo "$(date): File created $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$ARCHIVE_DIR/log.txt"

echo "logs saved"