export PATH=~/github.com/nalmeida/dotfiles/bin:$PATH

# Terminal Alias
export LSCOLORS=gxfxcxdxbxegedabagacad

# Espanso default editor
export EDITOR=/usr/local/bin/code

source ~/github.com/nalmeida/dotfiles/bin/git-parse-branch
PS1='\[\e[0;31m\]⚡\[\e[m\]\[\033[01;34m\] \w\[\033[35m\]$(git-parse-branch) \[\033[01;30m\]$\[\033[00m\] '

alias ls="ls -GFh"
alias rm=trash "$@"

# List all the files with numerical chmod permissions
alias la="ls -laGFh | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

# Python 2.7 
alias pip=~/Library/Python/2.7/bin/pip 

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
