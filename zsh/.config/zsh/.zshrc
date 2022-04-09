export DOTFILES="$HOME/.dotfiles"
export STOWDIRS="alacritty nvim tmux zsh git env"
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

ZSH_THEME="robbyrussell"

plugins=(git)

alias vim=nvim

# enable sudo for aliases
alias sudo='sudo '

# print each PATH entry on a seperate line
alias path='echo -e ${PATH//:/\\n}'

# tmux should use config in ~/.config/tmux
alias tmux='tmux -f $HOME/.config/tmux/.tmux.conf'
