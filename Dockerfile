# An image with commonly used shell utilities. Useful to add to a Docker compose
# file or to run in a cluster.
#
# Build it using the following command.
#     docker build -t treadup/dotfiles .
#
# Run it using the following command.
#     docker run -it treadup/dotfiles bash
# or
#     docker run -it treadup/dotfiles fish

FROM ubuntu:21.04

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
RUN apt-get --yes install python3 python3-pip python3-dev python3-setuptools python3-wheel

# Install Git
RUN apt-get --yes install git

# Install Vim
RUN apt-get --yes install vim

# Install bash completion
RUN apt-get --yes install bash-completion

# Install fish
RUN apt-get --yes install fish

# Install pick
RUN apt-get install -y pick

# Install zip
RUN apt-get --yes install zip unzip

# Install http cli clients
RUN apt-get --yes install curl wget

# Install ag
RUN apt-get --yes install silversearcher-ag

# Install tmux
RUN apt-get --yes install tmux

# Install direnv
RUN apt-get --yes install direnv

# Create user
RUN groupadd -r henrik && useradd --no-log-init -r -g henrik henrik
RUN mkdir /home/henrik && chown henrik:henrik /home/henrik
USER henrik
WORKDIR /home/henrik

# Python
RUN mkdir .virtualenvs/

# Install database utilities
RUN pip3 install pgcli

# Install vritualfish
RUN pip3 install virtualfish

# Readline
COPY .inputrc .inputrc

# Vim
COPY .vimrc .vimrc

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

COPY .config/fish/functions/* .config/fish/functions/

# Git
COPY .gitconfig .
COPY .gitignore .
COPY .gitignore_global .

# screen
COPY .screenrc .

# tmux
COPY .tmux.conf .

# Postgres
COPY .psqlrc .

# Keep this container running until you stop it.
# CMD ["sleep", "infinity"]
