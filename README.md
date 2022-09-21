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
brew install --cask there
brew install --cask iterm2
brew install --cask raycast
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

## iTerm2 (better than Terminal)

Once installed, launch it and customize the settings / preferences to your liking. These are my preferred settings:

* Appearance
	* Theme
		* Minimal
* Profiles
	* Default
			* General -> Working Directory -> Reuse previous session's directory
			* Colors -> Color Presets -> Dracula ([Download the theme in advance here](https://draculatheme.com/iterm))
			* Colors -> Cursor Color -> #FFFF00
			* Text -> Font -> Monolisa
					* Private download [here](https://www.dropbox.com/s/op6nov5djmmmvej/MonoLisa%20Font.zip?dl=0).
			* Text -> Font Size -> 18
			* Window -> Settings for New Windows -> Columns: 120 / Rows: 30
			* Keys -> Key Mappings -> Presets -> Natural Text Editing
					* This allows me to use the [keyboard shortcuts](https://gist.github.com/w3cj/022081eda22081b82c52) I know and love inside of iTerm2

## Bash and bash_profile

### Shell

Mac now comes with `zsh` as the default [shell](https://en.wikipedia.org/wiki/Comparison_of_command_shells). `bash` is my preferred shell.

I prefer bash because every remote linux machine I log into uses bash. Also, most shell scripts you come across (`.sh` files) are meant to be run on `sh` (Bourne shell) or `bash` (Bourne again shell). These files _might_ run on `zsh`, but there might be some compatibility issues.

If you are a beginner, you probably don't need to replace your shell with `bash`. If you're going to stick with `zsh`, checkout [Oh My Zsh](https://ohmyz.sh/) which gives you a bunch of customizations out of the box.

#### Install Bash and set it as the default

To see what shell is currently your default, run:

```sh
echo $SHELL
```

To install the latest version of bash:

```sh
brew install --cask bash
```

Then, determine where bash got installed:

```sh
which bash
```

This will likely print `/usr/local/bin/bash`.

We now need to add this to our `/etc/shells` file so we can set it as our default shell.

Open up the `/etc/shells` file in `vim` (a command line text editor) with super user privileges (you will need to type your password after running this command):

```sh
sudo vim /etc/shells
```

This will launch a command line editor. Add `/usr/local/bin/bash` on the top of the list of shells.

Press `ESQ+:wq!` to close the file save the changes.

Now that `/usr/local/bin/bash` is in our `/etc/shells` file, we can set it as our default shell (you will need to enter your password for this command as well):

```sh
chsh -s /usr/local/bin/bash
```

Now that you've changed your shell, if you open up a new iTerm2 tab or close / re-open iTerm2, you should be presented with a `bash` shell!

You can run the following to confirm you shell has changed:

```sh
echo $SHELL
```

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
