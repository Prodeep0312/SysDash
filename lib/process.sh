#!/bin/bash

process_menu() {
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -15 > /tmp/process.txt

    dialog --no-collapse --textbox /tmp/process.txt 20 80

    PID=$(dialog --stdout --inputbox "Enter PID to kill (blank to cancel):" 8 50)
    [[ -z "$PID" ]] && return

    if yesno "Kill process $PID?"; then
        kill "$PID" && log_action "Killed process PID=$PID"
	msgbox "Process $PID killed."
    fi
}
