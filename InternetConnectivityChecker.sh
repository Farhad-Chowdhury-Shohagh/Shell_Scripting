#!/bin/bash
# Project 7: Internet Connectivity Checker
# Checks internet connectivity and saves status in log file.

LOG_FILE="internet_status.log"
read -p "Enter website/domain to ping [default: google.com]: " SITE
SITE=${SITE:-google.com}

if ping -c 3 "$SITE" > /dev/null 2>&1; then
    STATUS="Connected"
else
    STATUS="Disconnected"
fi

echo "$(date) - Internet Status: $STATUS - Checked Site: $SITE" | tee -a "$LOG_FILE"
