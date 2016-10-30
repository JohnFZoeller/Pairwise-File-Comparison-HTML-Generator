#!/bin/bash

#John Zoeller
#Homework2 Part2
#Assume that we're in the home folder
# 	and that there is a directory called mus2
#		located in "desktop/mus2" that has 1000 1MB files
#In the next part I create that mus2 folder with those specifications

cd desktop/mus2;
COUNT=$(ls | wc -l);
for((j=1; j<=$COUNT; j++)); do 
	for((k=(j+1); k<=$COUNT; k++)) do 
		cmp -s $j.ogg $k.ogg; 
		if ! (($?)); then 
			echo "Match: " "track"$j".ogg" "track"$k".ogg"; 
		fi; 
	done; 
done;