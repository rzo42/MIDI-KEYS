; ========================================
; Project   : MIDI KEYS (registers)
; Target    : Commodore VIC 20
; Comments  : must be in ram
; Author    : Ryan Liston
; ========================================


;REGISTERS

midi_reg$   byte  0   ;midi channel

oct_reg$    byte  0   ;octave index

tran_reg$   byte  0   ;transpose value
                        
vel_reg$    byte  0   ;note velocity value
            
ret_reg$    byte  0   ;retrigger switch

arp_reg$    byte  0   ;arp length

arp_time$   byte  0   ;arp speed

arp_string$ byte  0,0,0,0,0,0,0,0 ;arp step sequencer

cur_note$       ;current note 
            byte  0
prv_note$       ;previous note
            byte  0
off_reg$        ;note off check switch
            byte  128
arp_count$          ;arp counter
            byte  0
            

;===============================================================================
