#!/bin/bash 


filesdir=$1
searchstr=$2 


if ! [ $# -eq 2 ] 
then 
	echo "Failed: incorrect number of arguments. Expected number of arguments is 2"
	exit 1
fi

if ! [ -d "$filesdir" ]
then 
	echo "Failed: ${filesdir} is not a directory in the file system"
	exit 1
fi 

num_files=$(find $filesdir -name "*.txt" | xargs grep -cl $searchstr | wc -l)
num_lines=$(find $filesdir -name "*.txt" | xargs grep -r $searchstr | wc -l)
echo "The number of files are ${num_files} and the number of matching lines are ${num_lines}" 
exit 0

