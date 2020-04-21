

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



;*************************************************
;* Variables
;*************************************************

SCREEN_Start_Location = $0400

VAR_BINARY = %01010101
VAR_HEX = $1F
VAR_OCTAL = &13
VAR_DECIMAL = 123

Start
    ldy #0
@Looper
    tya
    sta SCREEN_Start_Location,y
    iny
    bne @Looper
    rts




