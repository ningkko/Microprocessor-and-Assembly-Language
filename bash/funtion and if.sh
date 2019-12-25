#! /bin/bash
# hw10.sh
# Yining Hua
# This program uses functions,
# allows the user to enter a list of words on the command line,
# searches Ulysses.txt for all the words listed on the command line using grep
# outputs the number of lines in which each word appears.
# If a word appears muttiple times on a given line, that counts as one.

# function to count how many tiems a word appears in a document
countWords() {

    # Loop thru all words passed in
    for word in "$@"; do

	# get the number of lines 
	lineNum=`grep -i $word Ulysses.txt | wc -l`

	# if there is no
	if [ $lineNum -eq 0 ] ; then
	    time="no times"
	fi

	# if appears only one time
	if [ $lineNum -eq 1 ] ; then
	    time="once"
	fi

	# if appears twice
	if [ $lineNum -eq 2 ] ; then
    	    time="twice"
	fi

	# if appears >2 times
	if [ $lineNum -gt 2 ] ; then
	    time="$lineNum times"
	fi

	# print
	echo "$word appears $time in Ulysses.txt"
    done

	return 0
}	 	  	 		    	    	  	    	   	 	

countWords "$@"