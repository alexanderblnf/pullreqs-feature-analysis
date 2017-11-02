#!/bin/bash

if [ -z "$1" ]
then
	echo "Not enough arguments provided"
else
	INFILE=$1
	OUTFILE=${INFILE}_parsed
	cat $INFILE | tail -n +2 | cut -d$'\t' -f 2,3 | tr \\t ' ' > $OUTFILE
fi


