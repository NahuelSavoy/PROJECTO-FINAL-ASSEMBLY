;--------------------------------------------------------------------------
;--------------------------------------------------------------------------                                                                      
;--------------------------------------------------------------------------                    
;-----------------------------Dino de Google-------------------------------                                            
;-------------------------------------------------------------------------- 
;-------------------------------------------------------------------------- 
;--------------------------------------------------------------------------

;Nahuel Savoy
;Joaquin Duhau
;Nicolas Vecchiarelli
;2025 2C TPI

;Objetivos iniciales:
;1.Menu inicial
;2.Mostrar por pantalla obstaculos y Dinosaurio
;para dibujar, utilizar mascaras de bits e ir apagando y prendiendo
;3.generar movimiento y colision entre ellos
;4.puntajes

;cada funcion esta explicada al comienzo de la misma

.8086
.model small
.stack 100h
.data
    ;variables para actualizar el mayor puntaje
    HScore dw 0
    CompScore dw 0

    Z1 dw 0
    Z2 dw 0
    Z3 dw 0  ;---------------> contadores para cada numero en pantalla 
    Z4 dw 0
    Z5 dw 0

    H1 dw 0 
    H2 dw 0
    H3 dw 0  ;---------------> contadores para cada numero en pantalla (HIGH SCORE) 
    H4 dw 0
    H5 dw 0

    HitCac db 0  ;usamos esto como un flag para ver si colisiono o no el dino

    ;Data Dino
    Ydino dw 137
    Xdino dw 60 

    ;Data Cactus
    Ycac dw 144
    Xcac1 dw 240d
    Xcac2 dw 240d

    cactusflag db 0
    Cac2Salidas dw 0
.code 
;Funciones para printear sprites:

EXTRN Dino:proc 
EXTRN Cactus:proc
EXTRN Stage:proc
EXTRN Start:proc
EXTRN GAMEOV:proc
EXTRN DinoChoca:proc
;-------------------
EXTRN delay:proc
;-------------------
;Funciones para limpiar y actualizar sprites:
EXTRN limpiaC:proc
EXTRN limpiaG:proc
EXTRN limpiaD:proc
;-------------------
;Funciones para Puntajes:
EXTRN Puntaje_Ini:proc
EXTRN ACT_num:proc
EXTRN HG_num:proc 
;-------------------

main proc
        mov ax,@data
        mov ds,ax

        mov ah,00h          
        mov al,13h          ;----> activa el modo video
        int 10h      

        
        
        Inicio:  
            Fondo:
                mov ax, 0A000h      ; segmento de video
                mov es, ax          ;el segmento de video no esta en el DS por eso usamos el ES
                xor di, di          ; offset 0
                mov al, 0Fh           ; color del fondo (0Fh = blanco)
                mov cx, 320*200     ; cantidad de píxeles
                rep stosb           ; llena toda la pantalla con AL    

                xor bx,bx
                call Stage
                call start
                          
                push Ydino 
                call Dino 

                push Xcac1
                call Cactus


            opciones:
                    xor ax,ax
                    mov ah,00h
                    int 16h 

                    cmp ah,01h          ;-----> 01h es esc y si apretas esc se termina el juego
                    je casi_fin

                    cmp ah,1ch          ;-----> 1ch es enter y si apretas enter continua al juego
                    je continua

                    jmp opciones

            Casi_ini:
                    jmp inicio

            continua: 

                    call LimpiaG 
                    call Mostrar_HG
                    call Puntaje_Ini

                    mov ah,0        ;---------> limpia la entrada de teclado
            juego: 

                    in al,60h
                    cmp al,01h      ;--------> compara si es ESC para salir del juego
                    je fin

                    cmp al,39h      ;------>compara Scan Codes (Espacio y Flecha para arriba) y salta
                    je salto
                                     
                    cmp al,48h      ;------>compara Scan Codes (Espacio y Flecha para arriba) y salta
                    je salto


                    push Ydino
                    call Dino
                            

                    push Xcac1
                    call cactus

                    call delay

                    push Xcac1
                    call limpiaC

                    sub Xcac1,4
                    cmp Xcac1,0
                    je ciclocac

                    call comparo
                    cmp HitCac,1
                    je Reset  
                    jmp juego

            Cas_in:
                    jmp Casi_ini

            ciclocac:
                    call Print_Score

                    mov Xcac1,304
                    call comparo
                    cmp HitCac,1
                    je Reset 
                    jmp juego

            salto:
                    int 81h
                    call Saltar
                    jmp juego
            casi_fin:
                jmp fin
        Reset: 
            call reseteo
        De_nuevo:
            xor ax,ax
            mov ah,00h
            int 16h 

            cmp ah,01h          ;-----> 01h es esc y si apretas esc se termina el juego
            je fin

            cmp ah,1ch          ;-----> 1ch es enter y si apretas enter Vuelve a comenzar el juego
            je Cas_in

            jmp De_nuevo

        fin:
            mov ah, 00h
            mov al, 03h ;------->vuelve a modo texto
            int 10h

            mov ax,4c00h
            int 21h
    endp main 

;Revisa si el cactus esta entre X=50 y X=70, y si el dino esta por encima del cactus o no (genera colision o no)
comparo proc
    
    cmp Xcac1,70
    jbe Casi_Rango
    jmp Fin_Comparar

    Casi_Rango:
        cmp Xcac1,50
        jae En_Rango
        jmp Fin_Comparar

    En_Rango:
        cmp Ydino,128
        ja Hit
        jmp Fin_Comparar
    
    Hit:
        mov HitCac,1
        jmp Fin_Comparar


    Fin_Comparar:
        ret
    endp comparo

