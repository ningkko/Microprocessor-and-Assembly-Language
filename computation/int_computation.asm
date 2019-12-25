;;;  hw4_1.asm
;;;  Ning
;;;  An assembly program that computes 4*(2*a+b+c) + 2*(c+1) with given a b c 
;;;  ...

	        extern  _printDec
		extern  _printInt
	        extern  _printString
	        extern  _println
	        extern  _getInput
	
	section	.data
prompt		db	"> "
promptLen	equ	$-prompt	
ansStr          db      "ans = "
ansStrLen	equ	$-ansStr	

a		dd	0
b		dd	0
c		dd	0
ans		dd	0
	
		section	.text
		global	_start
_start:
	;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString
	;; get a
		call	_getInput
		mov	dword[a], eax

	;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString
	;; get b
		call	_getInput
		mov	dword[b], eax
	
	;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString
	;; get c
		call	_getInput
		mov	dword[c], eax
	
	;; -----------------------------------
	;; computation: ans =   4*(2*a+b+c) + 2*(c+1) 
	;; -----------------------------------

	;;; put your code here, between the computation and display
	;;; comments

	mov eax, dword[ans]
	add eax, dword[a]
	add eax, dword[a]
	add eax, dword[b]
	add eax, dword[c]
	
	add eax, dword[a]
	add eax, dword[a]
	add eax, dword[b]
	add eax, dword[c]

	add eax, dword[a]
	add eax, dword[a]
	add eax, dword[b]
	add eax, dword[c]

	add eax, dword[a]
	add eax, dword[a]
	add eax, dword[b]
	add eax, dword[c]

	add eax, dword[c]
	add eax, 1
	add eax, dword[c]
	add eax, 1
	mov dword[ans], eax

	;; -----------------------------------
	;; display "ans = "
	;; -----------------------------------
		mov	ecx, ansStr
		mov	edx, ansStrLen
		call	_printString

	;; -----------------------------------
	;; display ans variable
	;; -----------------------------------
		mov	eax, dword[ans]
		call	_printInt
		call	_println
		call	_println
	
;;; exit
		mov	ebx, 0
		mov	eax, 1
		int     0x80
	 	  	 		    	    	  	    	   	 	
