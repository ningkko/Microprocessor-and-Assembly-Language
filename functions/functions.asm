;;; ------------------------------------------------------
;;; hw9a.asm
;;; Yining Hua
;;; This program is a library of functions.
;;; 
;;; Function 1 receives the address of a string s in the stack, 
;;; as well as its length, and converts the string to uppercase, 
;;; replacing all the alphabetic characters in the string to 
;;; uppercase.
;;;
;;; function 2 receives 3 integer parameters in the stack and computes 
;;; *(a + b) + 3*c and returns the result in eax.
;;;
;;; function 3 function receives the address of an array of ints in the 
;;; stack, as well as the number of ints in the array. It returns in eax 
;;; the number of negative ints in the array. It does not modify any of 
;;; the other registers besides eax.
;;;
;;; function 4 receives three unsigned ints in the stack, and returns the 
;;; smallest of the three in eax. It does not modify any  of the other 
;;; registers besides eax
;;; ------------------------------------------------------

        global  f1, f2, f3, f4

f1:
        push    ebp
        mov     ebp, esp
        mov     ecx, dword[ebp+8] ;; s1Len
        mov     esi, dword[ebp+12];; s1
        cmp     ecx, 0            ;; if length == 0 
        je      end0              ;; jump to the empty string case        
                
for1:   cmp     byte[esi], 97   ;; ascii codes >97 and <122 represent lowercased characters
        jge     greaterThan97   ;; if byte[esi]>97, jump to greaterThan97                                            
        jmp     end             ;; otherwise it is not lowercased, jump to end 

greaterThan97:    
        cmp     byte[esi], 122  ;; compare with 122 to see if it is lowercased
        jle     lessThan122     ;; if byte[esi]<122, meaning the 97<byte<122, byte is a lower-case character, go to is                                                                                              
        jmp     end

lessThan122:     
        add     byte[esi], 'A'-'a' ;; convert from lowercase to uppercase                       
        jmp     end                                       

end0:  
        pop     ebp         ;; just end
        ret     8
        
end:    inc     esi
        loop    for1        ;;  go on loop
        pop     ebp
        ret     8
        
;;============================================================================

f2:
        push    ebp
        mov     ebp, esp

        mov     ecx, dword[ebp+8]  ;; c
        mov     ebx, dword[ebp+12] ;; b
        mov     eax, dword[ebp+16] ;; a

        add     eax, ebx        ; eax <- a + b                                                            
        add     eax, eax        ; eax <- 2(a+b)
        add     eax, eax        ; eax <- 4(a+b)
        add     eax, ecx        ; eax <- 4(a+b)+c                                                         
        add     eax, ecx        ; eax <- 4(a+b)+2c                                                        
        add     eax, ecx        ; eax <- 4(a+b)+3c                                                             
        
        pop     ebp
        ret     12

;;============================================================================

f3:     
        ;;; store all the registers that are going to be used.
        push    ebp
        mov     ebp, esp      
        push    ecx
        push    esi
        push    ebx

        mov     ecx, dword[ebp+8]  ;; ecx <- arrayLen                                                       
        mov     esi, dword[ebp+12] ;; eax <- array                                                
        mov     eax, 0             ;; counts for the number of neg ints
        
        cmp     ecx, 0             ;; test if empty array
        je      end3_0

for3:   
        mov     ebx, dword[esi] ;; ebx <- int                                                          
        cmp     ebx, 0          ;; compare the int with 0 to see if it is negative                                    
        jl      isNeg           ;; if int<0, goto isNeg condition                                               
        jmp     end3            ;; if int>0, jump to done                                    

isNeg:  
        inc     eax             ;; increase #negtive ints
        jmp     end3            ;; jump to end                                                            

end3_0:
        ;;; reset values
        pop     ebx
        pop     esi
        pop     ecx

        pop     ebp
        ret     8
        
end3:   add     esi,4           ;; loop
        loop    for3
        
        ;;; reset values
        pop     ebx
        pop     esi
        pop     ecx

        pop     ebp
        ret     8

;;============================================================================

f4:	push    ebp
	mov     ebp, esp

;; if a <= b && a <= c : return a
	
	mov	eax, dword[ebp+8+4+4] 	; eax<-a
	cmp	eax, dword[ebp+8+4] 	; a <= b?
	ja	.test2
	cmp	eax, dword[ebp+8]   	; a <= c?
	ja	.test2
	jmp	.done
