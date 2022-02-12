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


incasm "const.asm"      ; Include constats definitions
incasm "mem_map.asm"    ; Include memory map tags definitions  

; ******************************************************************************
; Macro definitions
; ******************************************************************************
defm copySpritesVectors          
        ldx #sp_cant-1
@sp_vec_cp
        lda /1,x        ; read sprite vector
        sta /2,x        
        dex 
        bpl @sp_vec_cp
endm        

defm copySpritePosTable
        ldx #$10        ; there are 17 registers that define sprite position
@sp_pos_cp        
        lda /1,x        ; read sprite position
        sta /2,x
        dex 
        bpl @sp_pos_cp        
endm

defm copy1KMem
        ldx #$00
@next_byte
        lda /1,x
        sta /2,x
        lda /1+$0100,x
        sta /2+$0100,x
        lda /1+$0200,x
        sta /2+$0200,x
        lda /1+$0300,x
        sta /2+$0300,x
        inx 
        bne @next_byte
endm

defm waitForKey
@loop_wait_for_key
        jsr SCNKEY      ; check_keypress
        jsr GETIN       ; read keyboard buffer
        cmp #/1         ; key check
        bne @loop_wait_for_key
endm

; Global variables (pointer defined by constants)
flag_frame_arrived      = $C000
flag_enable_anim        = $C001
frame_counter           = $C002
current_level           = $C003
explosion_delay         = $C004
score                   = $C005
lives                   = $C006
flag_endgame            = $C007

;Program starts at $0810 == 2064
; 10 SYS 2064
*       = $0801
        BYTE $0E, $08, $0A, $00, $9E, $20, $28, $32, $30, $36, $34, $29, $00, $00, $00

*       = $0810

; ******************************************************************************
; MAIN
global_setup
        lda #1
        sta $0289               ; disable keyboard buffer
        lda #127
        sta $028a               ; disable key repeat 
        
        jsr setup_raster_IRQ    ; raster interrupt setup
        jsr show_intro          ; intro screen
        jsr music_player        ; music initialize rutine
     
        waitForKey $20          ; wait for space bar

        ; Wait for frame arrived signal to avoid screen flicker 
        lda #0
        sta flag_frame_arrived  
@wait_ri
        lda flag_frame_arrived
        bne @wait_ri

        jsr show_help_screen
        waitForKey $20  ; wait for space key

game_initialize
        jsr sc_setup
        jsr sp_setup

        jsr new_game
main_loop      
@frame_freq_events  
        ; Test events in a frame base (@60Hz/3)
        lda flag_frame_arrived
        beq @hi_freq_events
        lda #0
        sta flag_frame_arrived          ; reset frame flag
        jsr sp_calc                     ; sprite movements and animation calculation
        jsr check_cohetin_lost
        jsr check_cohetin_hit
        jsr check_explosion_end

@hi_freq_events
        ; Test events pulling at program cycle time (shoud be super fast)
        jsr check_fire_button
        
        lda explosion_delay        
        bne main_loop
        lda flag_endgame 
        beq main_loop          

        ; Game over!
        jsr show_end_game_screen
        waitForKey $20          ; wait for space bar
        jmp game_initialize
        
        jmp main_loop


; ******************************************************************************
; Raster interrupt setup
setup_raster_IRQ
        sei             ; disable interrupts

        lda #$7f        ; disable CIA timer interrupt
        sta $dc0d
        sta $dd0d

        ; Setup raster interrupt

        lda #$7F        ; clear high bit of raster line
        and $d011
        sta $d011

        lda #240        ; set raster interrupt to trigger on line 240
        sta $d012

        lda #<irq       ; set pointer for raster interrupt
        ldx #>irq
        sta $314
        stx $315
        
        lda #$01        ; enable raster interrupt
        sta $d01a
        sta $d019       ; ACK any raster IRQs
        
        cli             ; enable interrupts
        rts

; ******************************************************************************
; Show intro screen
show_intro
        copy1KMem intro_videom,$0400   ; copy video memory
        copy1KMem intro_colorm,$d800   ; copy color memory
        
        ; Enter bitmap mode
        lda #$3b
        sta $d011

        ; Set multicolor mode
        lda #$18
        sta $d016

        ; Define charset address
        lda #$1C
        sta $d018

        ; Set white background and border color 
        lda #white
        sta BGCOL0
        sta EXTCOL
        
        rts

