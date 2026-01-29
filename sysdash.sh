#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$BASE_DIR/config/sysdash.conf"
source "$BASE_DIR/lib/ui.sh"
source "$BASE_DIR/lib/system_info.sh"
source "$BASE_DIR/lib/services.sh"
source "$BASE_DIR/lib/logs.sh"
source "$BASE_DIR/lib/cleanup.sh"
source "$BASE_DIR/lib/cron.sh"
source "$BASE_DIR/lib/network.sh"
source "$BASE_DIR/lib/process.sh"
source "$BASE_DIR/lib/users.sh"
mkdir -p "$(dirname "$LOG_FILE")"

require_root
check_dialog

while true; do
    CHOICE=$(dialog --clear --stdout \
        --title "System Maintenance & Health Dashboard" \
        --menu "Select an option:" 22 75 12 \
        1  "CPU / RAM Usage" \
        2  "Disk Usage" \
        3  "Running Services" \
        4  "Log Viewer" \
        5  "Cleanup Tasks" \
        6  "Network Status" \
        7  "Process Manager" \
        8  "System Information" \
        9  "User Sessions" \
        10 "Schedule Tasks (Cron)" \
 	    11 "Top Memory Processes" \
        0  "Exit")

    case "$CHOICE" in
        1) show_cpu_ram ;;
        2) show_disk ;;
        3) service_menu ;;
        4) log_menu ;;
        5) cleanup_menu ;;
        6) network_menu ;;
        7) process_menu ;;
        8) system_info ;;
        9) user_sessions ;;
        10) cron_menu ;;
	    11) show_top_mem_processes ;;
        0|*) clear; exit 0 ;;
    esac
done
