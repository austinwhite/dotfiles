# Prompt
[[ -r "$ZDOTDIR/prompt" ]] && source "$ZDOTDIR/prompt"

# Plugins
[[ -r "$ZDOTDIR/plugins" ]] && source "$ZDOTDIR/plugins"

# Completion
[[ -r "$ZDOTDIR/completion" ]] && source "$ZDOTDIR/completion"

# Keybindings
[[ -r "$ZDOTDIR/bindings" ]] && source "$ZDOTDIR/bindings"

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"

# Options
[[ -r "$ZDOTDIR/options" ]] && source "$ZDOTDIR/options"

# Local config modules
for file in \
  "$ZDOTDIR/functions" \
  "$ZDOTDIR/exports" \
  "$ZDOTDIR/platform" \
  "$ZDOTDIR/aliases" \
  "$ZDOTDIR/integrations" \
  "$ZDOTDIR/local.zsh"
do
  [[ -r "$file" ]] && source "$file"
done
unset file
