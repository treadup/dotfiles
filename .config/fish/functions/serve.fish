function serve
    set currentip (localip)
    set port 6060

    if [ "$PWD" = "$HOME" ]
        echo "Blocking serving of home directory"
        return 1
    end

    if [ "$PWD" = "$HOME/.ssh" ]
        echo "Blocking serving of .ssh folder"
        return 1
    end

    if [ "$PWD" = "$HOME/.gnupg" ]
        echo "Blocking serving of .gnupg folder"
        return 1
    end

    echo "Serving $PWD on $currentip:$port"
    python3 -m http.server $port > /dev/null
end
