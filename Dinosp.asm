.8086
.model small
.stack 100h
.data
	;data para Start PROC
spriteGame 		DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 03h, 0FFh, 0C0h, 0FFh, 0F9h, 0F0h, 0FCh, 7Fh, 0F0h, 00h,24h
			    DB 03h, 0FFh, 0F1h, 0FFh, 0FFh, 0FCh, 0FFh, 0FFh, 0FCh, 00h,24h
			    DB 03h, 00h, 1Dh, 80h, 03h, 87h, 0C1h, 0E0h, 03h, 00h,24h
			    DB 03h, 07h, 06h, 38h, 23h, 81h, 0C1h, 83h, 0C1h, 00h,24h
			    DB 03h, 07h, 0C2h, 18h, 23h, 80h, 41h, 83h, 0E1h, 00h,24h
			    DB 03h, 07h, 0C3h, 18h, 23h, 80h, 01h, 83h, 0E1h, 00h,24h
			    DB 03h, 07h, 83h, 0F8h, 3Bh, 84h, 01h, 83h, 0E1h, 00h,24h
			    DB 03h, 00h, 0Dh, 0C0h, 07h, 87h, 01h, 80h, 01h, 00h,24h
			    DB 01h, 00h, 30h, 80h, 07h, 84h, 41h, 20h, 06h, 00h,24h
			    DB 00h, 3Fh, 0E0h, 3Fh, 0C0h, 0F8h, 7Ch, 3Fh, 0FCh, 00h,24h
			    DB 00h, 7Fh, 0FEh, 3Fh, 0E3h, 0F9h, 0FFh, 0FFh, 0FFh, 00h,24h
			    DB 01h, 0F0h, 03h, 0F0h, 1Bh, 87h, 0C1h, 80h, 01h, 00h,24h
			    DB 03h, 0C0h, 03h, 0C0h, 07h, 81h, 01h, 80h, 01h, 00h,24h
			    DB 03h, 07h, 0FFh, 83h, 83h, 80h, 01h, 83h, 0FCh, 00h,24h
			    DB 03h, 07h, 03h, 07h, 0C1h, 80h, 01h, 80h, 04h, 00h,24h
			    DB 03h, 07h, 83h, 00h, 01h, 80h, 41h, 83h, 0FEh, 00h,24h
			    DB 00h, 0C1h, 0C3h, 01h, 0C1h, 87h, 0C1h, 83h, 0FFh, 00h,24h
			    DB 00h, 30h, 03h, 84h, 0C3h, 84h, 0C1h, 80h, 01h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
    			DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,99h

spriteEnter 	DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 0Fh, 0E7h, 0FBh, 0FFh, 0FEh, 0FFh, 9Fh, 0EFh, 1Fh, 0FEh, 0FFh, 7Fh, 00h,24h
			    DB 0Eh, 77h, 3Bh, 83h, 80h, 0E0h, 1Ch, 0Fh, 0DCh, 70h, 0E0h, 67h, 00h,24h
			    DB 0Fh, 0F7h, 7Bh, 0E3h, 0FEh, 0FFh, 9Fh, 0Fh, 0FCh, 70h, 0F8h, 67h, 00h,24h
			    DB 0Fh, 0C7h, 0F3h, 80h, 0Eh, 03h, 9Ch, 0Eh, 0FCh, 70h, 0E0h, 7Eh, 00h,24h
			    DB 0Eh, 07h, 0FBh, 0FFh, 0FEh, 0FFh, 9Fh, 0EEh, 3Ch, 70h, 0FFh, 7Fh, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 7Fh, 0CFh, 80h, 0FFh, 70h, 03h, 83h, 0CFh, 80h, 00h, 00h,24h
			    DB 00h, 00h, 0Eh, 18h, 0C0h, 0E3h, 0F0h, 07h, 0C1h, 0FFh, 00h, 00h, 00h,24h
			    DB 00h, 00h, 0Eh, 1Ch, 0C0h, 0FFh, 0F0h, 0Eh, 0E0h, 0FCh, 00h, 00h, 00h,24h
			    DB 00h, 00h, 0Eh, 1Ch, 0C0h, 0FEh, 70h, 1Fh, 0F3h, 0F0h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 0Eh, 0Fh, 80h, 0E0h, 7Fh, 0BCh, 73h, 0C0h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
			    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,99h

