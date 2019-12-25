
/**
 * Converts a string to uppercase
**/
char *f1(char* s){
    
    char* p = s;
    // for each char in the string, if itis lowercased
    while(*p!='\0'){
        if (*p >= 97 && *p <=122){
            //convert it up uppercase
            *p -= 32;
        }
        p++;
    }

    return s;

}


/**
 * receives 3 integer parameters computes 
 * 4*(a + b) + 3*c and returns the result.
**/
int f2( int a, int b, int c ){
    return 4*(a+b)+3*c;
}

/**
 * returns the number of negative nums in a table
**/
int f3( int n, int* table ){
    
    int totalNum = 0;
    for (int i = 0; i < n; i++){
        if (*table < 0){	 	  	 		    	    	  	    	   	 	
            totalNum++;
        }
        table++;
    }

    return totalNum;
}

/**
 * receives three unsigned ints in the stack, and 
 * returns the smallest of the three 
 **/

int f4( int a, int b, int c ){
    
    int min;
    
    // a <= b&C
    if( (a <= b) && (a <= c)){
        min = a;
    }
    // c <= a&b
    else if ((c <= a) && (c <= b)){
        min = c;
    }
    // b <= a&c
    else if ((b <= a) && (b <= c)){
        min = c;
    }

    return min;
}

	 	  	 		    	    	  	    	   	 	
