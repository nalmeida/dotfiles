# Personal collection of .dotfiles

> MacOS 15.4 - Sequoia

This repository contains my personal dotfiles and setup scripts for macOS. It helps me quickly set up a new Mac with my preferred configurations and applications.

## Table of Contents

- [Initial Setup](#initial-setup)
- [Repository Setup](#repository-setup)
- [MacOS Configuration](#macos-configuration)
- [Applications Installation](#applications-installation)
- [Terminal Setup](#terminal-setup)
- [Development Environment](#development-environment)
- [Customizing Dotfiles](#customizing-dotfiles)
- [Resources](#resources)

## Initial Setup

### Installing Homebrew

On a fresh installation of macOS:

```bash
# Update macOS
sudo softwareupdate -i -a

# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to path (for Apple Silicon Macs)
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)
```

## Repository Setup

### Create a folder structure for GitHub projects

```bash
# Create a folder for GitHub related projects
mkdir ~/github.com

# Create a folder with your GitHub username
mkdir ~/github.com/nalmeida

# Clone the dotfiles repo
git clone git@github.com:nalmeida/dotfiles.git ~/github.com/nalmeida/dotfiles
```

## MacOS Configuration

### Trackpad Settings

- Disable Natural Scrolling
- Set Secondary click to "Click in Bottom-Right Corner"

### Keyboard Settings

- Increase keyboard repeat speed to fast
- Remove keyboard input menu from top menu bar:
  - Go to System Settings > Keyboard > Text Input
  - Click "Edit" and uncheck "Show Input menu in menu bar"

### Clock Display

- System Settings > Control Center, then find "Clock" and uncheck "Show the day of the week".

### Do not Disturb

- System Settings > Control Center (or Dock & Menu Bar on older systems), find Do Not Disturb, and choose "Don't Show in Menu Bar".


## Applications Installation

### Via Homebrew Scripts

From your `~/github.com/nalmeida/dotfiles` folder:

```bash
# Install GUI applications (browsers, utilities, etc.)
./scripts/install-brew-cask.sh

# Install CLI tools (git, development tools, etc.)
./scripts/install-brew.sh
```

These scripts will install the applications and tools listed in the respective files. Check the script contents to see exactly what will be installed.

### Essential Applications

The scripts `install-brew-cask.sh` and `install-brew.sh` will install most applications automatically. Below are some manual configurations needed after installation.

#### Browsers
- Vivaldi configuration:
  - Disable Global Media Controls:
    1. Open Vivaldi and navigate to `vivaldi://flags/#global-media-controls`
    2. Find "Global media controls" and set to "Disabled"

#### Productivity & Utilities
- Visual Studio Code:
  - Sync settings via GitHub:
    1. Open VS Code
    2. Press `⌘+⇧+P` to open the command palette
    3. Type "Settings Sync: Turn On..."
    4. Select "Sign in with GitHub"
    5. Complete the authentication process
    6. Select your existing settings profile or create a new one
    7. Choose which settings to sync (extensions, themes, keybindings, etc.)
  - Configure to use FiraMono Nerd Font:
    1. Open Settings (`⌘+,`)
    2. Search for "Font Family"
    3. Set to `Fira Code, Monaspace Neon, MonoLisa, Menlo, Monaco, 'Courier New', monospace`

#### Screenshot & File Sharing
- [Monosnap](https://monosnap.com/download) (from Mac App Store)
  - Turn off macOS standard screenshot shortcuts:
    - System Settings > Keyboard > Keyboard Shortcuts > Screenshots
  - Configure hotkeys:
    - Capture area: `⌘+⇧+4`
    - Capture fullscreen: `⌘+⇧+5`
- [LocalSend](https://localsend.org/download) for cross-platform file sharing

#### Note Taking
- UpNote (from Mac App Store)

## Terminal Setup

### Fonts

- Install FiraMono Nerd Font (used by both VS Code and Ghostty):
  ```bash
  # Install via Homebrew
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-mono-nerd-font
  ```
  
  Alternatively, download manually from [Nerd Fonts website](https://www.nerdfonts.com/font-downloads) and install by:
  1. Download the FiraMono Nerd Font
  2. Extract the ZIP file
  3. Double-click each font file and click "Install Font"

### Terminal Emulator

- Ghostty terminal:
  - Install: `brew install --cask ghostty` (if not already installed via scripts)
  - Configuration:
    - Open preferences with `⌘+,`
    - Set font size to 18: `font-size=18` 
    - Set font to FiraMono Nerd Font: `font-family="FiraMono Nerd Font"`
    - Theme used [flexoki dark](https://github.com/kepano/flexoki) (same used for VS Code)
    - More configuration options: [Birchtree.me Ghostty Config](https://birchtree.me/blog/my-lil-ghosty-terminal-config-2/)
    - Configuration reference: [Ghostty Documentation](https://ghostty.zerebos.com/)
    - 

### Development Tools

- Git: The `install-brew.sh` script should install this
- NVM (Node Version Manager):
  - Follow the [official NVM installation instructions](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
- Python (see [detailed Python setup guide](upnote://x-callback-url/openNote?noteId=41cf9f45-2c4d-4182-bf68-9d1fe21b57fc))

## Customizing Dotfiles

After installing applications, set up symlinks to use your dotfiles configurations:

```bash
# From your dotfiles directory
./scripts/symlinks.sh --create
```

This script will create symbolic links from your dotfiles repository to your home directory, ensuring all your configuration files are properly set up.

## Resources

### What's In This Repository

- `.zshrc`: ZSH shell configuration
- `.gitconfig`: Git configuration
- `scripts/`: Installation and setup scripts
  - `install-brew.sh`: Installs CLI tools via Homebrew
  - `install-brew-cask.sh`: Installs GUI applications via Homebrew Cask
  - `symlinks.sh`: Creates symbolic links for dotfiles

### Related Links & References

* [hendrikmi's dotfiles scripts](https://github.com/hendrikmi/dotfiles/tree/main/scripts)
* [myshov's dotfiles](https://github.com/myshov/dotfiles)
* [YouTube: The Top 5 ZSH Plugins I CAN'T Live Without!](https://www.youtube.com/watch?v=wHnMd8uz6j0)
* [Homebrew Homepage](https://brew.sh/)
* [Oh My Zsh - Terminal Customization](https://ohmyz.sh/)