
export PATH=~/github.com/nalmeida/dotfiles/bin:$PATH
export EDITOR="code -w"

alias rm=trash "$@"
alias l="eza --color=always --long --git --icons=always --no-user --no-permissions"
alias ll="l -la"
alias cd..="cd .."
alias history="history 0"
# Requires the installation of the `squint`: https://github.com/kimmobrunfeldt/squint
alias sshot=squint "$@"

# ---------------------------------- Automatic install

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
# Install and setup guide: upnote://x-callback-url/openNote?noteId=41cf9f45-2c4d-4182-bf68-9d1fe21b57fc
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Rust
# Install: https://doc.rust-lang.org/cargo/getting-started/installation.html
# $ curl https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"