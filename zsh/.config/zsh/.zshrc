# Prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# Plugins
[[ -r "$ZDOTDIR/zsh-plugins" ]] && source "$ZDOTDIR/zsh-plugins"

# Completion
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keybindings
bindkey -e
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
bindkey '^[w' kill-region
bindkey '^H' backward-kill-word # ctrl+backspace: delete previous word

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"

setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
unsetopt beep

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
[[ -n "$LS_COLORS" ]] && zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=auto $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color=auto $realpath'

# Local config modules
for file in \
  "$ZDOTDIR/zsh-functions" \
  "$ZDOTDIR/zsh-exports" \
  "$ZDOTDIR/zsh-aliases" \
  "$ZDOTDIR/local.zsh"
do
  [[ -r "$file" ]] && source "$file"
done
unset file

# Shell integrations
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

tmux-window-name() {
  if [[ -n "$TMUX" && -n "$TMUX_PLUGIN_MANAGER_PATH" ]]; then
    "$TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py" &
  fi
}
