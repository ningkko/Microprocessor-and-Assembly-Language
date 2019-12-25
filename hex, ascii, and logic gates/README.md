### decipher.asm

The decipher program will decrypt the 4 bytes at Addresses x, x+1, x+2, and x+3 as follows:

The byte at Address x will have its lower 4 bits flipped. For example, if the byte contains 0x1A, or 00011010 binary, then the lower 4 bits get flipped, resulting in 00010101, or 0x15.
The byte at Address x+1 will have the top 4 bits flipped. For example, if the byte contains 0x12, or 00010010 in binary, its top 4 bits will be flipped, resulting in 11100010, or 0xE2.
The byte at Address x+2 will have the middle 4 bits flipped. For example, if the byte contains 0xF3, or 11110011 binary, the middle 4 bits flipped result in 11001111, or 0xCF.
The byte at Address x+3 will have the top 2 bits and lower 2 bits flipped. For example, if the byte contains 0x15, or 00010101 binary, having the top 2 and bottom 2 bits flipped result in 11010110, or 0xD6.
Once the 4 bytes are decrypted as just explained, the program will simply print x as if it were a string of 4 ASCII characters.

### decipher2.asm

The program will first prompt the user for an integer, which we'll call N.
it will then prompt the user to enter N integers
it xors each integer with the same mask used in Homework 6 (0xc33cf00f)
it then prints the collection of N integers as a string of characters.
(we'll assume that N will never be larger than 64)
