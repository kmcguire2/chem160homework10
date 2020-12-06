#!/usr/local/bin/bash

if [ ! -x $1 ]
then
echo "No file found"
exit 1
fi

intregex='^[0-9]+$'
if ! [[ $2 =~ $intregex ]]
then
echo "Second argument must be an integer"
exit 1
fi

if ! [[ $3 =~ $intregex ]] && [ $# -eq 3 ]
then
echo "Third argument must be an integer"
exit 1
fi


lines=$(wc $1 | awk '{print $1}')


if [ $# -eq 3 ]
then
	if [ $lines -lt $3 ] || [ $lines -lt $2 ]
	then
		echo "File too short for specified lines"
		exit 1
	else
		echo "Head:"
		head -n $2 $1
		echo "Tail:"
		tail -n $3 $1
	fi
elif [ $# -eq 2 ]
then
	if [ $lines -lt $2 ]
	then
                echo "File too short for specified lines"
                exit 1
        else    
                echo "Head:"
                head -n $2 $1
                echo "Tail:"
                tail -n $2 $1
	fi
fi
