# Personal collection of .dotfiles

## 1) Installing your favorite Applications

> Based on @mcarneiro setup: https://gist.github.com/mcarneiro/fba0e7f68ada9cf48108#file-machine-setup

### Manual install the following software manually via App Store

1. Xcode
2. Microsoft remote desktop
3. Sonicwall mobile connect (VPN)
4. Evernote

### Install Apps via `brew cask`

1. `$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2. `$ brew install git caskroom/cask/brew-cask nodejs wget`
3. `$ brew tap caskroom/versions`
4. `$ brew cask install atext firefox day-o filezilla sublime-text3 google-chrome virtualbox vagrant adium spectacle dropbox vlc skype telegram spotify java pngyu imageoptim`
4. `$ npm install -g grunt-cli bower ngrok &&`
6. `$ gem install bundler`

#### Configuration

##### Day-O configuration
	E H:mm

#### Troubleshooting

##### Error while installing some app via cask
	$ brew tap caskroom/versions
And run the installer again

##### Permission error while installing "gem install bundler"
1. Install RVM: `$ curl -sSL https://get.rvm.io | bash -s stable --ruby`
2. Quit Terminal and open it again
3. Find the latest ruby gem `$ cd ./rvm/gems`
4. Set the default ruby version to the latest `$ rvm use ruby-X.Y.Z`
5. Run bundler again `$ gem install bundler`

## 2) Setting-up Terminal 

Don't worry, before installing it will backup your files into a `~/dotfiles-backup-DATE`:
 * `.aliases`
 * `.bash_profile`
 * `.bash_prompt`
 * `.exports`
 * `.extras`
 * `.gitconfig`
 * `.gitignore`
 * `~/bin/*`

Run the following command in your Terminal:

    $ cd; curl -o setup.sh https://raw.github.com/nalmeida/dotfiles/master/setup.sh && bash setup.sh && rm setup.sh

## 3) Configuring OSX preferences

Run the following command in your Terminal (it will prompt for admin password):

    $ cd; curl -o mac-config.sh https://raw.github.com/nalmeida/dotfiles/master/mac-config.sh && bash mac-config.sh && rm mac-config.sh


## 4) Installing the Tomorrow Night terminal theme

1. [Download the `Tomorrow-Night.terminal` file](https://raw.github.com/nalmeida/dotfiles/master/Tomorrow-Night.terminal);
2. Double click it;
3. Set it as your default theme.

## 5) Setting multiple SSH Keys for git

https://gist.github.com/jexchan/2351996

## 6) Sublime Text 

1. Install Package Control: https://packagecontrol.io/installation
2. Install "Material Theme": https://github.com/equinusocio/material-theme

## 7) Printer: change to 1 side print as default

1. Open the following address in your browser: http://127.0.0.1:631/printers_
2. Follow the instructions: https://www.youtube.com/watch?v=U9ABkxnicEs

## Sample images after config

![Terminal](https://raw.github.com/nalmeida/dotfiles/master/sample.png)
![Keyboard](https://raw.github.com/nalmeida/dotfiles/master/keyboard.png)
![Mouse 1](https://raw.github.com/nalmeida/dotfiles/master/mouse-1.png)
![Mouse 2](https://raw.github.com/nalmeida/dotfiles/master/mouse-2.png)
![Trackpad 1](https://raw.github.com/nalmeida/dotfiles/master/trackpad-1.png)
![Trackpad 2](https://raw.github.com/nalmeida/dotfiles/master/trackpad-2.png)
![Trackpad 3](https://raw.github.com/nalmeida/dotfiles/master/trackpad-3.png)


