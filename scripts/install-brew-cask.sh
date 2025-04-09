#!/bin/bash
# Source: https://github.com/myshov/dotfiles/blob/master/install/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. $SCRIPT_DIR/utils.sh


# Install cask packages
apps=(
    github
    itsycal
    spotify
    google-chrome
    vivaldi
    visual-studio-code
    rectangle
    ghostty
)

info "Installing "${apps[@]}""

brew install "${apps[@]}" --cask