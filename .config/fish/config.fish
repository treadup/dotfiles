
# Set the  environment
source ~/.environment

#
# Directory navigation
#

alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

#
# Setup virtualfish
#

# Use the command vf connect to connect a virtual environment to a specific
# folder in the filesystem. To do this you have to have manually activated
# the virtual environment and be in the folder that you want to connect.
# Also the first time you do this you will have to manually deactivate the
# virtual environment to be able to test that auto enabling is working.

eval (python3 -m virtualfish auto_activation)
