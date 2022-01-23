# User dependent .profile file

# Set user-defined locale
if [ "$(uname -o)" = "Cygwin" ]; then
  export LANG=$(locale -uU)
fi
# Set editor
export EDITOR=vim

# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login
# exists.
#
# if running bash
if [ -n "${BASH_VERSION}" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
  fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Set XDG Base Directory user directories if not already set
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