spriteGAMEOV    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 03h, 0FFh, 0F8h, 03h, 0F8h, 07h, 0E0h, 3Fh, 3Fh, 0FFh, 0F8h, 00h,24h
				DB 07h, 0FFh, 0F8h, 07h, 0F8h, 07h, 0E0h, 3Fh, 3Fh, 0FFh, 0F8h, 00h,24h
				DB 0Fh, 0E0h, 00h, 1Fh, 3Fh, 07h, 0F8h, 0FFh, 3Fh, 00h, 00h, 00h,24h
				DB 1Fh, 80h, 00h, 0FEh, 1Fh, 0C7h, 0FFh, 0FFh, 3Fh, 00h, 00h, 00h,24h
				DB 1Fh, 00h, 00h, 0F8h, 07h, 0E7h, 0FFh, 0FFh, 3Fh, 00h, 00h, 00h,24h
				DB 1Fh, 07h, 0F8h, 0F8h, 07h, 0C7h, 0FFh, 0FFh, 3Fh, 0FFh, 0C0h, 00h,24h
				DB 1Fh, 00h, 0F8h, 0FFh, 0FFh, 0C7h, 0E7h, 3Fh, 3Fh, 00h, 00h, 00h,24h
				DB 0Fh, 0C0h, 0F8h, 0FCh, 0Fh, 0E7h, 0E0h, 3Fh, 3Fh, 00h, 00h, 00h,24h
				DB 07h, 0FFh, 0F8h, 0F8h, 07h, 0E7h, 0E0h, 3Fh, 3Fh, 0FFh, 0F0h, 00h,24h
				DB 03h, 0FFh, 0F8h, 0F8h, 07h, 0C7h, 0C0h, 3Fh, 3Fh, 0FFh, 0F8h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 07h, 0FFh, 0E0h, 0F8h, 07h, 0C7h, 0FFh, 0FFh, 3Fh, 0FFh, 0C0h, 00h,24h
				DB 1Fh, 00h, 0F8h, 0F8h, 07h, 0C7h, 0E0h, 00h, 3Fh, 01h, 0F8h, 00h,24h
				DB 1Fh, 00h, 0F8h, 0F8h, 07h, 0C7h, 0E0h, 00h, 3Fh, 00h, 0F8h, 00h,24h
				DB 1Fh, 00h, 0F8h, 0F8h, 07h, 0C7h, 0FFh, 0F8h, 3Fh, 03h, 0F8h, 00h,24h
				DB 1Fh, 00h, 0F8h, 0F8h, 07h, 0C7h, 0FFh, 0F8h, 3Fh, 07h, 0F8h, 00h,24h
				DB 1Fh, 00h, 0F8h, 1Fh, 3Fh, 07h, 0E0h, 00h, 3Fh, 0FFh, 00h, 00h,24h
				DB 1Fh, 00h, 0F8h, 07h, 0F8h, 07h, 0E0h, 00h, 3Fh, 3Fh, 0C0h, 00h,24h
				DB 07h, 0FFh, 0E0h, 01h, 0E0h, 07h, 0FFh, 0FFh, 3Fh, 0Fh, 0F8h, 00h,24h
				DB 03h, 0FFh, 0C0h, 00h, 0C0h, 07h, 0FFh, 0FEh, 1Eh, 07h, 0F8h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Fh, 0FFh, 0FFh, 0F0h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Fh, 0F7h, 0FFh, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Fh, 00h, 0E3h, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Ch, 00h, 0E1h, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Ch, 73h, 0F1h, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Ch, 7Fh, 0F1h, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Ch, 7Fh, 0F1h, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Eh, 00h, 01h, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Fh, 0FFh, 0FFh, 0F8h, 00h, 00h, 00h, 00h, 00h, 00h,24h
				DB 00h,00h,00h,00h,7Fh, 0FFh, 0FFh, 0F8h, 00h, 00h, 00h, 00h, 00h,  00h,24h
				DB 00h,00h,00h,00h,7Fh, 0FFh, 0FFh, 0F0h, 00h, 00h, 00h, 00h, 00h,  00h,24h
				DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h, 00h, 00h, 00h,99h

;--------------------------------------------------------------

;data para Printea_sp
	Xpos dw 0 
	Ypos dw 0
	BITMAP	DB	80h,40h,20h,10h,08h,04h,02h,01h

