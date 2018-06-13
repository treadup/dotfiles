# Gnome Settings
Gnome settings are handled by a couple of different tools.

1. dconf
2. gsettings
3. gnome-tweak-tool

## Gnome Tweak Tool
Gnome Tweak Tool is a gui tool that lets you easily make changes to
Gnome. To install gnome tweak tool use the following command.

    apt install gnome-tweak-tool

To run the gnome tweak tool use the following command.

    gnome-tweaks

## GSettings
GSettings is the new system for storing configuration settings for
Gnome. To interact with GSettings you use the gsettings command line
tool.

    gsettings

GSettings uses different backends to store its settings. On Linux
GSettings uses dconf as its backend.

## dconf
The backend for GSettings on Linux is called dconf. To interact
directly with dconf you can use the dconf command line tool.

    dconf

## Monitoring GSettings changes
There are a couple of different ways you can go about monitoring
changes to the GSettings.

### Watch dconf changes
You can use the following command to watch all dconf changes.

    dconf watch /

Run the above command and then make settings changes in the UI. Look
at the output of dconf watch / to see the change that was made.

This works since dconf is the backend for GSettings on Linux.

### Diff gsettings before and after
Another way is take a snapshot of the settings before and after you
make the changes to the settings.

1. gsettings list-recursively > /tmp/gsettings.before

2. Change some settings

2. gsettings list-recursively > /tmp/gsettings.after

You then diff the files using diff to see what has changed.

    diff /tmp/gsettings.before /tmp/gsettings.after

## Set setting value
To set the value of a setting we can use the gsettings command.

    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

It is best to put these in a script that you run once when configuring
a new computer.
