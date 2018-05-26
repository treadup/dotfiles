
# Map CapsLock to Ctrl. Terminate Xorg with Ctrl-Alt-Backspace.
setxkbmap -option ctrl:nocaps,terminate:ctrl_alt_bksp

# Load the .Xresoures file.
xrdb -merge ~/.Xresources

# Increase keyboard sensitivity.
xset r rate 250 60

# Start the StumpWM window manager.
exec sbcl --load ~/.stumpwm.d/startstumpwm.lisp
