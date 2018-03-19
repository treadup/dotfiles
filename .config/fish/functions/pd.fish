function pd
    set -l projectDir (ppd)

    if test $status -eq 0
       cd $projectDir
    end
end
