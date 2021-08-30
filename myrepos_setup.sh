# If we're running cygwin 
if [ "$(uname -o)" = "Cygwin" ] ; then
  # Ensure code directory exists
  if [ ! -d /cygdrive/c/code ] ; then
    mkdir /cygdrive/c/code
  fi
  # Ensure /code symlink exists
  if [ ! -L /code ] ; then
    ln -s /cygdrive/c/code /code
  fi
  # Ensure $HOME/code symlink exists
  if [ ! -L $HOME/code ] ; then
    ln -s /cygdrive/c/code $HOME/code
  fi
else
  # Others should have a ~/code directory
  if [ ! -d $HOME/code ] ; then
    mkdir $HOME/code
  fi
fi

# Clone myrepos
git clone git://myrepos.branchable.com/ ~/code/repotools/myrepos 

# Ensure <home>/bin exists
if [ ! -d $HOME/bin ] ; then
  mkdir $HOME/bin
fi
# symlink mr to <home>/bin/mr
ln -s $HOME/code/repotools/myrepos/mr $HOME/bin/mr

