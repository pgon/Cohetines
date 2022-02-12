; Cohetines!
; Yet another Commodore 64 game developed in 2022
;    Copyright (C) 2022  pgonzal@gmail.com
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <https://www.gnu.org/licenses/>.


; ******************************************************************************
; Sprite definitions
; ******************************************************************************
sp_def
; cohetin1 - Sprite 1
 BYTE $00,$20,$00
 BYTE $00,$20,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $02,$22,$00
 BYTE $02,$22,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; cohetin2 - Sprite 2
 BYTE $00,$20,$00
 BYTE $00,$20,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $02,$66,$00
 BYTE $02,$66,$00
 BYTE $00,$44,$00
 BYTE $01,$14,$00
 BYTE $01,$11,$00
 BYTE $00

; cohetin3 - Sprite 3
 BYTE $00,$20,$00
 BYTE $00,$20,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $02,$66,$00
 BYTE $02,$66,$00
 BYTE $01,$15,$00
 BYTE $00,$10,$40
 BYTE $04,$45,$00
 BYTE $00

; cohetin4 - Sprite 4
 BYTE $00,$20,$00
 BYTE $00,$20,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $00,$FC,$00
 BYTE $00,$FC,$00
 BYTE $00,$A8,$00
 BYTE $00,$A8,$00
 BYTE $02,$66,$00
 BYTE $02,$66,$00
 BYTE $01,$45,$00
 BYTE $04,$51,$00
 BYTE $00,$44,$40
 BYTE $00

; camion1 - Sprite 5
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F5,$40
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $55,$55,$54
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $2A,$00,$2A
 BYTE $2A,$00,$2A
 BYTE $08,$00,$08
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; camion2 - Sprite 6
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F5,$40
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $55,$55,$54
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $2B,$00,$2B
 BYTE $2A,$00,$2A
 BYTE $08,$00,$08
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; camion3 - Sprite 7
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F5,$40
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $55,$55,$54
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $2A,$00,$2A
 BYTE $2A,$00,$2A
 BYTE $0C,$00,$0C
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; camion4 - Sprite 8
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F0,$00
 BYTE $FF,$F5,$40
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $FF,$F4,$10
 BYTE $55,$55,$54
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $55,$55,$55
 BYTE $2A,$00,$2A
 BYTE $3A,$00,$3A
 BYTE $08,$00,$08
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; pikachu1 - Sprite 9
 BYTE $80,$08,$0A
 BYTE $AA,$A8,$2A
 BYTE $BA,$E8,$2A
 BYTE $9E,$78,$08
 BYTE $9E,$78,$08
 BYTE $6A,$A4,$20
 BYTE $A5,$68,$20
 BYTE $A5,$68,$20
 BYTE $A9,$A0,$08
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $28,$00,$28
 BYTE $2A,$00,$2A
 BYTE $0A,$80,$0A
 BYTE $02,$80,$02
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; pikachu2 - Sprite 10
 BYTE $80,$08,$0A
 BYTE $AA,$A8,$2A
 BYTE $BA,$E8,$2A
 BYTE $9E,$78,$0A
 BYTE $9E,$78,$0A
 BYTE $6A,$A4,$0A
 BYTE $A5,$68,$08
 BYTE $A5,$68,$08
 BYTE $A9,$A0,$08
 BYTE $29,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $0A,$00,$28
 BYTE $0A,$00,$2A
 BYTE $28,$00,$0A
 BYTE $28,$00,$02
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; pikachu3 - Sprite 11
 BYTE $80,$08,$0A
 BYTE $AA,$A8,$0A
 BYTE $BA,$E8,$0A
 BYTE $9E,$78,$08
 BYTE $9E,$78,$08
 BYTE $6A,$A4,$02
 BYTE $A5,$68,$02
 BYTE $A9,$A8,$02
 BYTE $AA,$A0,$08
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $0A,$00,$28
 BYTE $0A,$00,$A0
 BYTE $28,$00,$A0
 BYTE $28,$00,$A0
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; pikachu4 - Sprite 12
 BYTE $80,$08,$0A
 BYTE $AA,$A8,$2A
 BYTE $BA,$E8,$2A
 BYTE $9E,$78,$08
 BYTE $9E,$78,$08
 BYTE $6A,$A4,$20
 BYTE $A5,$68,$20
 BYTE $A5,$68,$20
 BYTE $A9,$A0,$08
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $2A,$AA,$A8
 BYTE $0A,$00,$28
 BYTE $0A,$00,$A0
 BYTE $0A,$80,$A0
 BYTE $02,$80,$A0
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; furret1 - Sprite 13
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $C0,$80,$00
 BYTE $C0,$C0,$00
 BYTE $FF,$C0,$00
 BYTE $EA,$C0,$2E
 BYTE $88,$8E,$EE
 BYTE $AA,$BE,$EE
 BYTE $A6,$AE,$EE
 BYTE $2A,$AE,$EC
 BYTE $2A,$AE,$C0
 BYTE $08,$20,$80
 BYTE $08,$20,$80
 BYTE $0C,$30,$C0
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; furret2 - Sprite 14
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $C0,$80,$00
 BYTE $C0,$C0,$00
 BYTE $FF,$C0,$00
 BYTE $EA,$C0,$00
 BYTE $88,$80,$00
 BYTE $AA,$8E,$2E
 BYTE $A6,$BE,$EE
 BYTE $26,$AE,$EE
 BYTE $2A,$AE,$EE
 BYTE $2A,$AE,$EC
 BYTE $08,$20,$80
 BYTE $20,$22,$00
 BYTE $30,$33,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; furret3 - Sprite 15
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $C0,$80,$00
 BYTE $C0,$C0,$00
 BYTE $FF,$C0,$00
 BYTE $EA,$C0,$2E
 BYTE $88,$8E,$EE
 BYTE $AA,$BE,$EE
 BYTE $A6,$AE,$EE
 BYTE $2A,$AE,$EC
 BYTE $2A,$AE,$C0
 BYTE $08,$20,$80
 BYTE $20,$0A,$00
 BYTE $30,$0F,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; furret4 - Sprite 16
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $C0,$80,$00
 BYTE $C0,$C0,$2E
 BYTE $FF,$C0,$2E
 BYTE $C8,$CE,$EE
 BYTE $AA,$BE,$EE
 BYTE $AE,$AE,$EC
 BYTE $AA,$AE,$C0
 BYTE $AA,$AE,$C0
 BYTE $28,$20,$80
 BYTE $02,$08,$80
 BYTE $03,$0C,$30
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; darwin1 - Sprite 17
 BYTE $00,$2A,$A0
 BYTE $00,$AA,$A0
 BYTE $00,$AF,$BC
 BYTE $02,$AD,$B4
 BYTE $02,$AD,$B4
 BYTE $0A,$AA,$AA
 BYTE $0A,$AA,$AA
 BYTE $2A,$AA,$AA
 BYTE $2A,$A9,$A6
 BYTE $AA,$A9,$56
 BYTE $AA,$AA,$5A
 BYTE $2A,$AA,$A8
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$3C,$F0
 BYTE $00,$3C,$F0
 BYTE $00,$3C,$F0
 BYTE $00,$14,$50
 BYTE $00,$15,$54
 BYTE $00,$15,$54
 BYTE $00

