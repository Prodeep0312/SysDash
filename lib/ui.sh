#!/bin/bash

require_root() {
    if [[ $EUID -ne 0 ]]; then
        dialog --msgbox "Run as root!" 6 30
        exit 1
    fi
}

check_dialog() {
    command -v dialog &>/dev/null || {
        echo "dialog not installed"
        exit 1
    }
}

msgbox() {
    dialog --msgbox "$1" 20 70
}

yesno() {
    dialog --yesno "$1" 10 50
    return $?
}

log_action() {
    echo "$(date '+%F %T') | $1" >> "$LOG_FILE"
}
