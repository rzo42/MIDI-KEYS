

        
splash_screen$
        byte    "{clear}{blue} octave  0      ^/{arrow left}   "
        byte    " midi ch 0      f1/f3 "
        byte    " not vel 0      f5/f7 ",0
        ;byte    " retrig  0      rtrn{home}",0

;key board input table

               ;    c#1 f#1 a#1 c#2     g#2 b_2 
key_tab$       ;"1" "3" "5" "7" "9" "+" pnd del 
        byte    128,013,018,022,027,128,034,037

               ;    d_1 f_1 a_1 c_2 e_2 g_2     retrigger x/o
               ;a_l "w" "r" "y" "i" "p" "*",rtn
        byte    128,014,017,021,024,028,019,128    ;135 

               ;        d#0 f#0 a#0         oct+
               ;ctr "a" "d" "g" "j" "l" ";" rgt
        byte    128,128,003,006,010,128,128,130 

               ;        d_0 f_0 a_0         oct-
               ;r_s lsh "x" "v" "n" "," "/" dwn 
        byte    128,128,002,005,009,128,128,129

               ;     c_0 e_0 g_0 b_0        mc+    
               ;spc "z" "c" "b" "m" "." rsh _f1
        byte    128,001,004,007,011,128,128,131

               ;    c#0     g#0             mc-
               ;_c= "s" "f" "h" "k" ":" "=" _f3
        byte    128,002,128,008,128,128,128,132

               ;c_1 d#1 g_1 b_1 d_2 f_2 a_2 nv+
               ;"q" "e" "t" "u" "o" "@" a_u _f5
        byte    012,015,019,023,026,029,035,133
      
               ;c#1     g#1     d#2 f#2 a#2 nv- rest
               ;"2" "4" "6" "8" "0" "-" hom _f7 {no keypress}
        byte    013,128,020,128,027,030,036,134,128
            
;oct3   24  25  26  27  28  29  30  31  34  35  36  37  
;oct2   12  13  14  15  16  17  18  19  20  21  22  23  
;0ct1   0   1   2   3   4   5   6   7   8   9   10  11  
;note   c   #   d   #   e   f   #   g   #   a   #   b

oct_inc$    byte  0,12,24,36,48,60,72,84,96,108
            
oct_reg$
            byte  0
            
midi_reg$
            byte  0
            
vel_reg$
            byte  0
            
ret_reg$
            byte  0
            
null_print$
            byte  "   {home}",0
            
oct_xy$     
            byte  0
            
midi_xy$     
            byte  1
            
vel_xy$     
            byte  2
            
ret_xy$     
            byte  3
            
cur_note$
            byte  0
_a$
            byte  0
_x$         
            byte  0
_y$
            byte  0