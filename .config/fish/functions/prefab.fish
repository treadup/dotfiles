function prefab
    if not [ -e ./index.html ]
	echo "Creating index.html"
	cat ~/.prefab/index.html > ./index.html
    end

    if not [ -e ./index.js ]
	echo "Creating index.js"
	echo "// JavaScript goes here" > ./index.js
    end
end