;Sprite del dino cuando choca un cactus
DinoChoc  	DB 00h, 00h, 00h, 1Fh, 0FFh, 0F0h,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 79h, 07Fh, 0FCh,24h
		    DB 00h, 00h, 00h, 7Ah, 07Fh, 0FCh,24h
		    DB 00h, 00h, 00h, 79h, 07Fh, 0FCh,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 20h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 60h, 00h, 7Fh, 0E0h, 00h,24h
		    DB 00h, 0E0h, 00h, 7Fh, 0FFh, 80h,24h
		    DB 01h, 0E0h, 01h, 0FFh, 80h, 00h,24h
		    DB 03h, 0E0h, 0Fh, 0FFh, 80h, 00h,24h
		    DB 03h, 0F0h, 3Fh, 0FFh, 0FCh, 00h,24h
		    DB 03h, 0F8h, 0FFh, 0FFh, 0FCh, 00h,24h
		    DB 03h, 0FFh, 0FFh, 0FFh, 8Ch, 00h,24h
		    DB 01h, 0FFh, 0FFh, 0FFh, 80h, 00h,24h
		    DB 00h, 0FFh, 0FFh, 0FFh, 80h, 00h,24h
		    DB 00h, 7Fh, 0FFh, 0FEh, 00h, 00h,24h
		    DB 00h, 3Fh, 0FFh, 0F8h, 00h, 00h,24h
		    DB 00h, 0Fh, 0FFh, 0E0h, 00h, 00h,24h
		    DB 00h, 03h, 0F8h, 0E0h, 00h, 00h,24h
		    DB 00h, 03h, 0E1h, 0E0h, 00h, 00h,24h
		    DB 00h, 03h, 80h, 60h, 00h, 00h,24h
		    DB 00h, 03h, 0C0h, 78h, 00h, 00h,99h

;Sprite del dino 
spriteDino  DB 00h, 00h, 00h, 1Fh, 0FFh, 0F0h,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 79h, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 79h, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0FCh,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 0F8h,24h
		    DB 00h, 00h, 00h, 7Fh, 0FFh, 80h,24h
		    DB 08h, 00h, 01h, 0FFh, 80h, 00h,24h
		    DB 1Ch, 00h, 0Fh, 0FFh, 80h, 00h,24h
		    DB 1Eh, 00h, 7Fh, 0FFh, 0FCh, 00h,24h
		    DB 1Fh, 81h, 0FFh, 0FFh, 0FCh, 00h,24h
		    DB 1Fh, 0C7h, 0FFh, 0FFh, 8Ch, 00h,24h
		    DB 0Fh, 0FFh, 0FFh, 0FFh, 80h, 00h,24h
		    DB 07h, 0FFh, 0FFh, 0FFh, 80h, 00h,24h
		    DB 01h, 0FFh, 0FFh, 0FEh, 00h, 00h,24h
		    DB 00h, 3Fh, 0FFh, 0F8h, 00h, 00h,24h
		    DB 00h, 0Fh, 0FFh, 0E0h, 00h, 00h,24h
		    DB 00h, 03h, 0F8h, 0E0h, 00h, 00h,24h
		    DB 00h, 03h, 0E1h, 0E0h, 00h, 00h,24h
		    DB 00h, 03h, 80h, 60h, 00h, 00h,24h
		    DB 00h, 03h, 0C0h, 78h, 00h, 00h,99h
		

	;------------------------------------
	;data para Cactus Proc
	
SpriteC		DB 03h, 80h,24h
			DB 03h, 80h,24h
		    DB 63h, 8Ch,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 7Fh, 8Eh,24h
		    DB 3Fh, 8Eh,24h
		    DB 03h, 0FCh,24h
		    DB 03h, 0F8h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,99h

SpriteC2	DB 03h, 8Ch,24h
			DB 03h, 8Eh,24h
		    DB 03h, 8Eh,24h
		    DB 063h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 8Eh,24h
		    DB 0E3h, 0FCh,24h
		    DB 0E3h, 0F8h,24h
		    DB 0E3h, 80h,24h
		    DB 7Fh, 80h,24h
		    DB 3Fh, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,24h
		    DB 03h, 80h,99h		    


