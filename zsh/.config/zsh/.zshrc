# Prompt
[[ -r "$ZDOTDIR/zsh-prompt" ]] && source "$ZDOTDIR/zsh-prompt"

# Plugins
[[ -r "$ZDOTDIR/zsh-plugins" ]] && source "$ZDOTDIR/zsh-plugins"

# Completion
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

# Replay plugin compdefs after compinit is available
(( $+commands[zinit] )) && zinit cdreplay -q

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keybindings
[[ -r "$ZDOTDIR/zsh-bindings" ]] && source "$ZDOTDIR/zsh-bindings"

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"

# Options
[[ -r "$ZDOTDIR/zsh-options" ]] && source "$ZDOTDIR/zsh-options"

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
