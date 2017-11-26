function setenv
  if [ $argv[1] = "PATH" ]
    # Split the line on colons and spaces
    for item in (echo $argv[2] | tr ': ' \n)
      set -g PATH $PATH $item
    end
  else
    set -l envname $argv[1]
    set -l envvalue $argv[2..-1]
    echo $envvalue > /dev/null
    set -gx $envname $envvalue
  end
end
