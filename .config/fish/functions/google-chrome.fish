function google-chrome
  switch (uname)
    case Linux
      eval (which google-chrome) $argv
    case Darwin
      open -a "Google Chrome" $argv
    case '*'
      echo Fix the google-chrome fish command for this operating system.
  end
end
