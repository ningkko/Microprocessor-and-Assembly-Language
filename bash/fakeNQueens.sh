#!/bin/bash

# Loop for a sequence of numbers start with the 
# first argument the user inputs and ends with
# the second argument
# For each argument, run FakeNQueens on it, and 
# store the result into output.txt
#
# Note: You will need the java program FakeNQueen to run this bash script. 

for arg in `seq $1 $2`; do
    java FakeNQueens $arg  >> output.txt 
done

# Sort the resulted output.txt file and store
# the result into output_sorted.txt
sort -n output.txt > output_sorted.txt

# take the shortest and longest running time, cut them
# from the lines they are in and store them into 2 
# variables.

# Then output with echo
VAR1=$(head -1 output_sorted.txt | cut -d ' ' -f 2)
echo "shortest $VAR1"
VAR2=$(tail -1 output_sorted.txt | cut -d ' ' -f 2)
echo "longest $VAR2"

# Clean the txt we created for next calling of the bash program
rm output.txt
rm output_sorted.txt	 	  	 		    	    	  	    	   	 	
