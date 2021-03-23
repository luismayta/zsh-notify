#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function notify::dependences {
    message_info "Installing dependences for ${NOTIFY_PACKAGE_NAME}"
    message_success "Installed dependences for ${NOTIFY_PACKAGE_NAME}"
}

function notify::success {
    notify::internal::notify::popup "${1}" "${2}"
    notify::internal::notify::play "${1}"
}

function notify::error {
    notify::popup "${1}" "${2}" "${3}"
    notify::internal::notify::play "${1}"
}

function notify::play {
    notify::internal::notify::play "${1}"
}

function notify::command::completed {
    notify::internal::notify::command::completed
}

function notify::command::store {
    notify::internal::notify::command::store
}