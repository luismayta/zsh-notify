#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function notify::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_NOTIFY_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_NOTIFY_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_NOTIFY_PATH}"/internal/linux.zsh
      ;;
    esac
}

notify::internal::main::factory

if ! core::exists mpg123; then core::install mpg123; fi
if ! core::exists terminal-notifier; then core::install terminal-notifier; fi
