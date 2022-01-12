# Set locale
# We need to set LC_ALL to get around a bug on macOS. Otherwise
# the locale will be messed up in the fish shell.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Go lang
export GOPATH=$HOME/go

# Add the users bin folder to the path.
export PATH=/opt/homebrew/bin/:$GOPATH/bin:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.poetry/bin:/usr/local/sbin:$HOME/.npm-global/bin:$PATH

# Do not do this. It breaks vex and pew
# Use Python 3 by default when creating a virtualenv.
# export=VIRTUALENV_PYTHON python3

# The WORKON_HOME variable is used by the pyvenv Emacs package.
export WORKON_HOME=$HOME/.virtualenvs/

# Editor settings
export ALTERNATE_EDITOR="emacs"        # Open emacs as non daemon as alternative
export EDITOR="emacsclient -t"         # $EDITOR should open in terminal
export VISUAL="emacsclient -c"         # $VISUAL opens in GUI
