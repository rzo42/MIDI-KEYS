; ========================================
; Project   : MIDI KEYS (registers)
; Target    : Commodore VIC 20
; Comments  : must be in ram
; Author    : Ryan Liston
; ========================================


;MIDI KEY REGISTERS

midi_reg$   byte  0   ;midi channel

oct_reg$    byte  0   ;octave index

tran_reg$   byte  0   ;transpose value
                        
vel_reg$    byte  0   ;note velocity value
            
ret_reg$    byte  0   ;retrigger switch

arp_reg$    byte  0   ;arp length

arp_time$   byte  0   ;arp speed

arp_string$ byte  0,0,0,0,0,0,0,0 ;arp step sequencer

;-------------------------------------------------------------------------------

;TEMP REGISTERS

cur_note$       ;current note 
            byte  0
prv_note$       ;previous note
            byte  0
_a$             ;temp a storage
            byte  0
_x$             ;temp x storage
            byte  0
_y$             ;temp a storage
            byte  0

;-------------------------------------------------------------------------------

            
;ARP STEP COUNTER            

arp_count$          ;arp counter
            byte  0
            
arp_compare$        ;previous arp value
            byte  0
            

;===============================================================================
