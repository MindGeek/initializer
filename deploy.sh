#!/bin/bash

# This script try to deplay things onto your machine.

work_dir=$(dirname $0)
home_dir=$(cd ~ && pwd)
deplay_source_dir=source

function deplay()
{
	local src=$1
	local tar=$2
	cmd="cp $deplay_source_dir/$src $tar"
	log_notice $cmd
	eval $cmd
}

function deplay_one_file()
{
	local tar_name="$@"
	local tar="$home_dir/$tar_name"

	if [ ! -f $tar ]
	then
		deplay $tar_name $tar
		log_notice "deplay $tar done."
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
# deplay
#########################

# bash
deplay_one_file .bashrc

# vim
deplay_one_file .vimrc


#########################
# source
#########################
source $home_dir/.bashrc



