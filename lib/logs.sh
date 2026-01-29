log_menu() {
    CHOICE=$(dialog --stdout \
        --no-collapse \
        --menu "Log Viewer" 20 100 5 \
        1 "System Journal (Errors)" \
        2 "Auth Log")

    case "$CHOICE" in
        1)
            journalctl -p err -n 50 > /tmp/journal.txt
            dialog --no-collapse --textbox /tmp/journal.txt 30 120
            ;;
        2)
            [[ -f /var/log/auth.log ]] || msgbox "auth.log not found"
            dialog --no-collapse --textbox /var/log/auth.log 30 120
            ;;
    esac
}

