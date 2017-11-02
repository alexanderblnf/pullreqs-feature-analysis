#!/bin/bash

INFILE=$1
OUTFILE=${INFILE}_big
cat $1 | sed 's/\t/ /g' | awk '{ if ($5 > 500) print $2, $3 }' > $OUTFILE 
