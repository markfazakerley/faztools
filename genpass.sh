#!/bin/bash
# 
# (c) Mark Fazakerley 2018
# 
# Generate a few passwords for people. 
# 

WORDFILE=./words

# seed random from pid

for i in 1 2 3 4 5
do
	RANDOM1=$RANDOM
	RANDOM2=$RANDOM
	RANDOM3=$((RANDOM%900+100))

	# using cat means wc outputs only a number, not a number followed by a filename
	lines=$(cat $WORDFILE  | wc -l);
	rnum1=$((RANDOM2*RANDOM2%$lines+1));
	rnum2=$((RANDOM1*RANDOM1%$lines+1));
	first=$(sed -n "$rnum1 p" $WORDFILE)
	second=$(sed -n "$rnum2 p" $WORDFILE)
	echo $first$RANDOM3$second | tr '[:upper:]' '[:lower:]' 
done
