# create bin and add to path
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p $HOME/.local/bin
  export PATH="$HOME/.local/bin:$PATH"
fi

# create appimages dir
if [ ! -d "$HOME/.local/bin/appimages" ]; then
  mkdir -p $HOME/.local/bin/appimages
  export PATH="$HOME/.local/bin/appimages:$PATH"
fi

# environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export DOTFILES="$HOME/.dotfiles"
export STOWDIRS="alacritty nvim tmux zsh git env scripts"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.xdg

# install nvim if not installed
appimagesPath=$HOME/.local/bin/appimages
nvimImage="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
if [ ! -f "$appimagesPath/nvim" ]; then
  (
    cd "$appimagesPath"
    curl -LOs $nvimImage > /dev/null
    chmod u+x nvim.appimage
    mv nvim.appimage nvim
  )
fi
