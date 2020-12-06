#!/usr/local/bin/bash

if [ $# -ne 2 ]
then
echo "Need 2 arguments"
exit 1
fi

intregex='^(\+|-)?[0-9]+$'
if ! [[ $1 =~ $intregex ]] || ! [[ $2 =~ $intregex ]]
 then
echo "Both arguments must be integers"
exit 1
fi

let ans=($1+$2)*12
echo $ans
