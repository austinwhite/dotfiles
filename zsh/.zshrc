export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export STOWDIRS="alacritty nvim tmux zsh"
export GCM_CREDENTIAL_STORE="cache"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias -- -='cd -'
