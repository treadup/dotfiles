function docker-compose
    if [ 0 = (count $argv) ]
	command docker-compose
    else if [ $argv[1] = "down" ]
	echo "The command docker-compose down has been disabled using a fish function."
	echo "Use command docker-compose down if you really want to do this."
    else
	command docker-compose $argv
    end
end
