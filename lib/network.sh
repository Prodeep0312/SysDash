#!/bin/bash

network_menu() {
    INFO=$(ip -br addr)
    ROUTES=$(ip route | head -n 5)

    dialog --no-collapse --msgbox \
"Interfaces:
$INFO

Routes:
$ROUTES" 20 90
}
