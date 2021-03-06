# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Capture system type
if [ "$(uname -o)" = "Cygwin" ]; then
  system_type="Cygwin"
else
  system_type="$(uname -s)"
fi

# Terminal Options
#
# Disable XON/XOFF flow control
stty -ixon

# Shell Options
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# History settings
#
# Don't put duplicate lines in the history.
# Don't put commands starting with space in the history.
HISTCONTROL=ignoreboth
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"
HISTSIZE=100000
HISTFILESIZE=1000000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Prompt config
#
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|cygwin) color_prompt=yes;;
esac
#
# uncomment for a colored prompt, if the terminal has the capability
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
#
# [settitle_cwd]newline[green]user@host [yellow]cwd[reset]newline$
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Includes
#
# Some people use a different file for aliases
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/.bash_aliases" ]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/.bash_aliases"
fi
#
# Some people use a different file for functions
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/.bash_functions" ]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/.bash_functions"
fi
#
# Add home/bin if not already in path
if [ -d "${HOME}/bin" ] && [[ ":$PATH:" != *":${HOME}/bin:"* ]]; then
  PATH="${HOME}/bin${PATH:+":$PATH"}"
fi
# Add home/.local/bin if not already in path
if [ -d "${HOME}/.local/bin" ] && [[ ":$PATH:" != *":${HOME}/.local/bin:"* ]]; then
  PATH="${HOME}/.local/bin${PATH:+":$PATH"}"
fi

# Set ssh-agent vars for bash
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
# Load default key with keychain if available, else ssh-agent
if [ -x /usr/bin/keychain ]; then
  eval $(keychain --agents ssh --eval -Q id_rsa)
else
  eval $($SSHAGENT $SSHAGENTARGS)
fi

# If Cygwin, update resolv.conf on start
if [ "$system_type" = "Cygwin" ]; then
  if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/.resolv.conf.rc" ]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/.resolv.conf.rc"
  fi
fi
unset system_type


