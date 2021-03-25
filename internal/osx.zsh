#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

if ! core::exists terminal-notifier; then core::install terminal-notifier; fi

function notify::internal::notify::popup {
    # $1 subtitle of the notification (the command that was executed)
    # $2 the message for the notification
    # $3 the icon for the notification popup
    terminal-notifier -title "Long running command" -subtitle "${1}" \
        -message "${2}" -activate "${_ZSH_NOTIFY_TERMINAL_BUNDLE}" \
        -appIcon "${ZSH_NOTIFY_ASSETS_PATH}/${3}"
}
