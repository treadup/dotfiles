# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# The set -e and set -u are useful when debugging this script. However we do
# not want them to be on in general since we might be running scripts of unknown
# quality.

# Exit this script if there are any errors.
# set -e

# Exit script if it tries to use an uninitialized variable.
# set -u

# This is to fix the problem with pew bash completions.
SHELL=/bin/bash

# This is a hack to get 256 color support in Emacs. If you open a shell
# in Emacs it will report the terminal type as dumb. This snippet changes
# the terminal type to xterm-256color.
if [ ! -z ${INSIDE_EMACS+x} ]; then
    # We are inside emacs. Set the TERM to not be dumb.
    export TERM=xterm-256color
fi

# For some reason I needed to set these on OSX.
# I do not remember why. I think it had something to do with
## sshing in to a linux box.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

function __git_ps1() {
    true;
}

# Source git-prompt
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

# Color definitions
BLACK_COLOR='\[\033[01;30m\]'
RED_COLOR='\[\033[01;31m\]'
GREEN_COLOR='\[\033[01;32m\]'
YELLOW_COLOR='\[\033[01;33m\]'
BLUE_COLOR='\[\033[01;34m\]'
MAGENTA_COLOR='\[\033[01;35m\]'
CYAN_COLOR='\[\033[01;36m\]'
WHITE_COLOR='\[\033[01;37m\]'
RESET_COLOR='\[\033[0m\]'

# Returns the name of the Python virtual environment or an empty string if there
# is no python virtual environment.
function the_virtual_environment_name {
    if [ -z ${VIRTUAL_ENV+x} ]; then
	# Does not have virtual environment name.
	echo ""
    else
	# Has virtual environment name.
	echo $(basename ${VIRTUAL_ENV})
    fi
}

# Returns the name of the Conda virtual environment or an empty string if there
# is no conda virtual environment.
function the_conda_environment_name {
    if [ -z ${CONDA_DEFAULT_ENV+x} ]; then
	# Does not have conda environment name.
	echo ""
    else
	# Has conda environment name.
	echo "${CONDA_DEFAULT_ENV}"
    fi
}

# Returns the environment name. The supported environment types are
# different kinds of Python environments.
function the_environment_name {
    THE_VIRTUAL_ENV=$(the_virtual_environment_name)
    THE_CONDA_ENV=$(the_conda_environment_name)

    if [ -n "${THE_VIRTUAL_ENV}" ]; then
        echo "${THE_VIRTUAL_ENV}"
    elif [ -n "${THE_CONDA_ENV}" ]; then
        echo "${THE_CONDA_ENV}"
    else
        echo ""
    fi
}

function the_virtualenv {
    ENVIRONMENT_NAME=$(the_environment_name)

    if [ -n "$ENVIRONMENT_NAME" ]; then
        if [ "$color_prompt" = yes ]; then
            echo -e "${CYAN_COLOR}$(the_environment_name)${RESET_COLOR} "
        else
            echo "$(the_environment_name) "
        fi
    else
        echo ""
    fi
}

function the_git_branch {
    CURRENT_GIT_BRANCH="$(__git_ps1 '%s')"

    if [ -n "$CURRENT_GIT_BRANCH" ]; then
        if [ "$color_prompt" = yes ]; then
            echo -e "${MAGENTA_COLOR}${CURRENT_GIT_BRANCH}${RESET_COLOR} "
        else
            echo "$CURRENT_GIT_BRANCH "
        fi
    else
        echo ""
    fi
}

function the_location {
    if [ "$color_prompt" = yes ]; then
        if [[ ${EUID} == 0 ]]; then
            echo -e "${RED_COLOR}\u@\h${RESET_COLOR}"
        else
            echo -e "${GREEN_COLOR}\u@\h${RESET_COLOR}"
        fi
    else
        echo "\u@\h"
    fi
}

function the_folder {
    if [ "$color_prompt" = yes ]; then
        echo -e "${WHITE_COLOR}\w${RESET_COLOR}"
    else
        echo "\w"
    fi
}

THE_LOCATION="$(the_location)"
THE_FOLDER="$(the_folder)"

function the_prompt_command {
    THE_VIRTUALENV="$(the_virtualenv)"
    THE_GIT_BRANCH="$(the_git_branch)"

    if [ "$color_prompt" = yes ]; then
        if [[ ${EUID} == 0 ]] ; then
            PS1="${THE_LOCATION} ${THE_FOLDER}\n# "
        else
            PS1="${THE_VIRTUALENV}${THE_LOCATION} ${THE_GIT_BRANCH}${THE_FOLDER}\n\$ "
        fi
    else
        PS1="${THE_VIRTUALENV}${THE_LOCATION} ${THE_GIT_BRANCH}${THE_FOLDER}\n\$ "
    fi

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
	xterm*|rxvt*)
	    PS1="\[\e]0;\u@\h \w\a\]$PS1"
	    ;;
	*)
	    ;;
    esac
}

PROMPT_COMMAND=the_prompt_command

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [ -x /usr/bin/dircolors ]; then
        # Linux specific configuration
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX specific configuration
    alias ls='ls -G'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lc='ls -F'

# Alias for handling the dotfiles git repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  # Homebrew on macOS
  if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function to {
    case $1 in
        "notes")
            cd ~/notes
            ;;
        "code")
            cd ~/code
            ;;
        "website")
            cd ~/code/python/personal-website
            ;;
        "")
            echo "Usage: to <location>"
            ;;
        *)
            echo "Unknown location: $1"
            ;;
    esac
}
