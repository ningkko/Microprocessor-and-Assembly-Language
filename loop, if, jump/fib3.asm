;;; fib3.asm
;;; Ning
;;; 
;;; The user enters a number # and the program will out put the #th fibonacci
;;; number
;;; 
;;; To assemble and run:
;;; 
;;; nasm -f elf -F stabs fib3.asm
;;; ld -melf_i386 -o fib3 fib3.o
;;; ./fib3
;;; -------------------------------------------------------------------

;;; ;  %include files here...
	extern      _printDec
	extern		_printString
	extern      _println
	extern		_printInt
	extern      _getInput
;;; ; ;  ------------------------------------------------------------
;;; ; ;  data areas
;;; ; ;  ------------------------------------------------------------

	section .data

	prompt          db      "> "
	promptLen       equ     $-prompt
	store           dd      0
;;; ; ;  ------------------------------------------------------------
;;; ; ;  code area
;;; ; ;  ------------------------------------------------------------

	section .text
	global  _start
_start:
    mov     ecx, prompt       ;print the prompt
    mov     edx, promptLen    ;edx stores the length
    call    _printString

    call    _getInput         
    mov     ecx, eax   ;store user input to ecx
    cmp     ecx, 3  ; if ecx <=3 just print 1

    mov     eax, 1  ; fibn       
    mov     ebx, 1  ; fibn-1
    mov     edx, 1; ; fibn-2
    
    jle     prnt
    sub     ecx, 3  ; else calculate thru the for loop
    
for:            
    mov     dword[store], eax  ; temp <-- fib
    mov     eax, ebx ; eax <-- fib-1
    mov     ebx, edx ; ebx <-- fib-2
    add     eax, ebx ; eax <-- fib-1 + fib-2 
    mov     edx, dword[store]  ;; edx <-- fib
    add     eax, edx ; eax <-- fib + fib-1 + fib-2   
    loop    for
    
prnt:
	call    _printInt	; print the ans which is stored in eax
	call 	_println	; print a line
	
;;; ; ;  exit()

	mov     eax,1
	mov     ebx,0
	int     0x80    	; final system call 	 	  	 		    	    	  	    	   	 	