;data para puntajes:
;sprites numeros
	Cerosp 	DB 00h,24h
			DB 3Ch,24h
			DB 42h,24h
			DB 42h,24h
			DB 42h,24h
			DB 42h,24h
			DB 42h,24h
			DB 3Ch,24h
			DB 00h,99h


	Unosp   DB 00h,24h
			DB 38h,24h
			DB 08h,24h
			DB 08h,24h
			DB 08h,24h
			DB 08h,24h
			DB 08h,24h
			DB 08h,24h
			DB 00h,99h

	Dossp   DB 00h,24h
			DB 3Ch,24h
			DB 42h,24h
			DB 04h,24h
			DB 08h,24h
			DB 10h,24h
			DB 20h,24h
			DB 7Eh,24h
			DB 00h,99h

	Tressp  DB 00h,24h
			DB 7Ch,24h
			DB 08h,24h
			DB 10h,24h
			DB 38h,24h
			DB 04h,24h
			DB 44h,24h
			DB 38h,24h
			DB 00h,99h

	Cuatrosp DB 00h,24h
			DB 22h,24h
			DB 22h,24h
			DB 22h,24h
			DB 3Eh,24h
			DB 02h,24h
			DB 02h,24h
			DB 02h,24h
			DB 00h,99h

	Cincosp DB 00h,24h
			DB 7Ch,24h
			DB 40h,24h
			DB 78h,24h
			DB 04h,24h
			DB 04h,24h
			DB 44h,24h
			DB 38h,24h
			DB 00h,99h

	Seissp  DB 00h,24h
			DB 3Ch,24h
			DB 40h,24h
			DB 7Ch,24h
			DB 42h,24h
			DB 42h,24h
			DB 42h,24h
			DB 3Ch,24h
			DB 00h,99h

	Sietesp DB 00h,24h
			DB 7Ch,24h
			DB 04h,24h
			DB 08h,24h
			DB 10h,24h
			DB 20h,24h
			DB 20h,24h
			DB 20h,24h
			DB 00h,99h


	Ochosp 	DB 00h,24h
			DB 3Ch,24h
			DB 42h,24h
			DB 42h,24h
			DB 3Ch,24h
			DB 42h,24h
			DB 42h,24h
			DB 3Ch,24h
			DB 00h,99h

	Nuevesp DB 00h,24h
			DB 3Eh,24h
			DB 22h,24h
			DB 22h,24h
			DB 3Eh,24h
			DB 02h,24h
			DB 02h,24h
			DB 02h,24h
			DB 00h,99h
;Posiciones de los NUM en pantalla
 XZ5 dw 278
 XZ4 dw 286
 XZ3 dw 294
 XZ2 dw 302
 XZ1 dw 310
;Posiciones para HIGH SCORE
 XH1 dw 2
 XH2 dw 10
 XH3 dw 18
 XH4 dw 26
 XH5 dw 34 
.code

;funciones de printeo:

Public Dino 
Public Start
public Cactus
Public Stage
Public GAMEOV
Public DinoChoca
;-------------
public delay
;------------
;Funciones para limpiar y actualizar sprites: 

public LimpiaC
public LimpiaG
public LimpiaD

;-----------------
;funciones puntajes:
Public Puntaje_Ini
Public ACT_num
Public HG_num

;imprime carteles iniciales
Start proc
	push cx
	push dx
	push si

	mov cx,125
    mov dx,30
	lea si,spriteGame	
	call printea_sp


	mov cx,115
	mov dx,60
	lea si,spriteEnter
	call printea_sp

	pop si
	pop dx
	pop cx

	ret
	endp Start 
;Imprime el escenario
Stage proc
	push ax
	push bx
	push cx
	push dx
	mov bl,2
	Fondo:
            linea:
                mov dx,160   ;Eje Y
                mov ah, 0Ch  ;seteo la posicion donde se va a dibujar la linea del mapa
                mov al,00h
                int 10h

                cmp bl,4
                jge rayas
                jmp incrementa 

            rayas:
                mov dx,163
                mov ah,0Ch
                mov al,00h
                int 10h
                cmp bl,8
                je SiZero
                jmp incrementa

            Sizero:
                mov bl,0

            incrementa:
                inc bl
                inc cx
                cmp cx,320
                jl Fondo

	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp Stage

;En caso de colision imprime Cartel de GAME OVER
GAMEOV proc
	push cx
	push dx
	push si

	mov cx,121
    mov dx,30
	lea si,spriteGAMEOV
	call printea_sp

	
	pop si
	pop dx
	pop cx
	ret
	endp GAMEOV
