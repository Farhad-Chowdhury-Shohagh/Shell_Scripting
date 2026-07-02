#!/bin/bash
# Project 2: System Health Monitor
# Shows CPU load, memory usage, disk usage, and top processes.

LOG_FILE="system_health_report.log"
DATE_TIME=$(date)
CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}')
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

{
echo "========== System Health Report =========="
echo "Date/Time      : $DATE_TIME"
echo "CPU Load       : $CPU_LOAD"
echo "Memory Usage   : $MEMORY_USAGE%"
echo "Disk Usage(/)  : $DISK_USAGE"
echo ""
echo "Top 5 Processes by Memory:"
ps aux --sort=-%mem | head -n 6
echo "=========================================="
echo ""
} | tee -a "$LOG_FILE"

DISK_NUM=${DISK_USAGE%%%}
if [ "$DISK_NUM" -ge 80 ]; then
    echo "Warning: Disk usage is high!" | tee -a "$LOG_FILE"
fi
