; ========================================
; Project   : MIDI KEYS (user interface)
; Target    : Commodore VIC 20
; Author    : Ryan Liston
; ========================================


;delay loop for smooth input
screen_handle$
            pha
            lda   #0
            tay
            tax
            jsr   _setim$
@delay_loop 
            jsr   _rdtim$
            cmp   #7
            bcc   @delay_loop 
            pla
            sec
            sbc    #129      ;subtract 129 from key value
            tax              ;and tensfer to x for indexing

;add or subtract?
@shift_test
            lda   shift_key$ ;test shift key 
            cmp   last_shift$ ;test for stability
            bne   @shift_test ;if unstable then retest
            cmp   #0          ;if no shift key 
            bne   value_minus$;branch for subtraction

;add value
value_plus$ 
            lda   midi_reg$,x ;load current field value,x
            cmp   max_in$,x   ;compare to its max input
            bne   @plus_next  ;if != max then continue to addition
            jmp   loop_0$     ;else jmp back to keypress
@plus_next
            inc   midi_reg$,x ;add 1 to field value registor
            jmp   screen_val_print$ ;jump to print value to screen

;subtract value
value_minus$
            lda   midi_reg$,x  ;load current field value,x 
            cmp   #0           ;compare to 0
            bne   @minus_next  ;if != then continue to subtraction
            jmp   loop_0$      ;else jmp back to keypress
@minus_next
            dec   midi_reg$,x  ;subtract 1 from field register          
            
screen_val_print$
            
            ldy   #17          ;y = 17 ;x=x
            clc
            jsr   _plot$       ;place cursor
            lda   midi_reg$,x  ;load current note value         
            tax                ;trnsfer to x for lsb int val
            lda   #0           ;load a with 0 for msb int val
            jsr   _print_int$  ; print intger to screen
            lda   #<null_print$;clear trailling spaces
            ldy   #>null_print$
            jsr   _print_str$
            
            jmp   mc_set$      ;return to main controler    

;===============================================================================