DinoChoca proc
		push dx
		push cx
		push si
		push di



		mov dx,137
        mov cx,50     ;-------> Seteamos posicion del dinosaurio (fija)
	 	lea si,DinoChoc
	 	call printea_sp

		pop di
		pop si
		pop cx
		pop dx

		ret  
	endp DinoChoca
;Se Necesita Pushear Ydino y lo imprime por pantalla
Dino proc
		push bp
		mov bp,sp
		push dx
		push cx
		push si
		push di



		mov dx,[bp+4]
        mov cx,50      ;-------> Seteamos posicion del dinosaurio (fija)
	 	lea si,spriteDino
	 	call printea_sp

		pop di
		pop si
		pop cx
		pop dx
		pop bp
		ret 2 
	endp Dino

;Se le pushea Xcac y se lo imprime por pantalla
Cactus proc
	push bp
	mov bp,sp 
	push cx
	push dx
	push di


	mov dx,142		;-------> seteamos Pos del cactus 
	mov cx,[bp+4]


	lea si,SpriteC	 
	call printea_sp

	pop di
	pop dx
	pop cx
	pop bp
	ret 2
	endp Cactus


;FUNCION PARA PRINTEAR SPRITES:
printea_sp proc ; recibe en SI el offset del sprite, CX = X, DX = Y
    push bp
    mov bp,sp

    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; Guardar X/Y en variables (opcionales, pero útiles si Limpia las usa)
    mov Xpos, cx
    mov Ypos, dx

    xor di,di          ; bit index 0..7

	_principio:
    cmp byte ptr [si], 99h
    je _fin_printea
    cmp byte ptr [si], 24h
    je _nueva_linea

    ; obtener mascara y byte del sprite
    mov al, BITMAP[di] ; a1..a8
    mov bl, [si]       ; byte del sprite
    test bl, al
    jz _pinta_blanco

	_pinta_negro:
	; escribir pixel negro en (CX,DX) - modo 13h INT 10h AH=0Ch
	mov ah,0Ch
	mov al,00h
	mov bh,0          ; página 0
	int 10h
	jmp _desplazar

	_pinta_blanco:
	mov ah,0Ch
	mov al,0Fh
	mov bh,0
	int 10h

	_desplazar:
	cmp di,7
	je _siguiente_byte
	inc di
	inc cx
	jmp _principio

	_siguiente_byte:
	mov di,0
	inc si
	jmp _principio

	_nueva_linea:
	mov cx, Xpos      ; restaurar X al inicio de la línea
	inc dx
	inc si
	jmp _principio

	_fin_printea:
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret
	printea_sp endp

;Forzamos un delay para ver el juego a una velocidad "normal"
delay proc
	push bx
	push cx

    mov cx, 3000 ; Ajustá este valor hasta que te guste la velocidad
	l1: mov bx, 300        ; bucle interno
	l2: dec bx
    jnz l2
    dec cx
    jnz l1

	pop cx
	pop bx
	ret 
	endp delay

;Mismo proceso que Printea_sp Solo que Borra el sprite (pinta pixeles de blanco)
Limpia proc ; SI = offset sprite, CX = X, DX = Y
    push bp
    mov bp,sp

    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov Xpos, cx
   

    xor di,di

	_limp_inicio:
		cmp byte ptr [si], 99h
		je _limp_fin
		cmp byte ptr [si], 24h
		je _limp_nueva_linea

		; pintar blanco en (CX,DX)
		mov ah,0Ch
		mov al,0Fh
		mov bh,0
		int 10h

		cmp di,7
		je _limp_siguiente_byte
		inc di
		inc cx
		jmp _limp_inicio

	_limp_siguiente_byte:
		mov di,0
		inc si
		jmp _limp_inicio

	_limp_nueva_linea:
		mov cx, Xpos
		inc dx
		inc si
		jmp _limp_inicio

	_limp_fin:
		pop di
		pop si
		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		ret
	Limpia endp

;Se le pushea Xcac y borra el cactus en esa posicion
LimpiaC proc
	push bp
	mov bp,sp
	push cx
	push dx
	push di
	push si


	mov dx,142		;-------> seteamos pos del cactus (eje Y)
	mov cx,[bp+4]

	lea si,SpriteC	 
	call Limpia

	pop si
	pop di
	pop dx
	pop cx
	pop bp
	ret 2
	endp LimpiaC

