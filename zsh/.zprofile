export ZDOTDIR=~/.config/zsh

# global envs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chrome"
export SHELL="/bin/zsh"
export DOTFILES="$HOME/.dotfiles"

# XDG dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.xdg

# user bin
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
