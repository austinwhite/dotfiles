source $ZSH/oh-my-zsh.sh

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export STOWDIRS="alacritty nvim tmux zsh git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

ZSH_THEME="robbyrussell"

plugins=(git)

alias vim=nvim

