#!/bin/bash

user_sessions() {
    who > /tmp/users.txt
    dialog --textbox /tmp/users.txt 15 60
}
