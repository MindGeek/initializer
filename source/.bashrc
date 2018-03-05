#!/bin/bash
echo "loading .bashrc ..."

###############
# functions
###############

# return ftp path

log() {
    msg=$@
    echo $msg
}

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

source_file() {
  file=$1
  if [ -f "$file" ];then
      source "$file"
  else
      echo "$file not exists, ignore"
  fi
}

###############
# source configs
###############

source_file "/etc/bashrc"
source_file "$HOME/.inputrc"
source_file "$HOME/.bash_git_ps1.sh"
source_file "$HOME/.jumbo/etc/bashrc"  # pretty useful in Baidu.Inc


###############
# vars
###############
export PS1="\h: \W \$ "

###############
# alias
###############
alias v='ls -lrt'
alias s='screen'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias sb='source ~/.bashrc'

alias python="~/projects/local_run/jumbo/Jumbo/bin/python.sh"

alias hfs_nmg01='/home/work/hadoop-client/nmg01/hadoop/bin/hadoop dfs'
alias hfs_nmg01_rd='/home/work/hadoop-client/nmg01-rd/hadoop/bin/hadoop dfs'
alias hfs=hfs_nmg01_rd


###############
# PATH
###############
export PATH="~/bin:$PATH"

