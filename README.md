# Personal collection of .dotfiles

> MacOS 15.4 - Sequoia

## Installing Homebrew

On a sparkling fresh installation of OS X:

```
sudo softwareupdate -i -a
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## Downloading and preparing 

### Create a folder for github related projects

```
mkdir ~/github.com
```

### Create a folder the same name as your github username.

```
mkdir ~/github.com/nalmeida
```

### Clone the dofiles repo inside `~/github.com/nalmeida`

```
git clone git@github.com:nalmeida/dotfiles.git
```

## Install favorite Apps via Homebrew

From your `~/github.com/nalmeida/dotfiles` folder:
```
./scripts/install-brew-cask.sh
```

After
```
./scripts/install-brew.sh
```

## Customizing

From your `~/github.com/nalmeida/dotfiles` folder:
```
./scripts/symlinks.sh --create
```


## Related Links

* https://github.com/hendrikmi/dotfiles/tree/main/scripts 
* https://github.com/myshov/dotfiles