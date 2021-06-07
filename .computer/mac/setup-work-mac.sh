#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Make sure that we are in the home folder.
cd ~/

# To use this script you have to have at least the XCode command line tools installed.
if xcode-select -p 2> /dev/null 1> /dev/null; then
    echo Xcode command line tools are installed
else
    echo Xcode command line tools are not installed
    echo Install them using the xcode-select --install command.
    exit
fi

# Install Homebrew
echo Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update homebrew
brew update

export PATH=/usr/local/bin:$PATH

echo --------------------------------------------------------
echo Creating standard folders
echo --------------------------------------------------------

echo Create user bin folder
mkdir -p ~/bin

export PATH=$HOME/bin:$PATH

echo --------------------------------------------------------
echo Installing Base Packages
echo --------------------------------------------------------

echo Installing Git
brew install git
git config --global core.excludesfile ~/.gitignore_global

echo Installing coreutils
brew install coreutils

echo --------------------------------------------------------
echo Installing Security Packages
echo --------------------------------------------------------

echo Installing GPG
brew install gnupg2
brew install pinentry-mac
ln -s $HOME/.gnupg/gpg-agent.conf.macos $HOME/.gnupg/gpg-agent.conf

echo Installing pass
brew install pass

echo Installing pwgen
brew install pwgen

echo --------------------------------------------------------
echo Installing Shells
echo --------------------------------------------------------

echo Installing Fish shell
brew install fish

echo Installing bash completion
brew install bash-completion

echo --------------------------------------------------------
echo Installing Editors
echo --------------------------------------------------------

echo Installing Emacs
brew install --no-quarantine homebrew/cask/emacs

echo Installing Vim
brew install vim

echo --------------------------------------------------------
echo Installing Network Tools
echo --------------------------------------------------------

echo Installing tmux
brew install tmux

echo Installing screen
brew install screen

echo Installing mosh
brew install mosh

echo --------------------------------------------------------
echo Installing Java
echo --------------------------------------------------------

echo Installing Java
brew cask install adoptopenjdk

echo ---------------------------------------------------------
echo Installing Servers
echo ---------------------------------------------------------

echo ---------------------------------------------------------
echo Installing Databases
echo ---------------------------------------------------------

echo ---------------------------------------------------------
echo Installing Cloud Tools
echo ---------------------------------------------------------

echo ---------------------------------------------------------
echo Installing Document Tools
echo ---------------------------------------------------------

echo ---------------------------------------------------------
echo Installing Container Tools
echo ---------------------------------------------------------

echo ---------------------------------------------------------
echo Installing Command Line Tools
echo ---------------------------------------------------------

brew install tree
brew install wget
brew install the_silver_searcher
brew install ripgrep
brew install ispell
bres install dict
brew install fd
brew install fzf
brew install fzy
brew install yank
brew install pick
brew install trash
brew install htop

echo ---------------------------------------------------------
echo Installing Fonts
echo ---------------------------------------------------------

echo Installing fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro

echo ---------------------------------------------------------
echo Installing Accessability Tools
echo ---------------------------------------------------------

echo Installing Rectangle
brew install --cask rectangle

echo --------------------------------------------------------
echo Cloning dot files
echo --------------------------------------------------------

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
echo Cloning dot files repo
git clone --separate-git-dir=$HOME/.dotconf https://github.com/treadup/dotfiles.git $HOME/dotconf-tmp
rm -r ~/dotconf-tmp/
/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME config status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME checkout .
echo Finished cloning dot files repo

# Download git-prompt
echo Downloading git prompt
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo Finished downloading git prompt

echo --------------------------------------------------------
echo Cloning Emacs config
echo --------------------------------------------------------
# Download .emacs.d repo
echo Cloning Emacs configuration repo
git clone https://github.com/treadup/.emacs.d.git ~/.emacs.d
echo Finished cloning Emacs configuration repo

echo --------------------------------------------------------
echo Installing Python
echo --------------------------------------------------------

echo --------------------------------------------------------
echo Installing Golang
echo --------------------------------------------------------

echo --------------------------------------------------------
echo Installation finished
echo --------------------------------------------------------
echo
echo Either generate a new GPG key or import an existing GPG key.
echo To generate a new GPG key use the following command.
echo
echo    gpg --gen-key
echo
echo Next initialize pass by executing the following commands.
echo
echo     pass init \<email\>
echo     pass git init
echo
echo Use the email address associated with the GPG key that should be used.
echo
echo Remember to configure the keyboard.
echo Use F1, F2, etc keys as function keys
echo Key Repeat should be Fast
echo Delay Until Repeat should be Short
echo Modifier Keys use Caps Lock as Control
