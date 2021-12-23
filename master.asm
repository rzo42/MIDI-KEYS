; ========================================
; Project   : MIDI KEYS
; Target    : Commodore VIC 20
; Comments  : master control routine
; Author    : Ryan Liston
; ========================================



mc_set$
            lda   midi_reg$    ;set midi channel (0-15)
            jsr   SETCH       
loop_0$
            lda   cur_key$     ;get keypress
            cmp   last_key$    ;check for stability
            bne   loop_0$      ;loop if unstable
            tay                ;tranfer keypress to y for indexing
            lda   key_tab$,y   ;  key table to get key value 
            cmp   #128         ; if key value >= 128
            bcs   set_in$      ;branch to set in
            jmp   player$      ;else jump to note player
set_in$
            cmp   #128         ;if key value = 128
            beq   note_off_0$      ;branch to turn note off
            jmp   screen_handle$ ;else jump to screen handler
note_off_0$
            lda   #0              ;reset
            sta   arp_count$      ;arp counter
            jsr   _setim$         ;and timer
            lda   #128
            jsr   note_off$       ; jump to subroutine note_off$
            jmp   loop_0$         ;loop back for new keypress
            
;note off subroutine

note_off$  
            cmp   off_reg$        ;if a=off_reg$ 
            beq   off_pass$       ;branch to off$
trig_off$
            sta   off_reg$        ;else store new value in off_reg$
            ldx   prv_note$       ;load x with previous note
            ldy   #0              ;load y with 0
            jsr   NOTEOFF         ; turn note off
off_pass$   
            rts                   ;return to routine

;===============================================================================
