;;; toUppercase.asm
;;; Ning
	
;;; The program gets a string and transforms it to uppercase.
;;; Also transforms . into ! signs.
;;;                              
;;; To assemble, link, and run:  
;;;     nasm -f elf  toUppercase.asm  
;;;     ld -melf_i386 -o toUppercase toUppercase.o 
;;;     ./toUppercase       
;;;      

                section .data
prompt		db	"> "
		
		section	.bss
myString	resb	10000
	
	section .text
        global  _start
	extern	_getString, _printString, _println
_start:
	
;;; display prompt
	
	mov	ecx, prompt
	mov	edx, 2

;;; get input string

	call	_printString
	call	_getString

;;; --- scan theinput string ---

	mov	esi, ecx
	mov	edi, ecx
	mov	ecx, edx

;;; loop thru the string character by character
for:
	;; if not lowercase, go check if it's a '.'
	cmp	byte[esi], 'a'
	jl	isDot
	cmp	byte[esi], 'z'
	jg	isDot
	
	;; if lowercase, trans to uppercase
	add	byte[esi], -'a'+'A'


isDot:
	;; check if dot
	cmp	byte[esi], '.'
	;; if not goto next char
	jne	nextChar
	;; otherwise change to "!"
	mov	byte[esi], '!'
	
nextChar:
	;; just loop
	inc	esi
	loop	for
	
;;; print
	mov	ecx, edi
	call	_printString
	call	_println
;;; exit
	mov     ebx, 0
    	mov     eax, 1
    	int     0x80
