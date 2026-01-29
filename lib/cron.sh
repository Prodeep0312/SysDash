#!/bin/bash

cron_menu() {
    yesno "Schedule weekly cleanup?" || return
    # m hr dayofmonth month dayofweek(0-6)
    (crontab -l 2>/dev/null; echo "0 3 * * 0 root $BASE_DIR/sysdash.sh --cleanup") | crontab -

    log_action "Scheduled weekly cron: $BASE_DIR/sysdash.sh"
    msgbox "Weekly cleanup scheduled (Sunday 3 AM)"
}
