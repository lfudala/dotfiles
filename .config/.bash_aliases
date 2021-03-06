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
alias ll='ls -alF'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
# Aliases for programs
alias vi='vim'
# Until eDNS is supported everywhere I work
alias dig='/usr/bin/dig +nocookie'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

