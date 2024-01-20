function capitalize --description "Capitalize a word"
    string join '' (string upper (string sub --end 1 $argv[1])) (string lower (string sub --start 2 $argv[1]))
end
