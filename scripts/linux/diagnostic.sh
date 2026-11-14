#!/usr/bin/env bash
# Linux workstation diagnostic: writes a text report in the current folder.
report="diagnostic_$(hostname)_$(date +%Y%m%d_%H%M).txt"
{
    echo "=== DIAGNOSTIC $(hostname) - $(date) ==="
    echo "--- System ---"
    echo "OS: $(. /etc/os-release && echo "$PRETTY_NAME")"
    echo "Uptime: $(uptime -p)"
    free -h
    echo "--- Disks ---"
    df -h -x tmpfs -x devtmpfs
    echo "--- Network ---"
    ip -brief address
    ip route | grep default
    if ping -c 2 -q 8.8.8.8 >/dev/null; then echo "Internet: OK"; else echo "Internet: KO"; fi
    echo "--- Top 5 processes by memory ---"
    ps -eo comm,%mem --sort=-%mem | head -6
} | tee "$report"