#!/bin/zsh
# Script to install multiple apps via Homebrew with smart handling of already installed apps

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
. $SCRIPT_DIR/utils.sh

# Initialize variables
FORCE=false
SKIP_INSTALLED=false

# Function to display help message
display_help() {
	echo "Usage: install-brew-cask.sh [OPTIONS]"
	echo
	echo "Install multiple applications via Homebrew Cask"
	echo
	echo "Options:"
	echo "  -h, --help           Display this help message"
	echo "  -f, --force          Force install/upgrade all apps without prompting"
	echo "  -s, --skip-installed Skip already installed apps"
	echo
	echo "Without any options, the script will prompt you to upgrade apps that are already installed."
	exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
	case $1 in
		-h|--help)
			display_help
			;;
		-f|--force)
			FORCE=true
			shift
			;;
		-s|--skip-installed)
			SKIP_INSTALLED=true
			shift
			;;
		*)
			echo "Unknown option: $1"
			echo "Use -h or --help to see available options"
			exit 1
			;;
	esac
done

# Define apps and their application paths using parallel arrays (zsh compatible)
apps=(
	appcleaner
	github
	itsycal
	spotify
	google-chrome
	vivaldi
	visual-studio-code
	rectangle
	ghostty
)

app_paths=(
	"/Applications/AppCleaner.app"
	"/Applications/GitHub Desktop.app"
	"/Applications/Itsycal.app"
	"/Applications/Spotify.app"
	"/Applications/Google Chrome.app"
	"/Applications/Vivaldi.app"
	"/Applications/Visual Studio Code.app"
	"/Applications/Rectangle.app"
	"/Applications/Ghostty.app"
)

info "Preparing to install: ${apps[@]}"

# Process each app
for i in {1..${#apps}}; do
	app=${apps[$i]}
	app_path=${app_paths[$i]}
	
	echo "==> Processing $app (path: $app_path)"
	
	# First check if the app exists in /Applications
	if [[ -d "$app_path" ]]; then
		echo "App '$app' is already installed at '$app_path'."
		
		if $FORCE; then
			echo "Force option detected. Attempting to reinstall/upgrade '$app'..."
			brew uninstall --cask "$app" --force &>/dev/null || true
			brew install --cask "$app" || echo "Error reinstalling '$app', continuing with next apps..."
		elif $SKIP_INSTALLED; then
			echo "Skip installed option detected. Skipping '$app'..."
		else
			read "choice?Do you want to attempt to upgrade '$app'? (y/n): "
			case "$choice" in
				y|Y|yes|Yes|YES)
					echo "Attempting to upgrade '$app'..."
					brew uninstall --cask "$app" --force &>/dev/null || true
					brew install --cask "$app" || echo "Error upgrading '$app', continuing with next apps..."
					;;
				*)
					echo "Skipping upgrade of '$app'."
					;;
			esac
		fi
	# As a backup, also check if brew thinks it's installed
	elif brew list --cask "$app" &>/dev/null; then
		echo "App '$app' is tracked by Homebrew but not found at expected location."
		
		if $FORCE; then
			echo "Force option detected. Upgrading '$app'..."
			brew upgrade --cask "$app" || echo "Error upgrading '$app', continuing with next apps..."
		elif $SKIP_INSTALLED; then
			echo "Skip installed option detected. Skipping '$app'..."
		else
			read "choice?Do you want to upgrade '$app'? (y/n): "
			case "$choice" in
				y|Y|yes|Yes|YES)
					echo "Upgrading '$app'..."
					brew upgrade --cask "$app" || echo "Error upgrading '$app', continuing with next apps..."
					;;
				*)
					echo "Skipping upgrade of '$app'."
					;;
			esac
		fi
	else
		echo "Installing '$app'..."
		brew install "$app" --cask || echo "Error installing '$app', continuing with next apps..."
	fi
done

echo "Process completed!"