;;;  hw8_2.asm
;;;  Ning
;;;  The program  will first prompt the user for an integer
;;;  which we'll call N.
;;;  it will then prompt the user to enter N integers
;;;  it xors each integer with the same mask used in Homework 6 (0xc33cf00f)
;;;  it then prints the collection of N integers as a string of characters.
;;;  (we'll assume that N will never be larger than 64)
	
;;; ; to assemble and run:
;;; ; nasm -f elf -F  stabs hw8_2.asm
;;; ; ld -melf_i386 -o hw8_2 hw8_2.o

	extern  _printInt
	extern  _printString
	extern  _println
	extern  _getInput
	
	section	.data
prompt		db	"> "
promptLen	equ	$-prompt	

N		dd 	0			; the integer the user enters
array	    dd	0,0,0,0,0,0,0,0
    		dd	0,0,0,0,0,0,0,0
	    	dd	0,0,0,0,0,0,0,0
		    dd  0,0,0,0,0,0,0,0
		    dd  0,0,0,0,0,0,0,0
		    dd  0,0,0,0,0,0,0,0
		    dd  0,0,0,0,0,0,0,0
		    dd  0,0,0,0,0,0,0,0

printLen	dd	0   ;; to store the number of characters to be printed out

	section	.text
	global	_start

_start:
	;; display prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 2
    int 0x80
	
	;; get N
	call	_getInput
	mov	    dword[N], eax
	;;esi is used for keeping track of our input array (Link it with the address of it).
    mov     ecx, eax
	mov	    esi, array
	
	;; -------------------------------------------------
	;; for loop to take in N integer inputs
	;; -------------------------------------------------
get_Input:
    ;; save ecx
    push ecx

	;; print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 2
    int 0x80
	
	;; get the input and store in the arraylist we created after xor it.
	call	_getInput
	xor	    eax, 0xc33cf00f
	mov	    dword[esi], eax
	;; increase esi by 4 to get to the next integer position
	add	    esi, 4
	;; retrieve ecx
	pop     ecx
	loop    get_Input


printArray:

    ;; calculate the number of characters to be printed out
    mov eax, 4
    mul dword[N]
    mov dword[printLen], eax

    
    mov eax, 4
    mov ebx, 1
    mov ecx, array 
    mov edx, dword[printLen]
    int 0x80
    call _println


	;; -----------------------------------
	;; exit
	;; -----------------------------------
	mov	    ebx, 0
	mov	    eax, 1
	int     0x80	 	  	 		    	    	  	    	   	 	
