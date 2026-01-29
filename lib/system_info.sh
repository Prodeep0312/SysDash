#!/bin/bash

# Show CPU load and RAM usage
show_cpu_ram() {
    CPU=$(uptime | awk -F'load average:' '{print $2}')
    RAM=$(free -h | awk '/Mem:/ {print "Used: "$3" / Total: "$2}')

    dialog --msgbox "CPU Load:\n$CPU\n\nRAM Usage:\n$RAM" 15 70
}

# Show disk usage
show_disk() {
    df -h > /tmp/disk.txt
    dialog --no-collapse --textbox /tmp/disk.txt 25 100
}

# Show general system information
system_info() {
    INFO=$(cat <<EOF
Hostname: $(hostname)
OS: $(source /etc/os-release && echo $PRETTY_NAME)
Kernel: $(uname -r)
Architecture: $(uname -m)
Uptime: $(uptime -p)
EOF
)
    dialog --msgbox "$INFO" 15 60
}

show_top_mem_processes() {
    MEM_LIST=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)
    dialog --title "Top 5 Memory-Hogging Processes" --msgbox "$MEM_LIST" 12 60
}
