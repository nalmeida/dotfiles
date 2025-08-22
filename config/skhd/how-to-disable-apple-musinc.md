# How to disable Apple Music from launching on media keys and make them only work with Spotify

👉 ORIGINAL GIST POST: https://gist.github.com/rokartur/5e6ff8556c90a9eaaf010834181dfbd4

This solution forces media keys to work only for Spotify.

> [!NOTE]
> Homebrew, one formula, one config file, zero additional apps.

### 1. Open terminal

### 2. Disable Apple Music for media keys
Enter the following commands in the terminal:
```shell
sudo launchctl stop com.apple.rcd
sudo launchctl disable gui/$(id -u)/com.apple.rcd
```

To verify that it works, type this:
```shell
sudo launchctl print-disabled gui/$(id -u)
```

You should see something like this among the disabled services
```
"com.apple.rcd" => disabled
```

### 3. Install [Homebrew](https://brew.sh/)
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 4. Install [skhd](https://github.com/koekeishiya/skhd)
```shell
brew install koekeishiya/formulae/skhd
```

### 5. skhd in login items
```shell
skhd --start-service
```

### 6. Configure media keys
If you don't have create config file
```shell
touch ~/.skhdrc
```
```shell
open ~/.skhdrc 
```
Paste this and save:
```
play : osascript -e 'tell application "Spotify" to playpause' 
previous : osascript -e 'tell application "Spotify" to previous track'
next : osascript -e 'tell application "Spotify" to next track'
```
or
```
play : osascript -e 'tell application "Spotify" to playpause' 
rewind : osascript -e 'tell application "Spotify" to previous track'
fast : osascript -e 'tell application "Spotify" to next track'
```

### 7. Reload config to be sure.
```shell
skhd -r
```

### 🎧 enjoy! If this was helpful to you, please leave a ⭐
![a-close-up-of-a-cat-looking-at-the-camera](https://gist.github.com/user-attachments/assets/5d39ecf9-c626-4cc7-92e9-4a67f9698055)

# FAQ
If Spotify is turned off and you click the media buttons, will it turn on?
> YESSS!

---

Prev and Next button not working?
> Check:
>1. Both versions of config
>2. Make sure that skhd has Accessibility permissions in System Preferences → Privacy
<img width="827" height="840" alt="74182" src="https://gist.github.com/user-attachments/assets/c655eefb-875c-4688-9759-3da5cf4c8af8" />


--- 