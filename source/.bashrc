#!/bin/bash
echo "loading .bashrc ..."

###############
# vars
###############
PS1="\w $ "

###############
# alias
###############
alias v='ls -lrt'
alias s='screen'


###############
# functions
###############

# return ftp path
fp() {
    path=$(pwd $1)
    file=$(basename $1)
    echo 'ftp://'$(hostname)${path}/${file}
}

# return scp path
sp() {
    path=$(pwd $1)
    file=$(basename $1)
    hostname=$(hostname)
    hostname=${hostname/.baidu.com/}
    whoami=$(whoami)
    echo $whoami@$hostname:${path}/${file}
}

# http server
hp() {
    echo $(hostname)
    python -m SimpleHTTPServer 
}

