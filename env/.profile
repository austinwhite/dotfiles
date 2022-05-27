# TODO: This doesn't work as expected. without stowing $DOTFILES/env first,
# I cant use whats in here (STOWDIRS, DOTFILES). after I do that manually I 
# can't stow everything else without removing ~/.local/bin or it causes conflicts w/ stow

# create bin and add to path
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p $HOME/.local/bin
fi

export PATH="$HOME/.local/bin:$PATH"

# create appimages dir
if [ ! -d "$HOME/.local/bin/appimages" ]; then
  mkdir -p $HOME/.local/bin/appimages
fi

export PATH="$HOME/.local/bin/appimages:$PATH"

# environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export SHELL="/bin/zsh"
export DOTFILES="$HOME/.dotfiles"
export STOWDIRS="alacritty nvim tmux zsh git env scripts conda"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.xdg
