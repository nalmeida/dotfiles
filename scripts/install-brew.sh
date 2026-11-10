#!/bin/zsh
# Script to install multiple CLI packages via Homebrew with smart handling of already installed packages

SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"
. $SCRIPT_DIR/utils.sh || { echo "Failed to load utils.sh"; exit 1; }

# Initialize variables
FORCE=false
SKIP_INSTALLED=false

# Function to display help message
display_help() {
	echo "Usage: install-brew.sh [OPTIONS]"
	echo
	echo "Install multiple CLI packages via Homebrew"
	echo
	echo "Options:"
	echo "  -h, --help           Display this help message"
	echo "  -f, --force          Force install/upgrade all packages without prompting"
	echo "  -s, --skip-installed Skip already installed packages"
	echo
	echo "Without any options, the script asks before upgrading each installed package (y/n for one, Y/N for all)."
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

# Taps required before some packages below can be installed
taps=(
	"hashicorp/tap"
	"atlassian/acli"
	"pluk-inc/tap"
	"nalmeida/urltracker"
)

for tap in "${taps[@]}"; do
	info "==> Tapping $tap"
	brew tap "$tap" || echo "Error tapping '$tap', continuing..."
done

# Define packages explicitly in array
packages=(
	"mas"
	"starship"
	"git"
	"wget"
	"bat"
	"eza"
	"go"
	"tree"
	# "httpx" use the Go installer: https://github.com/projectdiscovery/httpx
	"zsh-autosuggestions"
	"zsh-syntax-highlighting"
	"gawk"
	"awscli"
	"coreutils"
	"exiftool"
	"ffmpeg"
	"flyctl"
	"gh"
	"git-quick-stats"
	"nmap"
	"fnm"
	"pyenv"
	"pyenv-virtualenv"
	"hashicorp/tap/vault"
	"atlassian/acli/acli"
	"bats-core"
	"gum"
	"source-highlight"
	"vhs"
)

# Print all packages that will be processed
echo "Preparing to install: ${(j: :)packages}"

# Process each package one by one
for package in "${packages[@]}"; do
	info "==> Processing $package"
	
	# Check if package is already installed
	if brew list "$package" &>/dev/null; then
		warning "Package '$package' is already installed."
		
		if $FORCE; then
			echo "Force option detected. Upgrading '$package'..."
			brew upgrade "$package" || echo "Error upgrading '$package', continuing with next packages..."
		elif $SKIP_INSTALLED; then
			error "Skip installed option detected. Skipping '$package'..."
		else
			if confirm_all "Do you want to upgrade '$package'?"; then
				echo "Upgrading '$package'..."
				brew upgrade "$package" || echo "Error upgrading '$package', continuing with next packages..."
			else
				error "Skipping upgrade of '$package'."
			fi
		fi
	else
		warning "Installing '$package'..."
		brew install "$package" || echo "Error installing '$package', continuing with next packages..."
	fi
done

success "Process completed!"