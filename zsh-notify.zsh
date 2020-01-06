#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install notify for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
notify_package_name='notify'

function notify::install::terminal-notifier {
    if ! type -p brew > /dev/null; then
        message_warning "Is neccesary have brew, please use luismayta/zsh-brew"
    else
        message_info "installing notifier"
        brew install terminal-notifier
        message_success "installing notifier"
    fi
}

if ! type -p terminal-notifier > /dev/null; then
    notify::install::terminal-notifier
fi