; ******************************************************************************
; Screen setup
sc_setup
        ; Enter text mode
        lda #$1b
        sta $d011

        ; Set multicolor mode
        lda #%11011000
        sta $d016

        ; Define charset address at $2000 (VIC BANK 0) and video memory at $0400
        lda #%00011000
        sta $d018

        ; Set border color
        lda #blue
        sta EXTCOL

        ; Set lt green background 
        lda #ltgreen
        sta BGCOL0

        ; Set color for background 1 and 2 (multicolor)
        lda #ltblue
        sta BGCOL1
        lda #ltgray
        sta BGCOL2

        ; Copy screen data color and charset to active locations (defaults of C64)
        copy1KMem sc1_data,$0400
        copy1KMem sc1_color,$d800
        copy1KMem sc1_charset,$2000
        copy1KMem sc1_charset_hi,$2400

        ; Show fixed labels
        ldx #label1_len
@next_label1_char
        lda label1,x
        sta $07C0+label1_sc_offset,x
        lda #blue
        sta $DBC0+label1_sc_offset,x
        dex
        bpl @next_label1_char

        ldx #label2_len
@next_label2_char
        lda label2,x
        sta $07C0+label2_sc_offset,x
        lda #blue
        sta $DBC0+label2_sc_offset,x
        dex
        bpl @next_label2_char

        ldx #label3_len
@next_label3_char
        lda label3,x
        sta $07C0+label3_sc_offset,x
        lda #blue
        sta $DBC0+label3_sc_offset,x
        dex
        bpl @next_label3_char

        rts 

; ******************************************************************************
; Cohetin lost condition
decrement_lives
        dec lives
        bne @end_function
        lda #1
        sta flag_endgame
@end_function
        rts

; ******************************************************************************
; Cohetin lost condition
cohetin_lost
        lda sp_flag_move        ; deactivate movement of cohetin!
        and #%11111110
        sta sp_flag_move

        lda sp_pos_def+1        ; move cohetin to initial position
        sta sp_pos_buf+1
        
        lda sp_vector_def       ; reset animation frame of cohetin
        sta sp_vector_buf

        jsr decrement_lives
        jsr show_stats
        rts

; ******************************************************************************
; Check cohetin lost
check_cohetin_lost
        lda sp_pos_buf+1
        cmp #29
        bcs @end_function
        ; Cohetin lost
        jsr cohetin_lost
@end_function
        rts


; ******************************************************************************
; Check end condition to stop explosion animation and restart game
check_explosion_end
        lda explosion_delay
        beq @end_function       ; no explosion is being showed ... there is nothing to do then

        lda explosion_delay
        sta EXTCOL
@calc_delay
        dec explosion_delay
        bne @end_function       ; test if it is the last frame for the explosion animation

        lda #blue
        sta EXTCOL
        
        jsr level_setup
        jsr show_stats
@end_function
        rts

; ******************************************************************************
; Update score or live counter according to hit
update_hit_stats
@camioneta_hit
        lda sp_mask
        and #%00000010
        beq @collateral_hit
        jsr score_update        
@collateral_hit        
        lda sp_mask
        and #%00011100
        beq @end_function
        jsr decrement_lives
@end_function
        rts

; ******************************************************************************
; Cohetin hit
cohetin_hit
        lda explosion_delay     ; if a explosion is in progress all work here is done
        bne @end_function

@animate_hit
        lda sp_mask
        eor #$FF
        sta sp_mask_neg
        and sp_flag_move        ; deactivate movement of colliding sprites
        ora #%00100000          ; and animate explosion
        sta sp_flag_move

        lda sp_flag_visible     
        and sp_mask_neg         ; hide cohetin and camioneta
        ora #%00100000          ; and show explosion
        sta sp_flag_visible
        
        lda sp_mask
        and #%11111110
        ror

        ; Get the collided sprite index
        ldx #0                
@calc_sp_idx_colision 
        inx
        inx
        ror
        bcc @calc_sp_idx_colision

        ; move explosion sprite over collided sprite
        lda sp_pos_buf,x 
        sta sp_pos_buf+10
        lda sp_pos_def,x        ; restore collided sprite X position
        sta sp_pos_buf,x
        inx
        lda sp_pos_buf,x 
        sta sp_pos_buf+11
        lda sp_pos_def,x        ; restore collided sprite Y position
        sta sp_pos_buf,x

        ; restore cohetin initial position
        lda sp_pos_def        
        sta sp_pos_buf
        lda sp_pos_def+1        
        sta sp_pos_buf+1
        
        ; restore cohetin frame
        lda sp_vector_def
        sta sp_vector_buf

