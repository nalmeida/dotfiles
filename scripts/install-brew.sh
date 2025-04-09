#!/bin/bash
# Source: https://github.com/myshov/dotfiles/blob/master/install/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. $SCRIPT_DIR/utils.sh

# Install cask packages
apps=(
    git
		bat
		eza
		starship
		go
		httpx
)

info "Installing "${apps[@]}""

brew install "${apps[@]}"