; darwin2 - Sprite 18
 BYTE $00,$2A,$A0
 BYTE $00,$AA,$A0
 BYTE $00,$AF,$BC
 BYTE $02,$AD,$B4
 BYTE $02,$AD,$B4
 BYTE $0A,$AA,$AA
 BYTE $2A,$AA,$AA
 BYTE $AA,$A9,$A6
 BYTE $AA,$A9,$56
 BYTE $AA,$A9,$56
 BYTE $2A,$AA,$5A
 BYTE $2A,$AA,$A8
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$3C,$3C
 BYTE $00,$3C,$3C
 BYTE $00,$3C,$3C
 BYTE $00,$14,$14
 BYTE $00,$15,$15
 BYTE $00,$15,$15
 BYTE $00

; darwin3 - Sprite 19
 BYTE $00,$2A,$A0
 BYTE $00,$AF,$BC
 BYTE $00,$AF,$BC
 BYTE $02,$AD,$B4
 BYTE $0A,$AD,$B6
 BYTE $0A,$AA,$AA
 BYTE $2A,$A9,$A6
 BYTE $AA,$A9,$56
 BYTE $AA,$A9,$56
 BYTE $AA,$AA,$5A
 BYTE $2A,$AA,$A8
 BYTE $0A,$AA,$A8
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$F0,$3C
 BYTE $00,$F0,$3C
 BYTE $00,$F0,$3C
 BYTE $00,$50,$14
 BYTE $00,$54,$15
 BYTE $00,$54,$15
 BYTE $00

