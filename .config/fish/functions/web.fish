function web
    http --follow $argv | html2text | less
end

