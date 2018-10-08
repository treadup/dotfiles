#
# Path and Environment variables
#

# Set locale
# We need to set LC_ALL to get around a bug on macOS. Otherwise
# the locale will be messed up in the fish shell.
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Go lang
set -gx GOPATH $HOME/go

# Add Go lang bin folder to the path
if test -d $GOPATH/bin
    set -gx PATH $GOPATH/bin $PATH
end

# Add the Rust package manager Cargo's bin folder to the path.
if test -d $HOME/.cargo/bin
    set -gx PATH $HOME/.cargo/bin $PATH
end

# Add NPM global bin folder to the path.
if test -d $HOME/.npm-global/bin
    set -gx PATH $HOME/.npm-global/bin $PATH
end

# Add special bin folders to the path
set -gx PATH $HOME/bin $PATH

# Add .local/bin folder to the path
if test -d $HOME/.local/bin
    set -gx PATH $HOME/.local/bin $PATH
end

# Add sbin folder to the path
set -gx PATH /usr/local/sbin $PATH

# Do not do this. It breaks vex and pew
# Use Python 3 by default when creating a virtualenv.
# set -gx VIRTUALENV_PYTHON python3

# The WORKON_HOME variable is used by the pyvenv Emacs package.
set -gx WORKON_HOME $HOME/.virtualenvs/

#
# Directory navigation
#

alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

#
# Editor
#
set -gx ALTERNATE_EDITOR "emacs"        # Open emacs as non daemon as alternative
set -gx EDITOR "emacsclient -t"         # $EDITOR should open in terminal
set -gx VISUAL "emacsclient -c"         # $VISUAL opens in GUI

#
# Setup virtualfish
#

# Use the command vf connect to connect a virtual environment to a specific
# folder in the filesystem. To do this you have to have manually activated
# the virtual environment and be in the folder that you want to connect.
# Also the first time you do this you will have to manually deactivate the
# virtual environment to be able to test that auto enabling is working.

if which python3 > /dev/null
    if python3 -c "import virtualfish" 2> /dev/null
        eval (python3 -m virtualfish auto_activation)
    end
end
