#!/usr/bin/env bash

set -eux -o pipefail

##################### HOMEBREW ########################

# utils

function check_command_exists {
  [ $# -eq 1 ] && command -v "$1" > /dev/null 2>&1
}

function check_if_installed {
  [ $# -eq 1 ] && brew list "$1"  > /dev/null 2>&1
}

function brew_install_if_not_exists {
  for item in "$@"; do
    if ! check_command_exists "$item" && \
        ! check_if_installed "$item" ; then
      brew install "$item"
    fi
  done
}

#
# install homebrew if not exist
#

if ! check_command_exists brew; then
  /usr/bin/ruby -e "$(curl -fsSL \
    https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#
# general purpose utils
#

brew_install_if_not_exists coreutils colordiff htop

#
# install C++ Utils
#

brew_install_if_not_exists clang-format

#
# install Shell Utils
#

brew_install_if_not_exists shellcheck
