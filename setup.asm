; ========================================
; Project   : MIDI KEYS (variable declarations)
; Target    : Commodore VIC 20
; Author    : Ryan Liston
; ========================================


*=$1010


;MEMORY LOCATIONS

cur_key$    = $cb             ;current key pressed
last_key$   = $c5             ;last key pressed
shift_key$  = $28d            ;shift=%00000001, ctrl=%00000100, c==%00000010
last_shift$ = $28e            ;shift=%00000001, ctrl=%00000100, c==%00000010 
bg_color$   = 36879            

                       
;-------------------------------------------------------------------------------

;ROM CALLS            
            
_print_str$ = $cb1e            ;print string @ A/Y             (A=lsb,Y=msb)
_print_int$ = $ddcd            ;print integer in X,A           (A=lsb,X=msb)
            
;-------------------------------------------------------------------------------

;KERNAL CALSS

_plot$      = $fff0            ;plots screen coord. X=y,Y=x, clc=set, sec=read
_chrout$    = $ffd2            ;print ascii charachter in A
_rdtim$     = $ffde            ;returns jiffy in A/X/Y
_setim$     = $ffdb            ;sets jiffy to A/X/Y

;-------------------------------------------------------------------------------

;CONSTANTS

screen_color$ =8

            
;===============================================================================            