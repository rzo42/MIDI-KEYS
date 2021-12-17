; ========================================
; Project   : MIDI KEYS (splash screen)
; Target    : Commodore VIC 20
; Comments  : prints the initial splash screen
; Author    : Ryan Liston
; ========================================



screen_setup$
            lda   #screen_color$          
            sta   bg_color$
            lda   #<splash_screen$
            ldy   #>splash_screen$
            jsr   _print_str$
            lda   #<splash_2$
            ldy   #>splash_2$
            jsr   _print_str$
            lda   #<splash_3$
            ldy   #>splash_3$
            jsr   _print_str$
            
            jsr   SETOUT  ;sets midi out
            jmp   mc_set$ ;jump to master controller

;-------------------------------------------------------------------------------

;SCREEN DATA
        
splash_screen$
     byte "{clear}   {green}midi chan  {yellow}f1 {cyan}0    "
     byte "   {green}octave     {yellow}f3 {cyan}0    "
     byte "   {green}transpose  {yellow}f5 {cyan}0    "
     byte "   {green}velocity   {yellow}f7 {cyan}0    "
     byte "   {green}retrigger   {yellow}/ {cyan}0    "
     byte "   {green}length      {yellow}{arrow left} {cyan}0    "
     byte "   {green}speed       {yellow}^ {cyan}0{null}"

splash_2$
     byte "       {green}step 0      {yellow}z {cyan}0    "
     byte "   {green}step 1      {yellow}x {cyan}0    "
     byte "   {green}step 2      {yellow}c {cyan}0    "
     byte "   {green}step 3      {yellow}v {cyan}0    "
     byte "   {green}step 4      {yellow}b {cyan}0    "
     byte "   {green}step 5      {yellow}n {cyan}0    "
     byte "   {green}step 6      {yellow}m {cyan}0    "
     byte "   {green}step 7      {yellow}, {cyan}0    {null}"

splash_3$
     byte "{down}c:{yellow}q  {cyan}#:{yellow}5  {cyan}c:{yellow}i  {cyan}#:{yellow}-    "
     byte "{cyan}#:{yellow}2  {cyan}g:{yellow}t  {cyan}#:{yellow}9  {cyan}g:{yellow}*    "
     byte "{cyan}d:{yellow}w  {cyan}#:{yellow}6  {cyan}d:{yellow}o  {cyan}#:{yellow}{pound}    "
     byte "{cyan}#:{yellow}3  {cyan}a:{yellow}y  {cyan}#:{yellow}0  {cyan}a:{yellow}^    "
     byte "{cyan}e:{yellow}e  {cyan}#:{yellow}7  {cyan}e:{yellow}p  {cyan}#:{yellow}home "
     byte "{cyan}f:{yellow}r  {cyan}b:{yellow}u  {cyan}f:{yellow}@  {cyan}b:{yellow}del"
     
null_print$
            byte  "  {cyan}{home}{null}" ;used also to clear trailing
                                         ;spaces after printing
                                         ;integers to screen
