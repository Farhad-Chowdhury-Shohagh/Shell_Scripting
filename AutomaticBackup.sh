#!/bin/bash
# Project 3: Automatic Backup Script
# Creates a compressed backup of a selected folder.

read -p "Enter source folder path: " SOURCE_DIR
read -p "Enter backup destination folder path: " BACKUP_DIR

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source folder does not exist."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

DATE_TIME=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$DATE_TIME.tar.gz"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "Backup failed."
fi
