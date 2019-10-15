function serve
    set workingdir (pwd)
    set currentip (localip)
    set port 6060
    echo "Serving $workingdir on $currentip:$port"
    python3 -m http.server $port > /dev/null
end
