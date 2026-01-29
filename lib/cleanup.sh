#!/bin/bash

cleanup_menu() {
    CHOICE=$(dialog --stdout --menu "Cleanup Tasks" 15 60 5 \
        1 "Clear Package Cache" \
        2 "Clear /tmp")

    case "$CHOICE" in
        1)
            yesno "Clear package cache?" || return
            dialog --gauge "Cleaning package cache..." 10 60 0 &
            apt clean &>/dev/null || dnf clean all &>/dev/null
            sleep 2
            kill $!
	        log_action "Performed cleanup: package cache cleared"
            msgbox "Package cache cleared."
            ;;
        2)
            yesno "Delete files in /tmp?" || return
            rm -rf /tmp/*
	        log_action "Performed cleanup: /tmp directory cleared"
            msgbox "/tmp cleaned."
            ;;
    esac
}
