# The tab function runs the given command in a new tab.
function tab
    osascript -e 'tell application "Terminal" to activate'
    osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' 
    osascript -e "tell application \"Terminal\" to do script \"$argv\" in selected tab of the front window"
end
