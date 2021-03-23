#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function notify::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_NOTIFY_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_NOTIFY_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_NOTIFY_PATH}"/pkg/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_NOTIFY_PATH}"/pkg/helper.zsh

    # shellcheck source=/dev/null
    source "${ZSH_NOTIFY_PATH}"/pkg/alias.zsh
}

notify::pkg::main::factory
