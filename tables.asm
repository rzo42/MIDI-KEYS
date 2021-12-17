; ========================================
; Project   : MIDI KEYS (table)
; Target    : Commodore VIC 20
; Comments  : data tables
; Author    : Ryan Liston
; ========================================


;KEY BOARD INPUT TABLE

               ;    d#0 f#0 a#0 c#1     g#1 b_1 
key_tab$       ;"1" "3" "5" "7" "9" "+" pnd del 
        byte    128,003,006,010,013,128,020,023

               ;    d_0 f_0 a_0 c_1 e_1 g_1     
               ;a_l "w" "r" "y" "i" "p" "*",rtn
        byte    128,002,005,009,012,016,019,128     

               ;                            len     len=5
               ;ctr "a" "d" "g" "j" "l" ";" rgt  
        byte    128,128,128,128,128,128,128,134 

               ;        ar2 ar4 ar6 ar8 ret spd    ret=4
               ;r_s lsh "x" "v" "n" "," "/" dwn    spd=6
        byte    128,128,137,139,141,143,133,135
                                                ; chn=0
               ;    ar1 ar3 ar5 ar7         chn   ar1=7   ar2=8
               ;spc "z" "c" "b" "m" "." rsh _f1   ar3=9   ar4=10
        byte    128,136,138,140,142,128,128,129  ;ar5=11  ar6=12
                                                 ;ar7=13  ar8=14
               ;                            oct   oct=1
               ;_c= "s" "f" "h" "k" ":" "=" _f3
        byte    128,128,128,128,128,128,128,130

               ;c_0 e_0 g_0 b_0 d_1 f_1 a_1 trn   trn=2
               ;"q" "e" "t" "u" "o" "@" a_u _f5
        byte    000,004,007,011,014,017,021,131
      
               ;c#0     g#0     d#1 f#1 a#1 vel rest   vel=3
               ;"1" "4" "6" "8" "0" "-" hom _f7 null   rest=128
        byte    001,128,008,128,015,018,022,132,128
            
;oct2   12  13  14  15  16  17  18  19  20  21  22  23  
;0ct1   0   1   2   3   4   5   6   7   8   9   10  11  
;note   c   #   d   #   e   f   #   g   #   a   #   b

;-------------------------------------------------------------------------------

;OCTAVE TABLE

oct_inc$    byte  0,12,24,36,48,60,72,84,96,108,120
            
;-------------------------------------------------------------------------------

;MAX INPUT

;maximum input values for user interface

max_in$ ;         c  o  t  v  r l  s
            byte  15,6,11,127,1,7,99
            byte  3,3,3,3,3,3,3,3

