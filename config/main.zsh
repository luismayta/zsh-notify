#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function notify::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_NOTIFY_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_NOTIFY_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_NOTIFY_PATH}"/config/linux.zsh
      ;;
    esac
}

notify::config::main::factory
