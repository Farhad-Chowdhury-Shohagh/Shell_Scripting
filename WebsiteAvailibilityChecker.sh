#!/bin/bash
# Project 9: Website Availability Monitor
# Checks whether websites are UP or DOWN.

LOG_FILE="website_status.log"

read -p "Enter websites separated by space: " WEBSITES

for WEBSITE in $WEBSITES; do
    STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$WEBSITE")

    if [ "$STATUS_CODE" -ge 200 ] && [ "$STATUS_CODE" -lt 400 ]; then
        STATUS="UP"
    else
        STATUS="DOWN"
    fi

    echo "$(date) - $WEBSITE is $STATUS - HTTP Code: $STATUS_CODE" | tee -a "$LOG_FILE"
done
