# Personal collection of .dotfiles

> Mac OS 11.5.2

## Installing your favorite Applications

### Homebrew: 

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Git / github

Video Help (https://www.youtube.com/watch?v=_RsP81Et12s)

1) Install the latest git version

```
brew install git
```

Restart terminal

2) Setup local github / ssh (https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)


## Utilities

```
brew install --cask vivaldi
brew install --cask pngyu imageoptim
brew install --cask appcleaner
brew install --cask fork
brew install --cask obsidian
brew install --cask spectacle
brew install --cask itsycal
brew install --cask authy
```

### Espanso

Follow the instructions: https://github.com/nalmeida/espanso-config

### pip

```
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python
```

## nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```

## Node Global Packages

```
npm install -g gitignore lite-server
```

## Bash and bash_profile

### Install Utilities

```
brew install --cask wget
brew install --cask htmlq
brew install --cask git-flow
brew install --cask trash

curl https://raw.githubusercontent.com/b4b4r07/httpstat/master/httpstat.sh >~/bin/httpstat && chmod +x ~/bin/httpstat
```

### Create a folder for github related projects

```
mkdir ~/github.com
```

### Create a folder the same name as your github username.

```
mkdir ~/github.com/nalmeida
```

### Clone the dofiles repo

```
git clone git@github.com:nalmeida/dotfiles.git
```

### Config your bash profile

New Mac OS uses Zshell by default. Check if it is the case and, if so, change it to default shell.

On Terminal all, open "Preferences > General" and change to: `/bin/bash`

Create a symbolic link for the `~/.bash_profile` to the one in this repo.

```
cp ~/.bash_profile ~/.bash_profile_old
ln ~/github.com/nalmeida/dotfiles/.bash_profile
source ./bash_profile
```

## Customization

### MonoLisa font

https://www.dropbox.com/s/op6nov5djmmmvej/MonoLisa%20Font.zip?dl=0

### Spectacle

```
touch ~/Library/Application\ Support/Spectacle/Shortcuts.json
echo "[{\"shortcut_key_binding\" : \"ctrl+alt+cmd+y\", \"shortcut_name\" : \"RedoLastMove\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+-\", \"shortcut_name\" : \"MakeSmaller\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+4\", \"shortcut_name\" : \"MoveToLowerRight\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+2\", \"shortcut_name\" : \"MoveToUpperRight\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+down\", \"shortcut_name\" : \"MoveToBottomHalf\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+[\", \"shortcut_name\" : \"MoveToNextDisplay\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+up\", \"shortcut_name\" : \"MoveToTopHalf\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+3\", \"shortcut_name\" : \"MoveToLowerLeft\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+=\", \"shortcut_name\" : \"MakeLarger\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+z\", \"shortcut_name\" : \"UndoLastMove\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+]\", \"shortcut_name\" : \"MoveToPreviousDisplay\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+f\", \"shortcut_name\" : \"MoveToFullscreen\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+.\", \"shortcut_name\" : \"MoveToNextThird\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+left\", \"shortcut_name\" : \"MoveToLeftHalf\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+c\", \"shortcut_name\" : \"MoveToCenter\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+right\", \"shortcut_name\" : \"MoveToRightHalf\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+1\", \"shortcut_name\" : \"MoveToUpperLeft\"}, {\"shortcut_key_binding\" : \"ctrl+alt+cmd+,\", \"shortcut_name\" : \"MoveToPreviousThird\"}]" > ~/Library/Application\ Support/Spectacle/Shortcuts.json
```

### VS Code

Set duplicate line shortcut: `Code > Preferences > Keyboard Shortcuts`: 

 - "Duplicate Selection": "⌘ + Shift + D".
 - "Move Line Down": "Command + Control + Down".
 - "Move Line Up": "Command + Control + Up".


## Manual config Mac Preferences

![Keyboard](https://raw.github.com/nalmeida/dotfiles/master/keyboard.png)
![Mouse 1](https://raw.github.com/nalmeida/dotfiles/master/mouse-1.png)
![Mouse 2](https://raw.github.com/nalmeida/dotfiles/master/mouse-2.png)
![Trackpad 1](https://raw.github.com/nalmeida/dotfiles/master/trackpad-1.png)
![Trackpad 2](https://raw.github.com/nalmeida/dotfiles/master/trackpad-2.png)
![Trackpad 3](https://raw.github.com/nalmeida/dotfiles/master/trackpad-3.png)


## Related Links

* [Jason Lengstorf’s Dotfiles](https://github.com/jlengstorf/dotfiles)
* [CJ from Coding Garden](https://github.com/CodingGarden/vscode-settings)