@update_stats
        jsr update_hit_stats       
@setup_timer
        ; setup waitime for 60 frames (that comes at 60/3Hz) = 3seconds before restart
        lda #60
        sta explosion_delay
@end_function
        rts

; ******************************************************************************
; Check cohetin hit
check_cohetin_hit
        lda SPSPCL
        sta sp_mask
        and #%00000001
        beq @end_function
        jsr cohetin_hit
@end_function        
        rts

; ******************************************************************************
; Show stats on the screen
show_stats
        ; Set foreground color for score and level
        lda #blue
        sta $DBC0+label1_sc_end
        sta $DBC0+label2_sc_end
        sta $DBC0+label3_sc_end

        ; Print score on screen
        clc
        cld
        lda score
        adc #48 
        sta $07C0+label1_sc_end

        ; Print level on screen
        lda current_level
        adc #48
        sta $07C0+label2_sc_end

        ; Print lives on screen
        lda lives
        adc #48
        sta $07C0+label3_sc_end
        rts


; ******************************************************************************
; Update score and level
score_update
        inc score
        
@test_level1             
        lda score
        cmp #3
        bne @test_level2
        inc current_level
@test_level2
        lda score
        cmp #6
        bne @test_level3
        inc current_level
@test_level3
        lda score
        cmp #9
        bne @test_level4
        inc current_level
@test_level4
        lda score
        cmp #12
        bne @end_function
        inc current_level
       
@end_function
        rts

; ******************************************************************************
; Check joystick 2 button
check_fire_button
        lda CIAPRA
        and #$10
        bne @end_function

        lda sp_flag_move        ; activate movement of cohetin!
        ora #%00000001
        sta sp_flag_move
@end_function
        rts


; ******************************************************************************
; Level setup
level_setup

@level1
        lda current_level
        cmp #1
        bne @level2
        lda #%00000010
        sta sp_flag_move
        lda #%00000011
        sta sp_flag_visible        
@level2
        lda current_level
        cmp #2
        bne @level3
        lda #%00001010
        sta sp_flag_move
        lda #%00001011
        sta sp_flag_visible        
@level3
        lda current_level
        cmp #3
        bne @level4
        lda #%00001110
        sta sp_flag_move
        lda #%00001111
        sta sp_flag_visible        
@level4
        lda current_level
        cmp #4
        bne @end_function
        lda #%00011110
        sta sp_flag_move
        lda #%00011111
        sta sp_flag_visible        
@end_function
        rts

; ******************************************************************************
; Triggers a new game
new_game       
        jsr game_restart
        jsr level_setup
        jsr show_stats
        rts

; ******************************************************************************
; Restore initial game conditions (global variables)
game_restart
        lda #0
        sta flag_endgame

        lda #0
        sta score

        lda #3
        sta lives

        lda #1
        sta current_level

        lda #0
        sta explosion_delay

        ; Set sprites initial position only if game is restarting from the begining
        copySpritePosTable sp_pos_def,sp_pos_buf

        ; Setup sprites vectors to initial values        
        copySpritesVectors sp_vector_def,sp_vector_buf

        rts

; ******************************************************************************
; Sprite setup
sp_setup
        ; Copy sprite definition to active sprite memory in bank 0
        copy1KMem sp_def,$2800
        copy1KMem sp_def_hi,$2C00

        ; Setup sprites vectors to initial values        
        copySpritesVectors sp_vector_def,sp_vector_buf

        ; Setup sprite initial position
        copySpritePosTable sp_pos_def,sp_pos_buf

        ; Setup sprite colors
        ldx #$0A
@sp_color_cp        
        lda sp_coldef,x ; sprite color
        sta SPMC0,x
        dex 
        bpl @sp_color_cp

        ; Set multicolor sprites
        lda #$FF
        sta SPMC

        ; Sprite Furret goes behid background
        lda #%00001000
        sta SPBGPR
        rts

