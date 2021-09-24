function _bootstrap_fish_shell -d "Initial bootstrap of fish shell"
    echo Installing commonly used fish shell tools and utilities.

    echo Installing the fisher package manager for fish shell
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

    echo Installing fish fzf wrapper
    echo Plain fzf does not work well with the fish shell.
    fisher install jethrokuan/fzf
end
