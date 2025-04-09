
export PATH=~/github.com/nalmeida/dotfiles/bin:$PATH
export EDITOR="code -w"

alias rm=trash "$@"
alias l="eza --color=always --long --git --icons=always --no-user --no-permissions"
alias ll="l -la"
alias cd..="cd .."

# ---------------------------------- Automatic install

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
