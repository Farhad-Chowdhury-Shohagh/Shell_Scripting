#!/bin/bash
# Project 5: Log File Analyzer
# Counts errors, warnings, failed logins, and custom keyword matches.

read -p "Enter log file path: " LOG_FILE

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file does not exist."
    exit 1
fi

read -p "Enter keyword to search: " KEYWORD

ERROR_COUNT=$(grep -i "error" "$LOG_FILE" | wc -l)
WARNING_COUNT=$(grep -i "warning" "$LOG_FILE" | wc -l)
FAILED_LOGIN_COUNT=$(grep -Ei "failed|authentication failure|invalid password" "$LOG_FILE" | wc -l)
KEYWORD_COUNT=$(grep -i "$KEYWORD" "$LOG_FILE" | wc -l)
REPORT_FILE="log_analysis_report.txt"

{
echo "========== Log Analysis Report =========="
echo "Log File              : $LOG_FILE"
echo "Total Errors          : $ERROR_COUNT"
echo "Total Warnings        : $WARNING_COUNT"
echo "Failed Login Attempts : $FAILED_LOGIN_COUNT"
echo "Keyword '$KEYWORD'    : $KEYWORD_COUNT"
echo "Generated At          : $(date)"
echo "========================================="
} | tee "$REPORT_FILE"

echo "Report saved as $REPORT_FILE"
