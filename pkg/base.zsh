#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function notify::dependences {
    message_info "Installing dependences for ${NOTIFY_PACKAGE_NAME}"
    message_success "Installed dependences for ${NOTIFY_PACKAGE_NAME}"
}

function notify::success {
    notify::internal::notify::success "${1}" "${2}"
}

function notify::error {
    notify::internal::notify::error "${1}" "${2}" "${3}"
}

function notify::play {
    notify::internal::notify::play "${1}"
}

function notify::popup {
    notify::internal::notify::popup
}

function notify::command::completed {
    notify::internal::notify::command::completed
}

function notify::command::store {
    notify::internal::notify::command::store
}