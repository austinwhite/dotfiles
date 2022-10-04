# XDG dirs
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p $HOME/.local/bin
fi

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

if [ ! -d "$HOME/.cache" ]; then
  mkdir -p $HOME/.cache
fi

if [ ! -d "$HOME/.local/share" ]; then
  mkdir -p $HOME/.local/share
fi

if [ ! -d "$HOME/.xdg" ]; then
  mkdir -p $HOME/.xdg
fi

# projects dir 
if [ ! -d "$HOME/Code" ]; then
  mkdir $HOME/Code
fi
