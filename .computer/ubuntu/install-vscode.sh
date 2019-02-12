#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Make sure that we are in the home folder.
cd ~/

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo Installing Visual Studio Code
    umake ide visual-studio-code --accept-license ~/.local/share/umake/ide/visual-studio-code/
    ln -s /home/henrik/.local/share/umake/ide/visual-studio-code/bin/code /home/henrik/bin/code
    echo Finished installing visual studio code
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask install visual-studio-code
    ln -s "$HOME/.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
fi

code --install-extension ms-python.python

echo To list the currently installed vscode extensions run the following command.
echo code --list-extensions
