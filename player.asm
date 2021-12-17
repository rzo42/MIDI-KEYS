; ========================================
; Project   : MIDI KEYS
; Target    : Commodore VIC 20
; Comments  : note calculator and player routines
; Author    : Ryan Liston
; ========================================




;a contains base note

;CLACULATE NOTE

player$
            clc
            adc   tran_reg$   ;add transpose value
            sta   cur_note$   ;store as current note
            ldx   oct_reg$    ;load x with octave register
            lda   oct_inc$,x  ;load a with octave value
            clc
            adc   cur_note$   ;add octave value to current note value
            sta   cur_note$   ;store as current note value
            
arp_con$    ldx   arp_count$   ;load x w/ arp counter
            lda   arp_string$,x ;load a with arp octave increment
            tax                 ;tranfer to x
            lda   oct_inc$,x    ;load a with arp oct value
            clc
            adc   cur_note$     ;add to current note
            sta   cur_note$     ;store as current note    

;ARP TIMER AND COUNTER

            jsr   _rdtim$       ;check jiffy clock
            cmp   arp_time$     ;compare to arp speed
            bcc   retrigger$    ;if < then jump to retrigger
            lda   #0            ;else...
            tax
            tay                 ;..if >=
            jsr   _setim$       ;reset jiffy clock
            lda   arp_reg$      ;load a with arp length 
            cmp   arp_count$    ;compare to arp counter
            bne   a_count$      ; if != jump to a_count$
            lda   #0            ; else if = 
            sta   arp_count$    ; reset arp counter
            jmp   retrigger$     ;jump to retrigger
            
a_count$
            inc   arp_count$    ;increment arp counter

;RETRIGGER
retrigger$    
            lda   ret_reg$      ;check retrigger switch
            beq   ret_con$      ;if 0 then jump to ret_con$
            lda   cur_note$     ;compare current note
            cmp   prv_note$     ;with previous note 
            beq   ret_con$      ;if = then jump to ret_con$
            jsr   note_off$     ;if != then note off
       
            ldx   #255          ;retrigger
@looper     dex                 ;delay
            bne   @looper       ;loop

;PLAY NOTE
ret_con$
            sta   prv_note$     ;set current note to previous note
            ldx   cur_note$     ;load x w/ current note
            ldy   vel_reg$      ; load y with velocity
            jsr   NOTEON        ;play note
            jmp   loop_0$       ;return to control routine

;===============================================================================
        