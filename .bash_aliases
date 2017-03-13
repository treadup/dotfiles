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

# Python virtualenv launcher
alias venv='source env/bin/activate'

# Week of year
alias week='date +%W'

# Git aliases
# TODO: I should put these in the .gitconfig file instead of recreating them each time.
git config --global alias.last 'log -1 HEAD'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.undo 'reset --soft HEAD^'
git config --global alias.amend 'commit --amend -C HEAD'
git config --global alias.heroku 'push heroku master'

apt-installed() {
  (zcat $(ls -tr /var/log/apt/history.log*.gz); cat /var/log/apt/history.log) 2>/dev/null | \
  egrep '^(Start-Date:|Commandline:)' | \
  grep -v aptdaemon | \
  egrep '^Commandline:'
}

github-create-repo() {
    echo Creating github repo $1
    curl -u 'treadup' https://api.github.com/user/repos -d '{"name":"'$1'"}'
}

# Lockscreen for OSX.
alias lockscreen='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'