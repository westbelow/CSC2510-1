#!/bin/bash
pCount=$#
# checks if correct amount of parameters
if [[ $pCount -ne 2 ]]
then
	echo "Incorrect amount of arguments received. Exiting..."
#checks if file specified by parameter 1 exists
elif ! [ -f $1 ]
then 
	echo "File (as listed in first parameter) does not exist. Exiting..."
# checks if name specified by parameter 2 exists in file 1
elif grep -Fxq "$2" $1
	then
	lineNum="$(grep -n "$2" $1 | head -n 1 | cut -d: -f1)"
	echo "String $2 already exists in file $1. Line number $lineNum"
else
# Prompt user to confirm that they add line to file
echo "String $2 does not yet exist in file $1. Would you like to insert it?"
read boolInsert
lowerBoolInsert=$(echo $boolInsert | tr '[:upper:]' '[:lower:]')
case $lowerBoolInsert in 
	"y" | "ye" | "yes")
		echo "Inserting into file..."
		echo ""
	;;
	
	"n" | "no")
		exit
	;;
esac
echo "You have chosen to add $2 to the list $1. Would you like to alphabetize $1?"
while ! [ "$isValid" = 1 ]
do
	echo "[Y/N]"
	read input
	lowerinput=$(echo $input | tr '[:upper:]' '[:lower:]')
	case $lowerinput in
	"y" | "ye" | "yes")
		# alphabetize the list
		echo "$2" >> $1
		sort $1 -o $1
		exit
	;;
	"n" | "no")
		# skip alphabetization add string to end of list
		echo "$2" >> $1
		exit
	;;
	esac
done
fi