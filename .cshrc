# Color definitions
set     red="%{\033[1;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set   reset="%{\033[0m%}"

if ( $?VIRTUAL_ENV ) then
    set venvname=`basename $VIRTUAL_ENV`
    alias precmd 'set prompt="${cyan}${venvname}${reset} ${green}%n@%m${reset} %~ \n%% "'
else
    alias precmd 'set prompt="${green}%n@%m${reset} %~ \n%% "'
endif
