function otherpass
    # The otherpass command is just plain pass using a different password store directory.
    env PASSWORD_STORE_DIR=$HOME/.other-password-store pass $argv
end
