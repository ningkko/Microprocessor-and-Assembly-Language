#!/bin/bash

## Yining Hua
## HW9_1.sh
## This program prints all the Fibonacci terms less than 100.

a=1    # fibonacci 1
b=1    # fibonacci 2

## Loop for n times
for((i = 0; i<100; i++))

do
    #if the number is greater than 100
    if [ $a -gt 100 ];
    then
        # exit
	    exit 0 
    fi
    # else print and compute
    echo -e "$a\r" 
    # define the function to sum up two previous numbers
    fib=$((a + b))  
    # update a to be b_old
    a=$b           
    # compute b_new = a_new + b_old
	b=$fib          

done	 	  	 		    	    	  	    	   	 	
