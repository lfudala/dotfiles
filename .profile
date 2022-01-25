# User dependent .profile file

# Set user-defined locale
if [ "$(uname -o)" = "Cygwin" ]; then
  export LANG=$(locale -uU)
fi

# Source our environment variables file
if [ -f "${HOME}/.config/.env" ]; then
  source "${HOME}/.config/.env"
fi

# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login
# exists.
#
# if running bash
if [ -n "${BASH_VERSION}" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
  fi
fi

# Create XDG Base Directory user directories if they don't exist
if [ ! -d "${XDG_CONFIG_HOME}" ] ; then
  mkdir -m 700 "${XDG_CONFIG_HOME}"
fi

if [ ! -d "${XDG_CACHE_HOME}" ] ; then
  mkdir -m 700 "${XDG_CACHE_HOME}"
fi

# If XDG_STATE_HOME is $HOME/.local/state, create .local if doesn't
# exist, else just try to create XDG_STATE_HOME
if [ ! -d "${XDG_STATE_HOME}" ] ; then
  if [ "${XDG_STATE_HOME}" = "${HOME}/.local/state" ] ; then
    if [ ! -d "${HOME}/.local" ] ; then
      mkdir -m 700 "${HOME}/.local"
    fi
  fi
  mkdir -m 700 "${XDG_STATE_HOME}"
fi

# If XDG_DATA_HOME is $HOME/.local/share, create .local if doesn't
# exist, else just try to create XDG_DATA_HOME
if [ ! -d "${XDG_DATA_HOME}" ] ; then
  if [ "${XDG_DATA_HOME}" = "${HOME}/.local/share" ] ; then
    if [ ! -d "${HOME}/.local" ] ; then
      mkdir -m 700 "${HOME}/.local"
    fi
  fi
  mkdir -m 700 "${XDG_DATA_HOME}"
fi
