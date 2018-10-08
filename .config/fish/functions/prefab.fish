function prefab
    if not [ -e ./index.html ]
	echo "Creating index.html"
	cp ~/.prefab/index.html ./index.html
    end

    if not [ -e ./index.js ]
	echo "Creating index.js"
	cp ~/.prefab/index.js ./index.js
    end
end
