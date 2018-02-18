# This file contains fish abbreviations

# Fish uses the universal variable $fish_user_abbreviations
# to store the users abbreviations. (It looks like it is
# possible to change this to a global variable.)

# Since $fish_user_abbreviations is a universal variable we
# want to set it once and then forget about it. This means
# that we can not create the abbreviations in config.fish
# since this is run each time you start a new shell.

# Instead we create a file called abbreviations.fish that
# we run once. This file will first clear fish_user_abbreviations
# and then set it to the correct value.

# If you want to add a new abbreviation that is under version control
# then just add it to this file. Then you need to execute this file
# again.

# Clear all existing abbreviations
set -U fish_user_abbreviations ''

#
# Git abbreviations
#

# There is already a function called g that wraps git.
# Therefore abbr g='git' is not needed.

# List untracked files
abbr -a glsu git ls-files --others --exclude-standard

# TODO: Abbreviations for navigating to project folders.
# TODO: Abbreviations for navigating to project folders
#       and activating a virtual environment.
# TODO: Abbreviations for django. Should be able to run
#       djr in any folder
# TODO: Abbreviations for yadm.
