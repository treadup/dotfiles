#!/opt/homebrew/bin/fish

echo Listing local files that also exist in the config repo
echo This is for finding files that are in the config repo but
echo have not been removed locally.

for f in (config ls-files)
    if test -e $f
        echo $f
    end
end

