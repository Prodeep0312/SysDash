#!/bin/bash

service_menu() {
    SERVICE=$(systemctl list-units --type=service --state=running \
        | awk '{print $1}' | sed 1d | head -20)

    CHOICE=$(dialog --stdout --menu "Running Services" 20 70 10 \
        $(echo "$SERVICE" | awk '{print NR, $1}'))

    [[ -z $CHOICE ]] && return

    SERVICE_NAME=$(echo "$SERVICE" | sed -n "${CHOICE}p")

    if yesno "Restart $SERVICE_NAME?"; then
        systemctl restart "$SERVICE_NAME"
	log_action "Restarted service: $SERVICE_NAME"
        msgbox "$SERVICE_NAME restarted."
    fi
}
