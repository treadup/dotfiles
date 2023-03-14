function cd --description 'icd and follow real path when following a symlink'
     builtin cd $argv

     # Check if we are in a symlink folder
     if test (pwd -P) != (pwd -L)
         # Follow the symlink
         builtin cd (pwd -P)
     end
 end
