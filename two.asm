; C64
BGCOLOR       = $d020
BORDERCOLOR   = $d021
BASIC         = $0801
SCREENRAM     = $0400



* = BASIC

    !byte $0b, $08
    !byte $E3                     ; BASIC line number:  $E2=2018 $E3=2019 etc       
    !byte $07, $9E
    !byte '0' + Start % 10000 / 1000        
    !byte '0' + Start %  1000 /  100        
    !byte '0' + Start %   100 /   10        
    !byte '0' + Start %    10             
    !byte $00, $00, $00           ; end of basic


*=$0900 
SCRN_START=$0400


!macro ReverseScreenLocation .t {
    lda .t,x
    eor #$80           ; XOR the Accumulator with 128
    sta .t,x
}


Start
    ldx #0                            ; Initialise Offset
LOOP
    +ReverseScreenLocation SCRN_START
    +ReverseScreenLocation SCRN_START + $100
    +ReverseScreenLocation SCRN_START + $200
    +ReverseScreenLocation SCRN_START + $300

    inx
    bne LOOP
    rts
