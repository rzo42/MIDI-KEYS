# MIDI-KEYS

TITLE: MIDI KEYS
TARGET: VIC-20 (UNEXPANDED)
AURTHOR: RYAN LISTON
DATE: 12/23/2021
DESCRIPTION: VIC-20 MIDI OUT KEYBOARD CONTROLLER
REQUIREMENTS: USER PORT MIDI INTERFACE, EXTERNAL MIDI DEVICE


LOADING

        LOAD"MIDI KEYS",8,1
        RUN


SETTINGS


        setting         controls        range   description
                        +       -                
        Midi Channel    f1      f2      0-15    0-14=channel 1-15, 16=cv out
        
        Octave          f3      f4      0-6     sets base octave 
                                                (the arpeggiator can be used to
                                                set higher octaves)

        Transpose       f5      f6      0-11    sets the base note value 

        Retrigger       /     shift+/   0-1     0=off   1=0n


ARPEGIATOR

        setting         controls        range   description
                        +       -                
        Length          left  right     0-7     sets the step length of the arp
                                                when 0, step 0 is still added
                                                to the total note value 

        Speed           up    down      0-99    sets the length of the arp steps
                                                (timed off of the jiffy clock)

        step 0          z     shift+z   0-48    step 0 note increment
        step 1          x     shift+x   0-48    step 1 note increment
        step 2          c     shift+c   0-48    step 2 note increment
        step 3          v     shift+v   0-48    step 3 note increment
        step 4          b     shift+b   0-48    step 4 note increment
        step 5          n     shift+n   0-48    step 5 note increment
        step 6          m     shift+m   0-48    step 6 note increment
        step 7          ,     shift+,   0-48    step 7 note increment

        steps increment the note value in half steps (1=+1half step, 24=+2 oct)  
        total note value=octave*12+transpose+step(x)


KEYBOARD LAYOUT

Q      2      W      3      E      R      5      T      6      Y      7      U
I      9      O      0      P      @      -      *      pound  ^      home   del
