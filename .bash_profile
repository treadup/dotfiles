# Just have the .bash_profile source the .bashrc file if it exists.
# This should work on both Linux and OSX. Place any customizations
# in the .bashrc file.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