;Cada vez que el dino pasa un cactus se incrementa en uno los Contadores de los numeros (llega hasta el nueve y se actualiza)
; luego pusheamos cada contador y llamamos a una funcion que los imprime (libreria)
Print_Score proc
    cmp HitCac,1
    je Fin_PS
    cmp Z1,9
    je Inc_Z2
    inc Z1
    jmp Fin_PS

    Inc_Z2:
        mov Z1,0
        cmp Z2,9
        je Inc_Z3
        inc Z2
        int 82h
        jmp Fin_PS

    Inc_Z3:
        mov Z2,0
        cmp Z3,9
        je Inc_Z4
        inc Z3
        int 82h
        jmp Fin_PS

    Inc_Z4:
        mov Z3,0
        cmp Z4,9
        je Inc_Z5
        inc Z4
        int 82h
        jmp Fin_PS

    Inc_Z5:
        mov Z4,0
        inc Z5
        int 82h 

    Fin_PS:
        push Z1 ;[bp+12]
        push Z2 ;[bp+10]
        push Z3 ;[bp+8]
        push Z4 ;[bp+6]
        push Z5 ;[bp+4]
        call ACT_num
        ret
    endp Print_Score

Saltar proc
    xor cx,cx  
    mov cx,9
    saltando:
        in al,60h
        cmp al,01h  ;--------> compara si es ESC para salir del juego
        je finSalto

        push Ydino
        call limpiaD    ;-------> Limpiar posición actual ANTES de mover
                         
        sub Ydino,4    ;Actualiza pos      
        

        push Ydino
        call Dino
                
        push Xcac1
        call cactus
                
        call delay

        ; Limpiar cactus anterior
        push Xcac1
        call limpiaC
        
        sub Xcac1,4
        cmp Xcac1,0
        je ciclocacS
        call comparo
    loopeo:
        loop saltando 
        jmp finSalto

    ciclocacS:
        call Print_Score

        mov Xcac1,304
        call comparo
        cmp HitCac,1
        je finSalto
        jmp loopeo


    finSalto: 
        call Cayendo
        ret
    endp saltar

Cayendo proc
    xor cx,cx  
    mov cx,9
     bajando:
        in al,60h
        cmp al,01h  ;--------> compara si es ESC para salir del juego
        je FinBajar
       
        push Ydino
        call limpiaD    ;-------> Limpiar posición actual ANTES de mover
                         
        add Ydino,4    ;Actualiza pos      
                
        push Ydino
        call Dino
                
        push Xcac1
        call cactus
                
        call delay

        ; Limpiar cactus anterior
        push Xcac1
        call limpiaC
        
        sub Xcac1,4
        cmp Xcac1,0
        je ciclocacB
        call comparo 
    loopB:
        loop bajando 
        jmp FinBajar

    ciclocacB:
        call Print_Score

        mov Xcac1,304
        call comparo
        cmp HitCac,1
        je FinBajar
        jmp loopB

    FinBajar: 
    ret
    endp Cayendo
;Resetea todos los valores necesarios para comenzar de nuevo el juego (sin terminar el programa)
Reinicio proc
    mov Xcac1,240
    mov HitCac,0

    
    mov Z1,0
    mov Z2,0
    mov Z3,0
    mov Z4,0
    mov Z5,0

    push Z1 ;[bp+12]
    push Z2 ;[bp+10]
    push Z3 ;[bp+8]
    push Z4 ;[bp+6]
    push Z5 ;[bp+4]
    call ACT_num

    ret
    endp Reinicio

;Realiza todo lo necesario para poder ver cual es el Mayor Puntaje e imprimirlo 
HGMain proc
    mov CompScore, 0

    mov ax, Z1          
    add CompScore, ax   
    
    mov ax, Z2
    mov bx, 10          
    mul bx              
    add CompScore, ax
    
    mov ax, Z3
    mov bx, 100         
    mul bx
    add CompScore, ax
    
    mov ax, Z4
    mov bx, 1000        
    mul bx
    add CompScore, ax
    
    mov ax, Z5
    mov bx, 10000       
    mul bx
    add CompScore, ax

  
    mov ax, CompScore
    cmp ax, HScore
    jg Actualizar_puntaje
    jmp Fin_Puntaje
    Actualizar_puntaje:
      
        mov HScore, ax

      
        mov ax, Z1
        mov H1, ax
        mov ax, Z2  
        mov H2, ax
        mov ax, Z3
        mov H3, ax
        mov ax, Z4
        mov H4, ax
        mov ax, Z5
        mov H5, ax


        call Mostrar_HG

    Fin_Puntaje:
        ret
    endp HGMain

;Impresion: 
Mostrar_HG proc
    push H5 ;[bp+12]
    push H4 ;[bp+10]
    push H3 ;[bp+8]
    push H2 ;[bp+6]
    push H1 ;[bp+4]
    call HG_num
    ret 
    endp Mostrar_HG

reseteo proc
    int 83h
    int 83h
    int 83h

    xor ax,ax
    mov ax,137
    mov Ydino,137               ;---pongo la altura de Ydino en 137 por si lo agarra saltando
    push Ydino
    call LimpiaD
    call DinoChoca
    call HGMain
    call GAMEOV
    call Reinicio
    ret
    endp reseteo
end 
