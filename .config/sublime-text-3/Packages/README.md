# Sublime Settings
It is possible to use Sublime without using Package control. This is done by just
having settings files located somewhere that Sublime Text will read from. A common
location for this is .config/sublime-text-3/<package name>.

In Sublime Text a package is just a folder that contains certain files. The name of
the package is the folder name.

## The Package folder
The .config/sublime-text-3/ folder is the package folder. This folder contains Packages
which are just folders. The name of the folder is the Package name. Usually these start
with an uppercase letter followed by lowercase.

## The User folder
The .config/sublime-text-3/User folder is the user folder. This may or may not formally
be a package.

If I understand things correctly the package manager will never overwrite stuff in this
folder.

## Settings files
The package contains a global settings file called Preferences.sublime-settings

    Preferences.sublime-settings

Then you have syntax specific settings. These are files named in the following manner.

    <Syntax name>.sublime-settings

Syntax specific settings file would be named as follows.

    Python.sublime-settings
    JSON.sublime-settings
    Markdown.sublime-settings
    XML.sublime-settings

In other words you would have the folder .config/sublime-text-3/User containing the following
files.

    Preferences.sublime-settings
    JSON.sublime-settings
    Markdown.sublime-settings
    XML.sublime-settings

## Per computer settings
One way of having per computer settings is to have different packages for the different
computers. Having a work and home package could be one way of organizing things. Or perhaps
one would want one package per host with the hostname as the package name.

## References
https://www.sublimetext.com/docs/3/settings.html
