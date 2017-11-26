function dotenv --description 'Load environment variables from the ~/.environment file'
  set -l envfile ~/.environment
  if test -e $envfile
    for item in (grep -v '^#' $envfile)
      set -l line (string trim $item)
      if [ -n $line ]
          set -l envname (echo $line | cut -d '=' -f 1)
          set -l envvalue (echo $line | cut -d '=' -f 2 | tr '\r' ' ')
          setenv $envname $envvalue
        end
    end
  end
end
