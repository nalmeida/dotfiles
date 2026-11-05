#!/bin/bash

default_color=$(tput sgr 0)
red="$(tput setaf 1)"
yellow="$(tput setaf 3)"
green="$(tput setaf 2)"
blue="$(tput setaf 4)"

info() {
    printf "%s%s%s\n" "$blue" "$1" "$default_color"
}

success() {
    printf "%s%s%s\n" "$green" "$1" "$default_color"
}

error() {
    printf "%s%s%s\n" "$red" "$1" "$default_color"
}

warning() {
    printf "%s%s%s\n" "$yellow" "$1" "$default_color"
}
# Remembers an "apply to all" answer given to confirm_all ("yes", "no" or empty)
APPLY_ALL=""

# Ask a yes/no question.
# y/n answers only this prompt; Y/N applies the answer to every remaining prompt.
# An empty answer counts as "n".
confirm_all() {
    if [[ "$APPLY_ALL" == "yes" ]]; then return 0; fi
    if [[ "$APPLY_ALL" == "no" ]]; then return 1; fi

    local choice
    while true; do
        printf "%s (y/n, Y/N = all): " "$1"
        read -r choice
        case "$choice" in
            y|yes) return 0 ;;
            ""|n|no) return 1 ;;
            Y) APPLY_ALL="yes"; return 0 ;;
            N) APPLY_ALL="no"; return 1 ;;
            *) echo "Please answer y, n, Y (yes to all) or N (no to all)." ;;
        esac
    done
}
