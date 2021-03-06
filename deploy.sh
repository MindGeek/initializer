#!/bin/bash

# This script try to deploy things onto your machine.

work_dir=$(dirname $0)
home_dir=$(cd ~ && pwd)
deploy_source_dir=source

function deploy()
{
	local src=$1
	local tar=$2
	cmd="cp $deploy_source_dir/$src $tar"
	log_notice $cmd
	eval $cmd
}

function deploy_one_file()
{
	local tar_name="$@"
	local tar="$home_dir/$tar_name"

	if [[ ! -f $tar || $force == 1 ]]
	then
		deploy $tar_name $tar
		log_notice "deploy $tar done."
	else
		log_warning "$tar already exists, I won't cover it!"
	fi
}


function log_warning()
{
	msg="$@"	
	echo "WARNING:	$msg"
}

function log_fatal()
{
	msg="$@"
	echo "FATAL:	$msg"
	exit 1
}

function log_notice()
{
	msg="$@"
	echo "NOTICE:	$msg"
}

#########################
# checking argv
#########################
force=$1
if [[ $force == "-f" ]]
then
    force=1
else 
    force=0
fi


#########################
# deploy
#########################

# bash
deploy_one_file .inputrc
deploy_one_file .bashrc
deploy_one_file .bash_profile
deploy_one_file .bash_git_ps1.sh

# zsh
deploy_one_file .zshrc

# vim
deploy_one_file .vimrc
mkdir -p $home_dir/.vimbackup

# git
deploy_one_file .gitconfig


#########################
# source, no use
#########################
echo "You should run:"
echo source $home_dir/.bash_profile



