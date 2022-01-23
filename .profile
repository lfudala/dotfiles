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

