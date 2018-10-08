function steam
    switch (uname)
        case Linux
	    env LD_PRELOAD='/usr/$LIB/libstdc++.so.6' steam
        case Darwin
            command steam
    end
end
