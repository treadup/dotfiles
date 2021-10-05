# Used to launch steam on Linux.
function steamgo {
    LD_PRELOAD='/usr/$LIB/libstdc++.so.6' steam
}

# Used to transfer files to transfer.sh
transfer() {
    if [ $# -eq 0 ]; then
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1;
    fi

    tmpfile=$( mktemp -t transferXXX );

    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;

    cat $tmpfile;
    rm -f $tmpfile;
}

# Create Python virtualenv
alias mkvenv='virtualenv -p python3 env'

# Activate virutal environment
function venv() {
    source env/bin/activate
}

# Week of year
alias week='date +%W'

function apt-installed() {
  (zcat $(ls -tr /var/log/apt/history.log*.gz); cat /var/log/apt/history.log) 2>/dev/null | \
  egrep '^(Start-Date:|Commandline:)' | \
  grep -v aptdaemon | \
  egrep '^Commandline:'
}

function github-create-repo() {
    echo Creating github repo $1
    curl -u 'treadup' https://api.github.com/user/repos -d '{"name":"'$1'"}'
}

# Lockscreen for OSX.
function lockscreen {
    echo "Ctrl-Cmd-Q to lock the screen"
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}

# Grep notes folder recursively
function notesgrep() {
    grep -r --exclude-dir=".git/" $1 ~/notes
}

# Touch all files in the given folder.
function touchall() {
    find $1 -exec touch {} \;
}

# On OSX add ability to launch Google Chrome, Firefox and Safari from the command line.
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX specific configuration
    function firefox() {
        open -a Firefox $@
    }

    function google-chrome() {
        open -a "Google Chrome" $@
    }

    function safari() {
        open -a Safari $@
    }
fi

# Connects to the running Emacs server.
# Creates a new graphical frame.
function em() {
    emacsclient -a '' $@
}


# Connects to the running Emacs server.
# Creates a new graphical frame.
function emc() {
    emacsclient -a '' -c $@
}

# Connects to the running Emacs server.
# Creates a new client frame on the current text terminal.
function emt() {
    emacsclient -a '' -t $@
}

function automute() {

    case $1 in
        "on" )
            amixer -c 0 sset 'Auto-Mute Mode' Enabled ;;
        "off" )
            amixer -c 0 sset 'Auto-Mute Mode' Disabled ;;
        "show" )
            amixer -c 0 sget 'Auto-Mute Mode' ;;
    esac
}

function web() {
    http --follow $1 | html2text | less
}

# Django
alias djr='python manage.py runserver'
alias djm='python manage.py migrate'
alias djmm='python manage.py makemigrations'
alias djs='python manage.py shell'

# Anaconda
function acp() {
    export PATH=$HOME/anaconda3/bin:$PATH
}

# tmuxp
alias tmuxp='pew in tmuxp tmuxp'


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias open='xdg-open';
fi
