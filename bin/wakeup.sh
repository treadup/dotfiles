#!/bin/bash

# Disable automuting when headphones are plugged in
amixer -c 0 sset 'Auto-Mute Mode' Disabled

# Set master volume to something that will wake me up
amixer set 'Master' 80%

# Launch Spotify
(spotify 1>/dev/null 2>&1 &) || exit 1
sleep 10 || exit 1

# Play some music
spotify-cli --play

# I'm thinking about changing this to use something other
# than spotify since in certain cases it does not seem to
# play. For example if you have been listening on another
# device...


