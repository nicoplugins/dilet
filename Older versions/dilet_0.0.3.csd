<CsoundSynthesizer>
<CsOptions>
-odac1 -iadc1 -d -b128 -B128 -m96 
</CsOptions>
<CsInstruments>


sr      = 96000
ksmps   = 1
nchnls  = 2
0dbfs   = 1



		instr		ModDelay

;Inicializar output de retraso para retroalimentación.
aDel 	init 		0

;Perilla de tiempo de retraso.
aTime	=			0.25

;Perillas para oscilador de frecuencia baja.
kRate	=	   	 	6 	;Frecuencia del oscilador en Hz.
kDepth 	= 			0 	;Intensidad de la modulación (0-1).
iWave   =       	0 	;Forma de onda del oscilador.

/* 
Formas de onda del oscilador:
0 		=			Sinusoidal
1 		=			Triángulo
2 		= 			Cuadro bipolar
3 		= 			Cuadro unipolar
4 		= 			Sierra hacia arriba
5 		= 			Sierra hacia abajo
*/

;Toma el tiempo y lo duplica (máximo) o divide (mínimo).
kMod 	= 			aTime*kDepth

;Perilla de retroalimentación (0-1).
kFdbk	=			0.66
;Selección de tipo de filtro (1-4).
kType 	= 			1
;Perilla de frecuencia de corte para filtro.
kCf		=			4000
;Factor Q del filtro.
kQ 		= 			0.5
;Selección de oversampling para el filtro.
iOver 	= 			4
;Habilita si el filtro guarda la información previa o no (0 ó 1).
iStor 	= 			1

;Tiempo de retraso máximo.
iMax 	=			10000
;Ventana, en muestras, para procesamiento de retraso.
iWindow =			1024

;Perilla para relación entre efecto y señal inicial.
kDryWet =       	1

;Oscilador de frecuencia baja.
aLFO	lfo			kMod, kRate, iWave
;Conexión entre perilla de tiempo y oscilador.
aVar 	=			aTime + aLFO

;Entrada de micrófono (preamplificador 1).
aIn     inch    	1
;Opcode de retraso de alta calidad.
aDel 	vdelayxw	aIn + aDel*kFdbk, aVar, iMax, iWindow
;Filtro de estado variable.
aHPF, aLPF, aBPF, aBRF 	statevar 	aDel,  kCf, kQ, iOver, iStor

 		if 			kType=1 	then
aMix 	ntrpol 		aIn, aLPF, kDryWet 
	 	elseif 		kType=2 	then
aMix 	ntrpol 		aIn, aHPF, kDryWet  
	 	elseif 		kType=3 	then
aMix 	ntrpol 		aIn, aBPF, kDryWet 
	 	elseif 		kType=4 	then
aMix 	ntrpol 		aIn, aBRF, kDryWet
 		endif 

;Salidas del efecto.				
		outs		aMix, aMix

		endin


</CsInstruments>
<CsScore>

i 	"ModDelay" 		0		z

</CsScore>
</CsoundSynthesizer>