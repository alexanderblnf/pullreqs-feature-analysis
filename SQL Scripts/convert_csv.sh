#!/bin/bash

if [ -z "$1" ]
then
	echo "No argument provided"
else
	INFILE=$1
	OUTFILE=${INFILE}.csv
	cat $INFILE | tr \\t ',' > $OUTFILE
fi


