#!/bin/bash
echo "Calling program name: $0"
echo ""
pCount=$#
echo "This script was called with $pCount positional parameters"
echo ""
echo "Listing positional parameters..."
if [ -z "$1" ]; 
then
	echo "No positional parameters were called"
else
	for (( i=1 ; i<= $pCount ; i++));
	do
		echo "${!i}"
	done
fi
