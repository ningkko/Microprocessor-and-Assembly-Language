### f1( s )
Receives the address of a string s in the stack, as well as its length, and converts the string to uppercase, replacing all the alphabetic characters in the string to uppercase.

### f2(a, b, c)

f2 receives 3 integer parameters in the stack and computes 4*(a + b) + 3*c and returns the result in eax.

### f3( table, n )
The function receives the address of an array of ints in the stack, as well as the number of ints in the array. It returns in eax the number of negative ints in the array.

Note: f3 should not modify any of the other registers, besides eax.

### f4( a, b, c )
The function receives three unsigned ints in the stack, and returns the smallest of the three in eax. 

f4 should not modify any of the other registers, besides eax