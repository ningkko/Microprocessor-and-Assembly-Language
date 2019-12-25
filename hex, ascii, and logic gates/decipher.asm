;;; ; hw6_1.asm
;;; ; Ning
;;; ; See readme for the program description
;;; ;
;;; ;	Note: You will  need 231Lib.o to run this program
;;; ;
;;; ; 	To assemble, link, and run:
;;; ;   nasm -f elf  decipher.asm
;;; ;   ld -melf_i386 -o decipher decipher.o 231Lib.o
;;; ;   ./hw6
;;; ;
        extern  _printString
        extern  _println
        extern  _getInput

        section .data
        prompt  db      "> "
        x       dd      0

        section .text
        global  _start

	
_start:
;;; ; display prompt
        mov     eax, 4
        mov     ebx, 1
        mov     ecx, prompt
        mov     edx, 2
        int     0x80

;;; ; get 32-bit integer, as a decimal
        call    _getInput

;;; ; now int entered by user is in eax.  Save in x
        ;;; to flip bits, xor the bits with 11111111.....
        ;;; to keep it unchanged, xor it with 000000....
        ;;; to create the effect, xor the input with 11000011001111001111000000001111.
        ;;; represent it in decimal representation, we get 3275550735.
        xor     eax, 3275550735
        mov     dword[x], eax
;;; ; display x as a string of 4 ascii chars
        mov     eax, 4
        mov     ebx, 1
        mov     ecx, x          ; address of "string"
        mov     edx, 4          ; number of chars: 1 int = 4 bytes
        int     0x80

        call    _println        ; print a line-feed

;;; ; exit
        mov     ebx, 0
        mov     eax, 1
                int     0x80	 	  	 		    	    	  	    	   	 	
