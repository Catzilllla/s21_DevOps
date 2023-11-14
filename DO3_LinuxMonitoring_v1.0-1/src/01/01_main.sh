#!/bin/bash

if [[ $# -eq 0 ]];
then
	echo "haven't arguments"
elif (( $# > 1 ));
then
	echo "too many arguments"

elif [[ $1 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]];
then
	echo "Error: argument is number"
else
	echo $1
fi
exit 0
