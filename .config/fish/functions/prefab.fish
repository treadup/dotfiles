function prefab
    if not [ -e ./index.html ]
	echo "Creating index.html"
	cp ~/.prefab/index.html ./index.html
    end

    if not [ -e ./index.js ]
	echo "Creating index.js"
	cp ~/.prefab/index.js ./index.js
    end

    if not [ -e ./package.json ]
	echo "Creating package.json"
	cp ~/.prefab/package.json ./package.json
    end

    if not [ -e ./babel.config.js ]
	echo "Creating babel.config.js"
	cp ~/.prefab/babel.config.js ./babel.config.js
    end
end