;Limpia Los carteles iniciales
LimpiaG proc
	push cx
	push dx
	push si

	xor cx,cx
    xor dx,dx

	mov cx,125
    mov dx,30
    
	lea si,spriteGame	
	call limpia

	mov cx,115
	mov dx,60
	lea si,spriteEnter
	call limpia

	pop si
	pop dx
	pop cx
	ret
	endp LimpiaG

;Se le pushea Ydino y limpia el dino en esa posicion
LimpiaD proc
    push bp
    mov bp,sp
    push cx
    push dx
    push si
 
    mov cx,60

    mov dx,[bp+4]

    lea si,spriteDino
    call Limpia

    pop si
    pop dx
    pop cx
    pop bp
    ret 2
	endp LimpiaD

;Se setean los "0" del Score Actual al inicio de cada reseteo del juego	
Puntaje_Ini proc
	push bx
	push cx
	push dx
	
	Set_Start_Zero:


	mov cx,XZ5	
	mov dx,10
	lea si, Cerosp
	call printea_sp

	mov cx,XZ4
	mov dx,10
	lea si, Cerosp
	call printea_sp

	mov cx,XZ3
	mov dx,10
	lea si, Cerosp
	call printea_sp

	mov cx,XZ2
	mov dx,10
	lea si, Cerosp
	call printea_sp

	mov cx,XZ1
	mov dx,10
	lea si, Cerosp
	call printea_sp

	Fin_Set:
	pop dx
	pop cx
	pop bx
	ret
	endp Puntaje_Ini

;Recibe por Stack los valores de cada contador y los guarda en SI
ACT_num proc
	push bp
	mov bp,sp
	push cx
	push dx
	push si

	mov dx,10  ;-------> seteo fijo de eje Y 

	mov si,[bp+12]
	mov cx,XZ1
	Call Num_Select


	mov si,[bp+10]
	mov cx,XZ2
	Call Num_Select

	
	mov si,[bp+8]
	mov cx,XZ3
	Call Num_Select

	mov si,[bp+6]
	mov cx,XZ4
	Call Num_Select

	mov si,[bp+4]
	mov cx,XZ5
	Call Num_Select

	pop si
	pop dx
	pop cx
	pop bp 
	ret 10
	endp ACT_num

;Dependiendo de lo que este en SI elige el numero a imprimir
Num_Select proc
	
	cmp si,0
	je Zero

	cmp si,1
	je one 

	cmp si,2
	je two

	cmp si,3
	je three

	cmp si,4
	je four

	cmp si,5
	je five

	cmp si,6
	je six

	cmp si,7
	je seven

	cmp si,8
	je eight

	cmp si,9
	je nine

	Zero:
	lea si,Cerosp
	call printea_sp
	jmp Fin_NUM

	one:
	lea si,Unosp
	call printea_sp
	jmp Fin_NUM

	two:
	lea si,Dossp
	call printea_sp
	jmp Fin_NUM

	three:
	lea si,Tressp
	call printea_sp
	jmp Fin_NUM

	four:
	lea si,Cuatrosp
	call printea_sp
	jmp Fin_NUM

	five:
	lea si,Cincosp
	call printea_sp
	jmp Fin_NUM

	six:
	lea si,Seissp
	call printea_sp
	jmp Fin_NUM

	seven:
	lea si,Sietesp
	call printea_sp
	jmp Fin_NUM

	eight:
	lea si,Ochosp
	call printea_sp
	jmp Fin_NUM

	nine:
	lea si,Nuevesp
	call printea_sp

	Fin_NUM:
	ret
	endp Num_Select

;Mismo proceso de ACT_NUM solo que para actualizar el Puntaje Mas Alto
HG_num proc
	push bp
	mov bp,sp
	push cx
	push dx
	push si

	mov dx,10  ;-------> seteo fijo de eje Y 

	mov si,[bp+12]
	mov cx,XH1
	Call Num_Select


	mov si,[bp+10]
	mov cx,XH2
	Call Num_Select

	
	mov si,[bp+8]
	mov cx,XH3
	Call Num_Select

	mov si,[bp+6]
	mov cx,XH4
	Call Num_Select

	mov si,[bp+4]
	mov cx,XH5
	Call Num_Select

	pop si
	pop dx
	pop cx
	pop bp 
	ret 10
	endp HG_num
end
