
###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/tmp/$UID"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOT_DIR/.zhistory"     # History filepath
export HISTSIZE=10000                     # Maximum events for internal history
export SAVEHIST=10000                     # Maximum events in history file
