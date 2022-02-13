# If already sourced, exit
#[ -n "$bashprofile_sourced" ] && return
#bashprofile_sourced=1

# User dependent .bash_profile file
# Try .profile in case it was skipped
if [ -f "${HOME}/.profile" ] ; then
  source "${HOME}/.profile"
fi

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

