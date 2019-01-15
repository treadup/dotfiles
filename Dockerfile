FROM python:latest

# Install packages.
RUN apt-get --yes update

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

# Create user
RUN groupadd -r henrik && useradd --no-log-init -r -g henrik henrik
USER henrik
WORKDIR /home/henrik
