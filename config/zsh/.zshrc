# Starship ----------------------------------
export STARSHIP_CONFIG="$HOME/github.com/nalmeida/dotfiles/config/starship/starship.toml"
eval "$(starship init zsh)"
# starship config palette $STARSHIP_THEME


# zsh-autosuggestions ----------------------------------
# https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting ----------------------------------
# https://github.com/zsh-users/zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
