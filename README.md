# Personal collection of .dotfiles

## 1) Installing your favorite Applications

> Based on @mcarneiro setup: https://gist.github.com/mcarneiro/fba0e7f68ada9cf48108#file-machine-setup

### Manual install the following software manually via App Store

1. Xcode (and Open it!)
2. Microsoft remote desktop
3. Sonicwall mobile connect (VPN)
4. Evernote
5. [Monosnap](http://monosnap.com/welcome)
6. [Smartmockups](https://app.smartmockups.com)

### Install Apps via `brew cask`

1. `$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2. `$ brew install git caskroom/cask/brew-cask nodejs wget`
3. `$ brew tap caskroom/versions`
4. `$ brew cask install the-unarchiver atext firefox day-o filezilla sublime-text google-chrome spectacle dropbox vlc skype telegram spotify java pngyu imageoptim`
4. `$ npm install -g grunt-cli bower ngrok &&`
6. `$ gem install bundler`

#### Configuration

##### Day-O configuration
	E H:mm

#### Troubleshooting

##### Old Terminal hostname

In case your brand new computer is not so brand new, you may want to [change its Terminal hostname](https://apple.stackexchange.com/questions/66611/how-to-change-computer-name-so-terminal-displays-it-in-mac-os-x-mountain-lion):

	$ sudo scutil --set HostName nalmeida

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

    $ cd; curl -o setup.sh https://raw.githubusercontent.com/nalmeida/dotfiles/master/setup.sh && bash setup.sh && rm setup.sh

## 3) Configuring OSX preferences

Run the following command in your Terminal (it will prompt for admin password):

    $ cd; curl -o mac-config.sh https://raw.githubusercontent.com/nalmeida/dotfiles/master/mac-config.sh && bash mac-config.sh && rm mac-config.sh


## 4) Installing the Tomorrow Night terminal theme

1. [Download the `Tomorrow-Night.terminal` file](https://raw.github.com/nalmeida/dotfiles/master/Tomorrow-Night.terminal);
2. Double click it;
3. Set it as your default theme.

## 5) Create subl alias for Sublime Text

`ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl`

## 6) Sublime Text 

1. Install Package Control: https://packagecontrol.io/installation
2. Install "Material Theme": https://github.com/equinusocio/material-theme

## 7) Printer: change to 1 side print as default

1. Open the following address in your browser: http://127.0.0.1:631/printers_
2. Follow the instructions: https://www.youtube.com/watch?v=U9ABkxnicEs

## 8) Enable writing in external NTFS HD 

Full tutorial: http://learnaholic.me/2013/11/11/enable-ntfs-write-on-mac-os-x-mavericks/

1. Create a file: `$ sudo vim /etc/fstab`
2. Add your HD in the list inside the file: `LABEL=#DEVICE-NAME#  none    ntfs    rw,auto,nobrowse`
3. Create a link from `/Volumes` in your desktop: `sudo ln -s /Volumes ~/Desktop/Volumes`
4. Eject the HD and connect it again. It will be listed inside your `/Volumes` folder.

## 9) Add multiple `ssh` identities

Instructions: https://gist.github.com/jexchan/2351996

Then run `$ ssh-add -K ~/.ssh/privateKey.txt`. It'll prompt for your passphrase if necessary, then add it to your Keychain.

## Sample images after config

![Terminal](https://raw.github.com/nalmeida/dotfiles/master/sample.png)
![Keyboard](https://raw.github.com/nalmeida/dotfiles/master/keyboard.png)
![Mouse 1](https://raw.github.com/nalmeida/dotfiles/master/mouse-1.png)
![Mouse 2](https://raw.github.com/nalmeida/dotfiles/master/mouse-2.png)
![Trackpad 1](https://raw.github.com/nalmeida/dotfiles/master/trackpad-1.png)
![Trackpad 2](https://raw.github.com/nalmeida/dotfiles/master/trackpad-2.png)
![Trackpad 3](https://raw.github.com/nalmeida/dotfiles/master/trackpad-3.png)


