# Prompt
[[ -r "$ZDOTDIR/zsh-prompt" ]] && source "$ZDOTDIR/zsh-prompt"

# Plugins
[[ -r "$ZDOTDIR/zsh-plugins" ]] && source "$ZDOTDIR/zsh-plugins"

# Completion
[[ -r "$ZDOTDIR/zsh-completion" ]] && source "$ZDOTDIR/zsh-completion"

# Keybindings
[[ -r "$ZDOTDIR/zsh-bindings" ]] && source "$ZDOTDIR/zsh-bindings"

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"

# Options
[[ -r "$ZDOTDIR/zsh-options" ]] && source "$ZDOTDIR/zsh-options"

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
[[ -r "$ZDOTDIR/zsh-integrations" ]] && source "$ZDOTDIR/zsh-integrations"
