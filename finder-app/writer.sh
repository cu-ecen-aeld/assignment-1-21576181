#!/bin/bash


writefile=$1
writestr=$2


if ! [ $# -eq 2 ]
then
	echo "Failed: incorrect number of arguments. Expected number of arguments is 2"
	exit 1
fi

if [ -f $writefile ]
then
	echo "$writestr" > $writefile
	exit 0
else
    if [[ "${writefile:0:1}" == '/' ]]; then
        dir=${writefile%/*}
    elif [[ "$writefile" =~ .*/.* ]]; then
        dir="$(PWD)/${writefile%/*}"
    elif [[ "$writefile" =~ .*/.*/.* ]]; then
        dir="$(PWD)/${writefile%/*}"
    else
        dir=$(PWD)
    fi

    if mkdir $dir -p; then
        echo "$writestr" > $writefile
        exit 0
    else
        echo "Failed: directory could not be made"
        exit 1
    fi

fi






