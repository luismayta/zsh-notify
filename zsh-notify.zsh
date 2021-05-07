#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install notify for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

zmodload zsh/regex

ZSH_NOTIFY_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_NOTIFY_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_NOTIFY_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_NOTIFY_PATH}"/pkg/main.zsh


# notify if commands was running for more than TIME_THRESHOLD seconds:
typeset -g _ZSH_NOTIFY_TIME_THRESHOLD=10
typeset -g _ZSH_NOTIFY_RE_SKIP_COMMANDS="^[^ ]*(ssh|vi|vim|nvim|tmux|tig|man|cat|more|less)"
typeset -g _ZSH_NOTIFY_TERMINAL_BUNDLE="com.googlecode.iterm2"


# For this script to be able to get the exit status of the last executed command ($?)
# it must be loaded before any other script or function that adds a precmd hook.
# Only the first precmd hook access the original $?.
autoload -Uz add-zsh-hook
add-zsh-hook preexec notify::command::store
add-zsh-hook precmd notify::command::completed
