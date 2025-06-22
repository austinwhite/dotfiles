eval "$(starship init zsh)"

# add zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# load completions
autoload -Uz compinit && compinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light hlissner/zsh-autopair
zinit light Aloxaf/fzf-tab

# pull in oh-my-zsh plugins
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# keybindings
bindkey -e
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search
bindkey '^[w' kill-region
bindkey '^H' backward-kill-word # ctrl+backspace, delete previous word

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
unsetopt BEEP

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# add config externals
[[ ! -f $ZDOTDIR/zsh-functions ]] || source $ZDOTDIR/zsh-functions
[[ ! -f $ZDOTDIR/zsh-exports ]] || source $ZDOTDIR/zsh-exports
[[ ! -f $ZDOTDIR/zsh-aliases ]] || source $ZDOTDIR/zsh-aliases

# shell integrations
 eval "$(fzf --zsh)"
# must soruce fzf files manually. --zsh flag isn't supported on debian yet
# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh
eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/austin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/austin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/austin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/austin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

tmux-window-name() {
    if [[ -v TMUX ]]; then
	    ($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
    fi
}

# pnpm
export PNPM_HOME="/Users/austin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# rust
source "$HOME/.cargo/env"

