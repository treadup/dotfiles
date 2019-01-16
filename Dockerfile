FROM ubuntu:latest

# Only use noninteractive options when running the apt-get commands below.
ENV DEBIAN_FRONTEND=noninteractive

# Set the time zone to Stockholm
ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages.
RUN apt-get --yes update

# Install english language pack
RUN apt-get --yes install language-pack-en

# Install Python
RUN apt-get --yes install python-pip python3-pip python3-dev python3-setuptools python3-wheel

# Install Git
RUN apt-get --yes install git

# Install Vim
RUN apt-get --yes install vim

# Install Fish
RUN apt-get --yes install fish

# Install pick
RUN apt-get install -y pick

# Install zip
RUN apt-get --yes install zip unzip

# Install http cli clients
RUN apt-get --yes install curl wget httpie

# Install ag
RUN apt-get --yes install silversearcher-ag

# Install tmux
RUN apt-get --yes install tmux

# Install aws cli command
RUN apt-get --yes install awscli

#
# Fonts
#

# Install Fira Code fonts
RUN apt-get install -y fonts-firacode

# Install DejaVu fonts
RUN apt-get install -y fonts-dejavu

# Install Liberation fonts
RUN apt-get install -y fonts-liberation

# Install Inconsolata font
RUN apt-get install -y fonts-inconsolata

# Install powerline fonts
# This package provides the fonts used by powerline. This package
# also contains the fontconfig settings that make these symbols
# available as part of other installed fonts.
# In other words the fonts-powerline only modifies existing fonts.
# It does not install complete new font families.
RUN apt-get install -y fonts-powerline

# Create user
RUN groupadd -r henrik && useradd --no-log-init -r -g henrik henrik
RUN mkdir /home/henrik && chown henrik:henrik /home/henrik
USER henrik
WORKDIR /home/henrik

# Python
RUN mkdir .virtualenvs/
RUN pip3 install virtualenv

# Install database utilities
RUN pip3 install pgcli
RUN pip3 install mycli

# Install vritualfish
RUN pip3 install virtualfish

# Install poetry
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

# Readline
COPY .inputrc .inputrc

# Vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
COPY .vimrc .vimrc

# Install all vim plugins
# RUN vim +PluginInstall +qall
# Use the :PluginInstall command from inside Vim to install the plugins.

# Bash
COPY .bashrc .
COPY .bash_profile .
COPY .bash_aliases .
COPY .profile .

# Download git-prompt
RUN curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh


# # Fish
RUN mkdir -p ~/.config/fish/functions
COPY .config/fish/abbreviations.fish .config/fish/abbreviations.fish
COPY .config/fish/config.fish .config/fish/config.fish

COPY .config/fish/functions/fish_greeting.fish .config/fish/functions/fish_greeting.fish
COPY .config/fish/functions/fish_prompt.fish .config/fish/functions/fish_prompt.fish
COPY .config/fish/functions/setenv.fish .config/fish/functions/setenv.fish
COPY .config/fish/functions/venv.fish .config/fish/functions/venv.fish

# Git
COPY .gitconfig .
COPY .gitignore .
COPY .gitignore_global .

# screen
COPY .screenrc .

# ssh
RUN mkdir -p .ssh
COPY .ssh/config.default .ssh/config.default

# tmux
COPY .tmux.conf .
