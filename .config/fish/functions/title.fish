# The title function sets the title of the tab
# For this to work correctly make sure that the terminal application
# itself is not displaying stuff in the tab title.
# Go to Terminal > Preferences > Tab and uncheck unwanted suff that
# the terminal is displaying.
function title
    set -l tabtitle $argv[1]
    function fish_title --inherit-variable tabtitle
        echo "$tabtitle"
    end
end
