<CsoundSynthesizer>
<CsOptions>
-odac0 -iadc1 -d -b128 -B128 -m96 
</CsOptions>
<CsInstruments>

sr      = 96000
ksmps   = 1
nchnls  = 2
0dbfs   = 1

gkBPM 		chnget 		"HOST_BPM"
gkQuarter 	= 			60000/gkBPM

instr		ModDelay

	aIn     inch    	1 		;Entrada del plugin

	;Para el opcode "vdelayxw" 
	aDel 	init 		0		;Inicializar output de retraso para retroalimentación.
	aTime	=			0.25 	;Perilla de tiempo de retraso.
	iMax 	=			10000 	;Tiempo de retraso máximo.
	iWindow =			1024 	;Ventana, en muestras, para procesamiento de retraso.
	kFdbk	=			0.66 	;Perilla de retroalimentación (0-1).

	;Filtro de paso bajo
	kType 	= 			1 		;Selección de tipo de filtro (1-4).
	kCf		=			6000 	;Perilla de frecuencia de corte para filtro.
	kQ 		= 			0.5 	;Factor Q del filtro.
	iOver 	= 			4 		;Selección de oversampling para el filtro.
	iStor 	= 			1 		;Habilita si el filtro guarda la información previa o no (0 ó 1).

	;Oscilador de frecuencia baja.
	kRate	=	   	 	1 		;Frecuencia del oscilador en Hz.
	kDepth 	= 			0 		;Intensidad de la modulación (0-1).
	iWave   =       	0 		;Forma de onda del oscilador.
	kMod 	= 			aTime*kDepth 		;Toma el tiempo y lo duplica (máximo) o divide (mínimo).
	aLFO	lfo			kMod, kRate, iWave 	;Oscilador de frecuencia baja.

	/* 
	Formas de onda del oscilador:
	0 		=			Sinusoidal
	1 		=			Triángulo
	2 		= 			Cuadro bipolar
	3 		= 			Cuadro unipolar
	4 		= 			Sierra hacia arriba
	5 		= 			Sierra hacia abajo
	*/

	aVar 	= 	aTime + aLFO 	;Conexión entre perilla de tiempo y oscilador.
	kDryWet =   0.5				;Perilla para relación entre efecto y señal inicial.

	aDel 					vdelayxw	aIn + aDel*kFdbk, aVar, iMax, iWindow 	;Opcode de retraso de alta calidad.
	aHPF, aLPF, aBPF, aBRF 	statevar 	aDel,  kCf, kQ, iOver, iStor 			;Filtro de estado variable.

	 		if 			kType=1 	then 	;Selección de filtro de paso bajo.
	aMix 	ntrpol 		aIn, aLPF, kDryWet 
		 	elseif 		kType=2 	then 	;Selección de filtro de paso alto.
	aMix 	ntrpol 		aIn, aHPF, kDryWet  
		 	elseif 		kType=3 	then 	;Selección de filtro de paso de banda.
	aMix 	ntrpol 		aIn, aBPF, kDryWet 	
		 	elseif 		kType=4 	then 	;Selección de filtro de rechazo de banda.
	aMix 	ntrpol 		aIn, aBRF, kDryWet
	 		endif 
			
			outs		aMix, aMix 	;Salidas del plugin.		
endin


</CsInstruments>
<CsScore>

i 	"ModDelay" 		0		z 	;Corre el instrumento "Mod Delay" infinitamente.

</CsScore>
</CsoundSynthesizer>