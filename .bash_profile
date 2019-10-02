export PATH=~/bin:$PATH

# MacPorts Installer addition on 2013-10-08_at_11:38:23: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Terminal Alias
export LSCOLORS=gxfxcxdxbxegedabagacad

source ~/bin/git-parse-branch
PS1='\[\e[0;31m\]⚡\[\e[m\]\[\033[01;34m\] \w\[\033[35m\]$(git-parse-branch) \[\033[01;30m\]$\[\033[00m\] '

alias ls="ls -GFh"
alias tree="find . -print | sed -e 's;[^/]*/;|-- ;g;s;--|; |;g'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# programs
alias sbl='open -a "Sublime Text"'

# docker
alias dinit='docker-compose up --build'
alias ddown='docker-compose down'
alias dstart='docker-compose start'
alias dstop='docker-compose stop'
alias dlist='docker ps -a'

# Bash into running container
dbash() { docker exec -it $1 /bin/bash; }

