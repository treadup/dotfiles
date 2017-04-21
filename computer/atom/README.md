# Atom
Atom is an open source text editor.

## Installing Atom
On ubuntu you can install atom using the following command.

    umake ide atom

## Atom Package Management
The atom editor comes with a package manager called apm. The apm
package manager can be used to install packages or list the currently
installed packages.

### Listing installed packages
To list the currently installed packages you can use the following command.

    apm list --installed --bare > ~/computer/atom/atom-installed-packages.txt

### Install packages
To install packages listed in a file you can use the following
command.

    apm install --packages-file ~/computer/atom/atom-installed-packages.txt
    
## Atom configuration file
The main atom configuration file is located at the following location.

    ~/.atom/config.cson
    
It should be enough to put this file under source control. Put these
in the repo with the rest of the dotfiles.


