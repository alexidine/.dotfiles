# +------------+
# | NAVIGATION |
# +------------+

setopt GLOBDOTS # let files beginning with . be matched without explicit specification

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY       # write the history file in the ':start:elapsed;command' format
setopt SHARE_HISTORY          # share history between all sessions
setopt INC_APPEND_HISTORY     # append commands as they are typed, not at shell exit
setopt HIST_EXPIRE_DUPS_FIRST # expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS       # do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS      # do not display a previously found event
setopt HIST_IGNORE_SPACE      # do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS      # do not write a duplicate event to the history file
setopt HIST_REDUCE_BLANKS     # remove blank lines from history
setopt HIST_VERIFY            # do not execute immediately upon history expansion

# +--------+
# | PROMPT |
# +--------+

PROMPT="%B[%n@%m %1~]%b %# "
RPROMPT='%B%*%b' # display time on right prompt

# +---------+
# | BINDING |
# +---------+

bindkey -v # vi mode
bindkey '^]]A' up-line-or-search   # arrow history up-search
bindkey '^[[B' down-line-or-search # arrow history down-search

# +------------+
# | COMPLETION |
# +------------+

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive match
zstyle :compinstall filename '/home/alex/.zshrc'
autoload -Uz compinit && compinit

# +---------+
# | ALIASES |
# +---------+

alias nz="nvim ~/.config/zsh/.zshrc"
alias sz="source ~/.config/zsh/.zshrc"

alias path='echo; tr ":" "\n" <<< "$PATH"; echo;' # print PATH

alias ls='ls -p --color=tty'  # ls with files outlined
alias ll='ls -lh'             # ls as list and human readable
alias la='ls -lah'            # ls with dotfiles
alias lt='du -sh * | sort -h' # print directory with storage
alias lc='ls -1 | wc -l'      # count number of files in directory

alias pokemon='pokemon-colorscripts' # https://gitlab.com/phoneybadger/pokemon-colorscripts

# +-----------+
# | FUNCTIONS |
# +-----------+

function zle-keymap-select { # Change cursor shape depending on vi mode
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q' # block cursor in normal mode
  else
    echo -ne '\e[4 q' # underline cursor in insert mode
  fi
}

zle -N zle-keymap-select
zle-line-init() {
  echo -ne '\e[4 q' # start with underline cursor (insert mode)
}
zle -N zle-line-init

# +---------------+
# | RUN COMMMANDS |
# +---------------+

pokemon-colorscripts -r
