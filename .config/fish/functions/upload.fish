function upload -d "Uploads a file to oak"
    for f in $argv
	ssh henrik@oak.mountainrainforest.org mkdir -p ~/transfer
	scp $f henrik@oak.mountainrainforest.org:~/transfer/(basename $f)
    end
end
