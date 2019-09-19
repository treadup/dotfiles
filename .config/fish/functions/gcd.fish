function gcd --description "Change directory to the git root folder"
    if git root > /dev/null 2>/dev/null
	cd (git root)
    else
	set returnstatus $status
	echo "Not in a git folder"
	return $returnstatus
    end
end
