screen_setup$
            lda   #$00        
            sta   oct_reg$    
            sta   midi_reg$   
            sta   vel_reg$   
            sta   ret_reg$    
            lda   #<splash_screen$
            ldy   #>splash_screen$
            jsr   _print_str$
            jsr   SETOUT
mc_set$
            lda   midi_reg$
            jsr   SETCH       
            

loop_0$
            ldy   cur_key$    
            ldx   oct_reg$
            lda   key_tab$,y
            cmp   #128        
            bcs   set_in$     
            sta   zp_1$       
            lda   oct_inc$,x    
            clc
            adc   zp_1$
            tax
            ;cmp   cur_note$   
            ;beq   cont_note$         
            ;lda   ret_reg$    
            ;beq   cont_note$
            ;stx   _x$ 
            ;sty   _y$
            ;jsr   note_off$
            ;ldx   _x$         
            ;ldy   _y$
           
cont_note$
            stx   cur_note$
            ldy   vel_reg$    
            jsr   NOTEON      
                        ;ldx   cur_note$
                        ;lda   #0
                        ;jsr   _print_int$

loop_0_branch_1$
            jmp   loop_0$          

set_in$
            cmp   #128
            bne   oct_dwn$
note_off_$  
            jsr   note_off$
            
            jmp   loop_0$     
            
oct_dwn$    pha
            lda   #0
            tay
            tax
            jsr   _setim$
@delay_loop 
            jsr   _rdtim$
            cmp   #7
            bcc   @delay_loop 
            pla
            

            cmp   #129
            bne   oct_up$
            ldx   oct_xy$    
            ldy   #9  
            clc
            jsr   _plot$
            

            ldx   oct_reg$
            cpx   #0          
            beq   loop_0_branch_1$       
            dex       
            stx   oct_reg$    
            lda   #0          
            jsr   _print_int$ 
            jsr   n_print$
loop_0_branch_2$
            jmp   loop_0$          
            
oct_up$
            cmp   #130
            bne   mc_up$      
            ldx   oct_xy$    
            ldy   #9  
            clc
            jsr   _plot$
            
            ldx   oct_reg$
            cpx   #9          
            beq   loop_0_branch_2$       
            inx       
            stx   oct_reg$    
            lda   #0          
            jsr   _print_int$ 
            jsr   n_print$
loop_0_branch_3$
            jmp   loop_0$          

mc_up$    
            cmp   #131
            bne   mc_dwn$
            
            ldx   midi_xy$    
            ldy   #9  
            clc
            jsr   _plot$
            
            ldx   midi_reg$
            cpx   #15          
            beq   loop_0_branch_3$       
            inx       
            stx   midi_reg$    
            lda   #0          
            jsr   _print_int$ 
            jsr   n_print$
            jmp   mc_set$
loop_0_branch_4$
            jmp   loop_0$          
 
mc_dwn$    
            cmp   #132
            bne   vel_up$
            
            ldx   midi_xy$    
            ldy   #9  
            clc
            jsr   _plot$
            
            ldx   midi_reg$
            cpx   #0          
            beq   loop_0_branch_4$       
            dex       
            stx   midi_reg$    
            lda   #0          
            jsr   _print_int$ 
            jsr   n_print$
            jmp   mc_set$     
            
loop_0_branch_5$
            jmp   loop_0$          

vel_up$    
            cmp   #133
            bne   vel_dwn$
            
            ldx   vel_xy$    
            ldy   #9  
            clc
            jsr   _plot$
            
            ldx   vel_reg$
            cpx   #127          
            beq   loop_0_branch_5$       
            inx       
            stx   vel_reg$    
            lda   #0          
            jsr   _print_int$
            jsr   n_print$    
            
loop_0_branch_6$
            jmp   loop_0$          

vel_dwn$    
            cmp   #134
        ;    bne   ret_ox$
            bne   loop_0_branch_6$
            ldx   vel_xy$    
            ldy   #9  
            clc
            jsr   _plot$
            
            ldx   vel_reg$
            cpx   #0          
            beq   loop_0_branch_6$       
            dex       
            stx   vel_reg$    
            lda   #0          
            jsr   _print_int$ 
            jsr   n_print$    
            
loop_0_branch_7$
            jmp   loop_0$          

;ret_ox$    
;           cmp   #135
;            bne   loop_0_branch_7$        
;            ldx   ret_xy$    
;            ldy   #9  
;            clc
;            jsr   _plot$
;            lda   ret_reg$
;            eor   #%00000001          
;            tax
;            stx   ret_reg$    
;            lda   #0          
;            jsr   _print_int$ 
;            jsr   n_print$    
            
;loop_0_branch_8$
;            jmp   loop_0$          
          
n_print$    lda #<null_print$
            ldy   #>null_print$
            jsr   _print_str$ 
            rts
            
note_off$
            ldx   cur_note$
            ldy   vel_reg$;note off routine
            jsr   NOTEOFF     
            rts        
