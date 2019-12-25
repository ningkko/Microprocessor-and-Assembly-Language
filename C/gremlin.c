// hw10.c
// Yining Hua
// Reads a text file and displays its contents on the screen. 
// The added twist for this homework is that the program will replace every 'g' character
// it finds with "gremlin" and every 'G' with "GREMLIN". 
//
// To compile and run:
//
// gcc -o hw10prep hw10prep.c
// ./hw10prep someTextFile.txt
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXLEN 1000

int main( int argc, char *argv[] ) {
  char fileName[100];
  char line[MAXLEN];
  FILE *filep;
  
  // display syntax if no arguments passed on command line
  if ( argc <= 1 ) {
    printf("Syntax: %s filename\n", argv[0] );
    exit( 0 );
  }

  // if an argument is passed, it must be a file name
  strcpy( fileName, argv[1] );
  
  // attempt to open the file
  filep = fopen( fileName, "r" );

  // if error, stop
  if ( filep==NULL ) {
    printf( "Error opening %s\n", fileName );
    exit( 1 );
  }	 	  	 		    	    	  	    	   	 	

  // read the file, line by line and display
  // each line on the screen.
  while (fgets( line, MAXLEN, filep) != NULL) {
     
     // loop thru the original line
     for (int i = 0;line[i]!='\0';i++)
        {   
            // replace g with gremlin
            if ( line[i] == 'g')
            {
                 printf("%s", "gremlin");
            }
            // and G with GREMLIN
            else if ( line[i] == 'G')
            {
                printf("%s", "GREMLIN");
            }
            else{
                // if not g or G, append the original char
                printf("%c", line[i]);
            }
        }
  }
  fclose( filep );
  
  return 0;
}	 	  	 		    	    	  	    	   	 	
