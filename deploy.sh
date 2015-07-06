#!/bin/bash

# This script try to deplay things onto your machine.

work_dir=$(dirname $0)
home_dir=$(cd ~ && pwd)
deplay_source_dir=source


function deplay()
{
	src=$1
	tar=$2
	cmd="cp $deplay_source_dir/$src $tar"
	echo $cmd
	eval $cmd
	
}

# vim
deplay source.vimrc $home_dir/.vimrc
