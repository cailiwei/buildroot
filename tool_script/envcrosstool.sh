#!/bin/bash
# set crosstool path

# base=$(dirname $0)
# TODO please change the base value based on your toolschain dirname path
base=$HOME/qemu/toolschain

echo Starting in $base

if [ $# -ne 1 ]; then
	if [ -d "$base/4.4.3" ]; then
		CROSSTOOL="$base/4.4.3/bin"
		echo -n "Default "
	else
		echo "Usage: envbuildtool.sh path" 
	fi
else
	if [ -d "`pwd`/$1" ]; then
		CROSSTOOL=`pwd`/$1
	else
		echo "Input parameter error, not a dirname"
	fi
fi

echo "CROSSTOOL PATH: $CROSSTOOL"
PATH=$PATH:$CROSSTOOL