; ******************************************************************************
; Copy the sprite tables modified in the main loop inside the irq handler
sp_animate
        copySpritesVectors sp_vector_buf,SPRITE0
        copySpritePosTable sp_pos_buf,SP0X
        jsr sp_show_visible
        rts

; ******************************************************************************
; Sprite enabler
sp_show_visible
        ; Enable sprites 
        lda sp_flag_visible
        sta SPENA
        rts

; ******************************************************************************
; Sprite animation and movements
sp_calc
        ldx #0
        ldy #0
        lda #%00000001
        sta sp_posMSX_mask

@sp_next
        lda sp_flag_move        ; check if current sprite is a movable object
        and sp_posMSX_mask
        beq @sp_calc_idx_next

        lda sp_pvel,x           ; reset speed counters
        sta sp_vel,x
        
        jsr sp_calc_frame       ; calc sprite frame vector 
        
@sp_anim_mov
        jsr sp_moveX            ; move sprites in X direction
        iny
        jsr sp_moveY            ; move sprites in X direction
        dey
        dec sp_vel,x              
        bne @sp_anim_mov
        
@sp_calc_idx_next               ; update index for the next sprite
        inx         
        iny
        iny
        asl sp_posMSX_mask
        bne @sp_next
@sp_anim_cont
        rts


; ******************************************************************************
; Calc frame sprite vector according to counters
sp_calc_frame
        dec sp_tscaler,x
        bne @sp_end_calc_frame
        lda sp_pscaler,x
        sta sp_tscaler,x
        inc sp_vector_buf,x
        lda sp_vector_buf,x
        cmp sp_vector_end,x
        bne @sp_end_calc_frame
        lda sp_vector_def,x
        sta sp_vector_buf,x
@sp_end_calc_frame
        rts

; ******************************************************************************
; Calc sprite X position 
sp_moveX
        lda sp_X_left_dir
        and sp_posMSX_mask
        beq @sp_move_right

@sp_move_left
        lda sp_pos_buf,y
        sta sp_aux_data

        inc sp_aux_data
        inc sp_aux_data

        lda sp_aux_data
        sta sp_pos_buf,y
        bne @sp_end_movX
        jsr sp_update_MSX
        jmp @sp_end_movX

@sp_move_right
        lda sp_X_right_dir
        and sp_posMSX_mask
        beq @sp_end_movX

        lda sp_pos_buf,y
        sta sp_aux_data

        dec sp_aux_data

        lda sp_aux_data
        sta sp_pos_buf,y
        cmp #$FF
        bne @sp_end_movX
        jsr sp_update_MSX
@sp_end_movX
        rts

; ******************************************************************************
; Calc sprite X position 
sp_moveY
        lda sp_Y_up_dir
        and sp_posMSX_mask
        beq @sp_end_movY
        
        lda sp_pos_buf,y
        sta sp_aux_data

        dec sp_aux_data

        lda sp_aux_data
        sta sp_pos_buf,y
@sp_end_movY
        rts

; ******************************************************************************
; Update most significant bit in X position
sp_update_MSX
        lda sp_posMSXbuf        
        and sp_posMSX_mask
        eor sp_posMSX_mask
        sta sp_aux_data
        lda sp_posMSX_mask
        eor #$FF
        and sp_posMSXbuf
        ora sp_aux_data
        sta sp_posMSXbuf
        rts

; ******************************************************************************
; Raster Interrupt Handler
irq
        lda #$01        ; ACK any irq
        sta $d019

        lda #$01
        sta flag_frame_arrived

        ; animate sprites
        jsr sp_animate

        ; play music
        jsr music_player+3      

        jmp $ea81       ; restore registers from stack

; ******************************************************************************
; Screen setup
show_end_game_screen
        ; Enter text mode
        lda #$1B
        sta $D011

        ; Disable multicolor mode
        lda #%11001000
        sta SCROLX

        ; Define default charset address 
        lda #$16
        sta VMCSB

        ; Define colors
        lda #black
        sta BGCOL0
        sta EXTCOL

        ; Disable Sprites
        lda #0
        sta sp_flag_visible        

        ; Clear screen
        jsr $E544
        
        ; Set cursor
        ldx #5
        ldy #0
        jsr $E50C

        ; Print string
        lda #<string10
        ldy #>string10
        jsr $AB1E
        lda #<string11
        ldy #>string11
        jsr $AB1E
        rts     

