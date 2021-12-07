;*******************************************************************************
;title: VIC MIDI KEYS
;author: RYAN LISTON
;DESCRIPTION: vic 20 midi keyboard
;*******************************************************************************
;===============================================================================
*=$1010

;DECLARATIONS

;...............................................................................

;MACROS

;-------------------------------------------------------------------------------

;CONSTANTS
            

;-------------------------------------------------------------------------------

;MEMORY LOCATIONS

index_1$    = $22             ;16 bit utility pointer #1        ($23,$24)
index_2$    = $24             ;16 bit utility pointer #2        ($25,$26)
fornam$     = $26             ;16 bit for to/variable pointer   {$27,$28}
tempf_3$    = $4e             ;temp float starage 3             ($4e-$52)
tempf_1$    = $57             ;temp float starage 1             ($57-$5b)
tempf_2$    = $5c             ;temp float starage 2             ($5c-$60)
fac_1$      = $61             ;flaoting point accumulator     ($61-$66)
fac_2$      = $69             ;alternat floating point accumulator    ($69-$6e)
cur_key$    = $cb             ;current key pressed
last_key$   = $c5             ;last key pressed
zp_1$       = $fc             ;free zero page space
zp_2$       = $fd             ;free zero page space
zp_3$       = $fe             ;free zero page space
zp_4$       = $ff             ;free zero page space
shift_key$  = $28d            ;shift=%00000001, ctrl=%00000100, c==%00000010
last_shift$  = $28e            ;shift=%00000001, ctrl=%00000100, c==%00000010 
            

                       
;-------------------------------------------------------------------------------

;ROM CALLS            
            
_print_str$ = $cb1e            ;print string @ A/Y             (A=lsb,Y=msb)
_print_int$ = $ddcd            ;print integer in X,A           (A=lsb,X=msb)
_print_fac$ = $ddd7            ;print fac_1$ as ascii string
_int_fac$   = $d391 ;conver integer in A/Y to float in fac_1$   (A=lsb,Y=msb)
_fac_int$   = $d1aa ;convert float in fac_1$ to integer in A/Y  (A=lsb,Y=msb)
            
;-------------------------------------------------------------------------------

;KERNAL CALSS

_plot$      = $fff0            ;plots screen coord. X=y,Y=x, clc=set, sec=read
_chrout$    = $ffd2            ;print ascii charachter in A
_rdtim$     = $ffde            ;returns jiffy in A/X/Y
_setim$     = $ffdb            ;sets jiffy to A/X/Y
            
            
;-------------------------------------------------------------------------------
;===============================================================================            