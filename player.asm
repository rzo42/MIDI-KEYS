; ========================================
; Project   : MIDI KEYS
; Target    : Commodore VIC 20
; Comments  : note calculator and player routines
; Author    : Ryan Liston
; ========================================



;CLACULATE NOTE (a contains base note)

player$
            clc
            adc   tran_reg$   ;add transpose value
            sta   cur_note$   ;store as current note
            ldx   oct_reg$    ;load x with octave register
            lda   oct_inc$,x  ;load a with octave value
            clc
            adc   cur_note$   ;add octave value to current note value
            sta   cur_note$   ;store as current note value
arp_con$    
            ldx   arp_count$   ;load x w/ arp counter
            lda   arp_string$,x ;load a with arp increment
            clc
            adc   cur_note$     ;add to current note
            sta   cur_note$     ;store as current note    

;ARP TIMER AND COUNTER

            jsr   _rdtim$       ;check jiffy clock
            cmp   arp_time$     ;compare to arp speed
            bcc   play_note$  ;if <= then jump to retrigger
            beq   play_note$
            lda   #0            ;else...
            tax
            tay                 ;..if >=
            jsr   _setim$       ;reset jiffy clock
            lda   arp_reg$      ;load a with arp length 
            cmp   arp_count$    ;compare to arp counter
            bne   a_count$      ; if != jump to a_count$
            lda   #0            ; else if = 
            sta   arp_count$    ; reset arp counter
            jmp   play_note$     ;jump to retrigger
a_count$
            inc   arp_count$    ;increment arp counter


;PLAY NOTE

play_note$    
            lda   cur_note$    ;if current note
            cmp   off_reg$    ;=off_reg$
            beq   on_pass$    ;bypass routine to continue the current note.
            pha               ;store current note in the stack
retrigger$
            lda   ret_reg$    ;if retrigger is on
            bne   ret_on$     ;branch to ret_on$
            pla               ;pull current note from the stack
            jmp   trigger$    ;else jump to note trigger
ret_on$
            pla
            pha
            jsr   trig_off$   ;jump to subroutine @ trig_off$  
            pla
            sta   prv_note$     ;set current note to previous note
trigger$
            tax
            ldy   vel_reg$      ; load y with velocity
            jsr   NOTEON        ;play note
            lda   ret_reg$      ;if retrigger is on 
            bne   on_pass$      ;jump to end of routine
ret_off$
            lda   cur_note$     ;load current note
            pha                 ;save to stack
            jsr   trig_off$     ;jump to subroutine @ trig_off$
            pla                 ;pull current note from the stack
            sta   prv_note$     ;store as previous note
on_pass$    
            jmp   loop_0$       ;return to control routine

;===============================================================================
        