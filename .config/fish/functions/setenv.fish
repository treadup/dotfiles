function setenv
  if [ $argv[1] = "PATH" ]
    # Split the line on colons and spaces
    for item in (echo $argv[2] | tr ': ' \n)
      if [ $item != "\$PATH" ]
        # Force full expansion of the item variable.
        set -l expanded_item (eval echo (eval echo "$item"))
        if not contains $expanded_item $PATH
          set -g PATH $PATH $expanded_item
        end
      end
    end
  else
    set -l envname $argv[1]
    set -l envvalue $argv[2..-1]
    echo $envvalue > /dev/null
    set -gx $envname $envvalue
  end
end
