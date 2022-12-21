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

# Bypass the Go proxy for the following repos.
# See https://goproxy.io for more information.
set -gx GOPRIVATE "github.com/treadup,github.com/Volumental"

# Adds a path to the users pats
function add_to_user_path
    if test -d $argv[1]
	set -gx PATH $argv[1] $PATH
    end
end

# Add sbin folder to the path
add_to_user_path /usr/local/sbin

# Add Go lang bin folder to the path
add_to_user_path $GOPATH/bin

# Add the Rust package manager Cargo's bin folder to the path.
add_to_user_path $HOME/.cargo/bin

# Add NPM global bin folder to the path.
add_to_user_path $HOME/.npm-global/bin

# Add poetry bin folder to the path
add_to_user_path $HOME/.poetry/bin

# Add user bin folder to the path
add_to_user_path $HOME/bin

# Add local bin folder to the path
add_to_user_path $HOME/.local/bin

# Add Python 3.9 bin folder to the path
add_to_user_path $HOME/Library/Python/3.9/bin/

# Add postgres 9.5 bin folder to the path
add_to_user_path /usr/local/opt/postgresql@9.5/bin

# Add redis 4.0 bin folder to the path
add_to_user_path /usr/local/opt/redis@4.0/bin

# Add homebrew bin folder to path
add_to_user_path /opt/homebrew/bin

# Do not do this. It breaks vex and pew
# Use Python 3 by default when creating a virtualenv.
# set -gx VIRTUALENV_PYTHON python3

# The WORKON_HOME variable is used by the pyvenv Emacs package.
set -gx WORKON_HOME $HOME/.virtualenvs/

alias python "python3"
alias pip "pip3"

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
# Fisher
#

# If fisher is not installed then install it.
# https://github.com/jorgebucaran/fisher
if not functions -q fisher
    echo "Installing fisher for the first time..." >&2
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish

    echo "Execute the command fisher to finish the installation."
    # fisher
end

#
# pipenv
#

# Use the --fancy option by default when starting pipenv shell
set -gx PIPENV_SHELL_FANCY 1

#
# direnv
#
direnv hook fish | source

# Files placed in the .config/fish/conf.d/ folder will be sourced
# automatically. This is preferable to sorucing files in this script.

for WORK_FISH_FILE in ~/work/config/fish/functions/*.fish
    source $WORK_FISH_FILE
end

# The next line updates PATH for the Google Cloud SDK.
# This assumes that the google cloud sdk is installed in the google-cloud-sdk directory
# in the home directory.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end
