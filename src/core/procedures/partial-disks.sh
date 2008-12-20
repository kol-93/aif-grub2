#!/bin/bash
depend_procedure core base

var_OPTS_STRING="o:"
var_ARGS_USAGE="-o process/rollback: Operation: process the blockdevice layer or roll it back?"

process_args ()
{
        if [ "$1" = '-o' ]
        then
        	[ "$2" != process -a "$2" != rollback ] && die_error "You must specify 'process' or 'rollback'"
        	OPERATION=$2
        else
                usage
                exit 5
        fi
}


start_process ()
{
	if [ "$OPERATION" = process ]
	then
		process_disks
		process_filesystems
	elif [ "$OPERATION" = rollback ]
	then
		rollback_filesystems
	else
}