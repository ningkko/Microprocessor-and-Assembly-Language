;;; hw4.asm
;;; Ning
;;; 
;;; This program computes 4*(a^2 + b^2) + c with given a, b, and c.

                extern  _printDec
                extern  _printInt
                extern  _printString
                extern  _println
                extern  _getInput

        section .data
prompt          db      "> "
promptLen       equ     $-prompt
ansStr          db      "ans = "
ansStrLen       equ     $-ansStr

a               dd      0
b               dd      0
c               dd      0
ans             dd      0

                section .text
                global  _start
_start:
        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get a
                call    _getInput
                mov     dword[a], eax

        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get b
                call    _getInput
                mov     dword[b], eax

        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get c
                call    _getInput
                mov     dword[c], eax

        ;; -----------------------------------
        ;; computation: ans = 4*(a^2+b^2)+c
        ;; -----------------------------------

        ;;; put your code here, between the computation and display
        ;;; comments
                ;;; get a^2
                mov     eax, dword[a]
                mul     eax
                ;;; store in ans
                mov     dword[ans], eax
                
                ;;; get b^2
                mov     eax, dword[b]
                mul     eax
                ;;; store in ans
                add     dword[ans], eax
                
                ;;; add ans to itself 3 times to get 4*ans
                ;;; we cannot simply multiply ans by 4 because 4 is not 32 bit
                mov     eax, dword[ans]
                add     dword[ans], eax
                add     dword[ans], eax
                add     dword[ans], eax

                ;;; add c to ans
                mov     eax, dword[c]
                add     dword[ans], eax
        ;; -----------------------------------
        ;; display "ans = "
        ;; -----------------------------------
                mov     ecx, ansStr
                mov     edx, ansStrLen
                call    _printString

        ;; -----------------------------------
        ;; display ans variable
        ;; -----------------------------------
                mov     eax, dword[ans]
                call    _printInt
                call    _println
                call    _println

;;; exit
                mov     ebx, 0
                mov     eax, 1
                int     0x80	 	  	 		    	    	  	    	   	 	
