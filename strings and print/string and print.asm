;;; ; hw3_2.asm
;;; ; Ning
;;; ;

        section .data
        msg1    db      "hello "
        msg2    db      "CSC231 "
;;; ;
        msg3    db      "students!",
                db      7, 10
        msg4    db      "rocks!",10
;;; ;
;;; ;
        section .text
        global  _start
_start:
        mov     eax, 4  ; write
        mov     ebx, 1  ; stdout
        mov     ecx, msg2 ; address of message to print
        mov     edx, 7 ; # of chars to print
        int     0x80


        mov     eax, 4  ; write
        mov     ebx, 1  ; stdout
        mov     ecx, msg4 ; address of message to print
        mov     edx, 7 ; # of chars to print

;;; ; exit
        mov     ebx, 0
        mov     eax, 1
        int     0x80	 	  	 		    	    	  	    	   	 	