; ******************************************************************************
; Help screen
show_help_screen
        ; Enter text mode
        lda #$1B
        sta $D011

        ; Disable multicolor mode
        lda #%11001000
        sta SCROLX

        ; Define default charset address 
        lda #$16
        sta VMCSB

        ; Define colors
        lda #black
        sta BGCOL0
        sta EXTCOL

        ; Clear screen
        jsr $E544
        
        ; Set cursor
        ldx #5
        ldy #0
        jsr $E50C

        ; Print string
        lda #<string1
        ldy #>string1
        jsr $AB1E
        lda #<string2
        ldy #>string2
        jsr $AB1E

        lda #<string3
        ldy #>string3
        jsr $AB1E

        rts     

; ******************************************************************************
; Data and included variables
; ******************************************************************************

string1
        BYTE 5
        TEXT "               COHETINES!"
        BYTE 13        
        TEXT "      (C) 2022 POR PONCHO Y PABLIN"
        BYTE 13,13,0
             
string2       
        BYTE 154
        TEXT "IDEA ORIGINAL Y LATIGO: PONCHO"
        BYTE 13
        TEXT "PROGRAMACION: PABLIN"
        BYTE 13
        TEXT "MUSICA: POKEMONITOR BY OWEN CROWLEY"
        BYTE 13
        TEXT "PERSONAJES: NINTENDO Y CARTOON NETWORK"
        BYTE 13,13,0
string3
        BYTE 155
        TEXT "LO QUE DEBES HACER EN ESTE INCREIBLE"
        BYTE 13
        TEXT "JUEGO ES PEGARLE UN COHETAZO A LA"
        BYTE 13
        TEXT "CAMIONETA PORQUE LLEVA ANIMALES EN"
        BYTE 13
        TEXT "PELIGRO DE EXTICION... PERO DEBES EVITAR"        
        TEXT "LASTIMAR A OTROS INOCENTES"
        BYTE 13,13
        TEXT "PULSA ESPACIO PARA INICIAR Y SUERTE CON LA PUNTERIA!"
        BYTE 0
string10
        BYTE 155
        TEXT "        PERDISTE .... JURUJUJAJA"
        BYTE 13
        TEXT "       GRACIAS POR JUGAR COHETINES"
        ;     0123456789012345678901234567890123456789
        BYTE 13,13,13,13 
        BYTE 154       
        TEXT "CUIDADO CON LA PIROTECNIA"
        BYTE 13 
        TEXT "ABRAZA A TU ABUELITA"
        BYTE 13 
        TEXT "ACARICIA A TU GATITO ..."
        BYTE 0
string11
        BYTE 13,13
        TEXT "Y SOBRE TODO CUIDA A FURRET"
        BYTE 13 
        TEXT "TAMBIEN A PIKACHU Y A DARWIN"
        BYTE 13,13,13,13
        BYTE 28
        TEXT "PRESIONA ESPACIO PARA JUGAR DE NUEVO!"
        BYTE 0


; Screen labels
label1_sc_offset        = 0
label1_len              = 8
label1_sc_end           = label1_sc_offset+label1_len+1
label1        
        TEXT 'PUNTITOS:'
label2_sc_offset        = 17
label2_len              = 5
label2_sc_end           = label2_sc_offset+label2_len+1
label2        
        TEXT 'NIVEL:'
label3_sc_offset        = 29
label3_len              = 9
label3_sc_end           = label3_sc_offset+label3_len+1
label3
        TEXT 'COHETINES:'


; CAMBIAR DE LUGAR LA MUSICA!
* = $8000
music_player
; $8000 - $93ff
incbin  "Pokemonitor80.sid", $7E   ; Music code and data

* = $4400
intro_videom
incbin "intro_videomem.prg",2,0

* = $4800
intro_colorm
incbin "intro_colormem.prg",2,0

* = $2000
intro_bitmap
incbin "intro_bitmap.prg",2,0

; Screen 1 -  Screen data
* = $4C00
sc1_data
incasm "screen1.asm"
;incbin "screen1.bin"
sc1_color = sc1_data+$0400

; Screen1 charset
* = $5400
sc1_charset
incbin "screen_char_set.bin"
sc1_charset_hi = sc1_charset+$0400

; Sprite function and definitions
incasm "sprites.asm"
