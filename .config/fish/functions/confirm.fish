function confirm
  set -l message $argv[1]
  test -n "$message"; or set -l message "Confirm? [y/n]"

  while true
    read -p 'echo "$message "' -l confirm

    switch $confirm
      case Y y yes Yes YES
        return 0
      case N n no No NO
        return 1
    end
  end
end
