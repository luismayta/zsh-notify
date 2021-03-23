#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function notify::internal::notify::popup {
    return
}

function notify::internal::notify::play {
    mpg123 "${1}"
}

function notify::internal::notify::success {
    notify::internal::notify::popup "${1}" "The command succeded after ${2} seconds" success.jpg
    notify::internal::notify::play "${ZSH_NOTIFY_ASSETS_SOUND_PATH}"/r2d2/success.mp3 > /dev/null 2>&1
}

function notify::internal::notify::error {
   notify::internal::notify::popup "${1}" "The command failed after ${2} seconds with code: ${3}" error.png
   notify::internal::notify::play "${ZSH_NOTIFY_ASSETS_SOUND_PATH}"/r2d2/error.mp3 > /dev/null 2>&1
}

function notify::internal::notify::command::store {
    if [ "${1}" -regex-match "${_ZSH_NOTIFY_RE_SKIP_COMMANDS}" ]; then
        return
    fi

    _zsh_notify_last_command="${1}"
    _zsh_notify_start_time=$(date +%s)
}

function notify::internal::notify::command::completed {
# we must catch $? as soon as possible.
    local last_status=$?

    local now
    local timediff
    now=$(date +%s)

    if [ -z "${_zsh_notify_start_time}" ]; then
        return
    fi

    timediff="$(( now - _zsh_notify_start_time ))"

    if (( timediff > _ZSH_NOTIFY_TIME_THRESHOLD )); then
        if [[ ${last_status} = 0 ]]; then
            notify::success ${_zsh_notify_last_command} ${timediff}
        else
            notify::error ${_zsh_notify_last_command} ${timediff} ${last_status}
        fi
    fi

    unset _zsh_notify_last_command
    unset _zsh_notify_start_time
}