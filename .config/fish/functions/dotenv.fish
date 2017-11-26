function dotenv --description 'Load environment variables from the ~/.environment file'
  set -l envfile ~/.environment
  if test -e $envfile
    for line in (cat $envfile)
      set -l envname (echo $line | cut -d '=' -f 1)
      set -l envvalue (echo $line | cut -d '=' -f 2 | tr '\r' ' ')
      setenv $envname $envvalue
    end
  end
end
