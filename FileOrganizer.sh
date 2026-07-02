#!/bin/bash
# Project 1: Automatic File Organizer
# Organizes files in a target directory by file type.

read -p "Enter directory path to organize: " TARGET_DIR

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

cd "$TARGET_DIR" || exit

mkdir -p Images PDFs Videos Documents Archives Music Scripts Others

for file in *; do
    [ -f "$file" ] || continue

    case "${file##*.}" in
        jpg|jpeg|png|gif|bmp|webp) mv "$file" Images/ ;;
        pdf) mv "$file" PDFs/ ;;
        mp4|mkv|avi|mov|flv) mv "$file" Videos/ ;;
        doc|docx|txt|ppt|pptx|xls|xlsx|csv) mv "$file" Documents/ ;;
        zip|rar|tar|gz|7z) mv "$file" Archives/ ;;
        mp3|wav|aac|flac) mv "$file" Music/ ;;
        sh|py|js|html|css|java|c|cpp) mv "$file" Scripts/ ;;
        *) mv "$file" Others/ ;;
    esac
done

echo "Files organized successfully."
