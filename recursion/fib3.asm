;;; -------------------------------------------------------
;;; hw10.asm
;;; Yining Hua
;;; a recursive function fib3( n ) that computes the modified "sum-of-previous-three" 
;;; fibonacci terms with fib1 = fib2 = fib3 = 1
;;; -------------------------------------------------------

        global fib3

fib3:
        push ebp        ;; save ebp
        mov ebp, esp    
        
        cmp dword[ebp+8], 3     ;; check if the n > 3
        jg recur

        mov dword[ebp+12], 1    ;; if not, return 1 for fib3_1 = fib3_2 = fib_3 = 1
        mov eax, dword[ebp+12]      
        pop ebp
        ret 4
        
recur: 
        
        ;; ======= store the 3 registers we will be using ======
        push ebx    
        push ecx
        push edx
        
        mov edx, dword[ebp+8]   ;; given n, calculate n_1 + n_2 + n_3
        dec edx     ;; n-1
        
        push eax    ;; store eax and edx for going to another layer of recursion.
        push edx    
        call fib3   ;; call fib3 to calculate fib3_(n-1)
        pop ecx     ;; return to ecx
        
        mov edx, dword[ebp+8]
        sub edx, 2  ;; n-2
        push eax
        push edx
        call fib3   ;; call fib3 to calculate fib3_(n-2)
        pop ebx     ;; return to ebx
        add ecx, ebx
        
        
        mov edx, dword[ebp+8]
        sub edx, 3  ;; n-3
        push eax
        push edx
        call fib3   ;; call fib3 to calculate fib3_(n-3)
        pop ebx
        add ecx, ebx
        
        mov dword[ebp+12], ecx
        mov eax, dword[ebp+12]
        
        pop edx
        pop ecx
        pop ebx
        
        pop ebp
        ret 4	 	  	 		    	    	  	    	   	 	
