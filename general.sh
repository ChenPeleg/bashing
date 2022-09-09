#!/bin/bash


echo "hi"
echo "choose one of the options:"
echo "1. save dir files in to a txt file"
echo "2. list all the files in this dir"
echo "3. exit\n" 
read a1
text1="you choose ${a1}"
echo "${text1}" 
a2="1"

if [ "$a1" == "$a2" ]; then
	echo "dir was saved in file"
elif [ "$a1" -eq "2" ]; then
	ls -lh
fi



read -p 'press any key to continue'



