#!/bin/sh

dubug="true"


nodeVersionFileName="./nvmrc"

echo "Cheching node version..."

thisPath="$(cd "$(dirname "$1")" && pwd -P)/$(basename "$1")"

oneDirUp=""

SCRIPTPATH=$(dirname "$SCRIPT")
#fileText=`cat $verFileName`

if [ "$dubug" = "true" ]
	then
	echo "This file path is $thisPath"
	echo "The content of the file is $fileText"
	
fi



 



