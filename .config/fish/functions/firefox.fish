function firefox
  switch (uname)
    case Linux
      eval (which firefox) $argv
    case Darwin
      open -a Firefox $argv
    case '*'
      echo Fix the firefox fish command for this os.
  end
end
