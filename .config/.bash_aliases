# Make mv tell you what it does
alias mv='mv -v'
#
# Default to human readable figures
alias df='df -h'
alias duh='du -d0 -h'
#
# Use color if available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color'                     # show differences in colour
    alias ls='ls --color=auto'                 # classify files in colour
fi
# Some shortcuts for different directory listings
alias ll='LC_COLLATE=C ls -alF'               # long list and good ole C sorting
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
# Aliases for programs
alias vi='vim'
# Until eDNS is supported everywhere I work
#alias dig='/usr/bin/dig +nocookie'
# Flush network cache
alias flushcaches='sudo resolvectl flush-caches'
# Git aliases
alias g="git"
# https://unix.stackexchange.com/a/216806
_completion_loader git
eval "$(complete -p git | sed -r 's/(\s)git$/\1g/')"
alias gst="git status"
alias gr="git remote -v"
alias gd="git diff"
alias bdf="btrfs filesystem usage"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# If Mac, enable ls color
if [ "$(uname)" = "Darwin" ]; then
  alias ls='ls -G'
fi
# Workaround for chezmoi (go) pathing with cygwin
if [ ! "$(uname)" = "Darwin" ] && [ "$(uname -o)" = "Cygwin" ]; then
  alias chezmoi="chezmoi -c '$(cygpath -w /home/$(whoami)/.config/chezmoi/chezmoi.yaml)'"
fi