; darwin4 - Sprite 20
 BYTE $00,$2A,$A0
 BYTE $00,$AF,$BC
 BYTE $00,$AF,$BC
 BYTE $02,$AD,$B4
 BYTE $02,$AD,$B4
 BYTE $0A,$AA,$AA
 BYTE $0A,$AA,$AA
 BYTE $2A,$AA,$AA
 BYTE $2A,$A9,$A6
 BYTE $AA,$A9,$56
 BYTE $AA,$AA,$5A
 BYTE $2A,$AA,$A8
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$28,$A0
 BYTE $00,$F0,$F0
 BYTE $00,$F0,$F0
 BYTE $00,$F0,$F0
 BYTE $00,$50,$50
 BYTE $00,$54,$54
 BYTE $00,$54,$54
 BYTE $00

; fuego1 - Sprite 21
 BYTE $00,$00,$00
 BYTE $00,$0A,$00
 BYTE $00,$20,$00
 BYTE $00,$15,$20
 BYTE $04,$11,$60
 BYTE $04,$82,$40
 BYTE $14,$68,$40
 BYTE $25,$59,$00
 BYTE $25,$00,$54
 BYTE $26,$08,$14
 BYTE $24,$48,$54
 BYTE $08,$52,$44
 BYTE $20,$A0,$40
 BYTE $06,$4A,$48
 BYTE $06,$51,$40
 BYTE $09,$80,$40
 BYTE $05,$81,$60
 BYTE $05,$05,$40
 BYTE $00,$06,$80
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; fuego2 - Sprite 22
 BYTE $02,$80,$00
 BYTE $00,$20,$00
 BYTE $21,$50,$00
 BYTE $25,$10,$40
 BYTE $06,$09,$40
 BYTE $04,$A4,$50
 BYTE $01,$95,$50
 BYTE $54,$01,$54
 BYTE $50,$82,$64
 BYTE $54,$84,$64
 BYTE $46,$14,$84
 BYTE $04,$28,$20
 BYTE $86,$86,$40
 BYTE $05,$16,$54
 BYTE $04,$09,$94
 BYTE $25,$09,$40
 BYTE $05,$51,$40
 BYTE $0A,$40,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; fuego3 - Sprite 23
 BYTE $02,$80,$40
 BYTE $00,$50,$10
 BYTE $21,$90,$00
 BYTE $25,$A2,$A1
 BYTE $26,$09,$40
 BYTE $55,$A4,$54
 BYTE $02,$95,$A4
 BYTE $5A,$01,$64
 BYTE $58,$42,$54
 BYTE $68,$44,$68
 BYTE $49,$14,$98
 BYTE $09,$28,$20
 BYTE $4A,$85,$60
 BYTE $56,$16,$64
 BYTE $16,$9A,$54
 BYTE $29,$A9,$40
 BYTE $05,$52,$40
 BYTE $06,$40,$18
 BYTE $14,$11,$00
 BYTE $00,$01,$40
 BYTE $00,$04,$00
 BYTE $00

; fuego4 - Sprite 24
 BYTE $02,$80,$00
 BYTE $04,$20,$14
 BYTE $25,$50,$04
 BYTE $25,$1A,$80
 BYTE $85,$4A,$40
 BYTE $84,$94,$50
 BYTE $91,$A5,$52
 BYTE $56,$12,$56
 BYTE $68,$9A,$64
 BYTE $58,$88,$64
 BYTE $86,$18,$94
 BYTE $84,$28,$10
 BYTE $66,$86,$50
 BYTE $65,$16,$54
 BYTE $25,$09,$A4
 BYTE $25,$09,$50
 BYTE $15,$55,$A4
 BYTE $5A,$46,$A0
 BYTE $4A,$01,$40
 BYTE $14,$05,$40
 BYTE $00,$00,$00
 BYTE $00

; cohetin_explota1 - Sprite 25
 BYTE $00,$20,$01
 BYTE $5C,$10,$00
 BYTE $1D,$99,$64
 BYTE $44,$54,$00
 BYTE $01,$65,$0C
 BYTE $10,$A9,$14
 BYTE $05,$E8,$00
 BYTE $97,$D4,$70
 BYTE $95,$E9,$70
 BYTE $83,$69,$90
 BYTE $15,$55,$50
 BYTE $2B,$A8,$F0
 BYTE $14,$55,$5C
 BYTE $1D,$75,$60
 BYTE $51,$9D,$00
 BYTE $84,$98,$F0
 BYTE $06,$26,$40
 BYTE $41,$65,$00
 BYTE $04,$00,$15
 BYTE $10,$00,$01
 BYTE $10,$00,$00
 BYTE $00

