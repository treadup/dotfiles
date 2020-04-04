function anonymize
    if [ (count $argv) != 2 ]
	echo "Usage: anonymize <url> <output filename>"
    else
       	set url $argv[1]
	set output $argv[2]
	set downloadto "/tmp/anonymize/$output"
	set anonymizeto "/Users/henrik/work/frontend-external/embed/test/fixtures/$output"

        # Create folder to store temporary files
	mkdir -p /tmp/anonymize

	# Download the json file
	curl -o $downloadto $url

        # Anonymize downloaded file and place it in text fixture folder
        node ~/work/frontend-external/scripts/anonymizeflow.js $downloadto $anonymizeto
    end
end
