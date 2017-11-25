function safari
  switch (uname)
    case Darwin
      open -a Safari $argv
    case '*'
      echo Safari is not supported on this operating system.
  end
end