; cohetin_explota2 - Sprite 26
 BYTE $00,$04,$00
 BYTE $14,$00,$40
 BYTE $04,$59,$40
 BYTE $01,$FD,$00
 BYTE $55,$A9,$04
 BYTE $54,$56,$84
 BYTE $0A,$EB,$04
 BYTE $02,$BF,$50
 BYTE $0A,$5F,$51
 BYTE $C8,$55,$20
 BYTE $C4,$59,$58
 BYTE $E1,$A4,$C0
 BYTE $60,$D4,$C1
 BYTE $07,$D7,$C5
 BYTE $0B,$E7,$04
 BYTE $38,$AB,$D0
 BYTE $3B,$7E,$60
 BYTE $11,$36,$A0
 BYTE $01,$68,$40
 BYTE $05,$10,$40
 BYTE $04,$00,$04
 BYTE $00

;  - Sprite 27
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

;  - Sprite 28
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; camion_explota1 - Sprite 29
 BYTE $00,$00,$00
 BYTE $15,$00,$00
 BYTE $10,$55,$00
 BYTE $D7,$D1,$00
 BYTE $DF,$F0,$10
 BYTE $F5,$55,$40
 BYTE $77,$D4,$10
 BYTE $7D,$55,$10
 BYTE $77,$F5,$10
 BYTE $55,$75,$74
 BYTE $55,$7D,$75
 BYTE $75,$55,$55
 BYTE $57,$F5,$D5
 BYTE $1A,$34,$2A
 BYTE $65,$14,$1A
 BYTE $44,$01,$08
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

; camion_explota2 - Sprite 30
 BYTE $10,$00,$00
 BYTE $11,$10,$00
 BYTE $41,$41,$00
 BYTE $F7,$D5,$44
 BYTE $C4,$D3,$04
 BYTE $FF,$C7,$C0
 BYTE $CF,$F5,$14
 BYTE $7D,$F7,$10
 BYTE $7D,$F4,$10
 BYTE $50,$55,$54
 BYTE $55,$45,$D5
 BYTE $1D,$55,$DD
 BYTE $D5,$51,$5D
 BYTE $FA,$00,$2A
 BYTE $67,$D4,$5A
 BYTE $08,$15,$14
 BYTE $10,$00,$00
 BYTE $10,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

;  - Sprite 31
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

;  - Sprite 32
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00,$00,$00
 BYTE $00

sp_def_hi = sp_def + $0400

; ******************************************************************************
; Sprite initial parameters and auxiliary data
; ******************************************************************************
; Number of defined sprites
sp_cant = 8

; Sprites colors
sp_coldef
        BYTE red,ltgray                                     ; Extra colors 1-2
        BYTE blue,black,yellow,dkgray,orange,yellow,yellow,yellow   ; Sprite 0 to 7 foreground colors 

; Initial sprites positions
sp_pos_def
        BYTE 180,220    ; cohetin
        BYTE 24,80      ; camion
        BYTE 110,95    ; pikachu
        BYTE 64,135     ; furret
        BYTE 0,160     ; darwin
        BYTE 124,185
        BYTE 124,185
        BYTE 124,185
        BYTE %00001100

; Sprites position buffer used for animation
sp_pos_buf
        BYTE 180,229    ; cohetin
        BYTE 24,80      ; camion
        BYTE 64,90     ; pikachu
        BYTE 64,135     ; furret
        BYTE 24,160     ; darwin
        BYTE 124,185    ; explosion
        BYTE 124,185
        BYTE 124,185
sp_posMSXbuf
        BYTE %00001100

sp_posMSX_mask
        BYTE 1

sp_X_left_dir
        BYTE %00010010
sp_X_right_dir
        BYTE %00001100
sp_Y_up_dir
        BYTE %00000001

sp_flag_move
        BYTE %00000011

sp_flag_visible
        BYTE %00000000

; Sprite definition vector
sp_vector_def
        BYTE $A0,$A4,$A8,$AC,$B0,$B4,$B8,$BC
; Sprite vector buffer used for animation
sp_vector_buf
        BYTE $A0,$A4,$A8,$AC,$B0,$B4,$B8,$BC
sp_vector_end
        BYTE $A4,$A8,$AC,$B0,$B4,$B8,$BC,$C0

sp_tscaler
        BYTE 1,1,1,1,1,1,1,1
sp_pscaler
        BYTE $2,6,$2,$2,$2,$2,$2,$2
sp_vel
        BYTE 1,1,1,1,1,1,1,1        
sp_pvel
        BYTE 2,1,2,1,1,1,1,1
 
sp_aux_data  
        BYTE 0
sp_mask
        BYTE 0
sp_mask_neg
        BYTE $FF