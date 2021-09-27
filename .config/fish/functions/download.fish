function download -d "Downloads a file from oak"
    for f in $argv
	scp henrik@oak.mountainrainforest.org:~/transfer/$f .
    end
end
