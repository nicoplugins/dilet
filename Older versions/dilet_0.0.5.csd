<CsoundSynthesizer>
<CsOptions>
-odac0 -iadc1 -d -b128 -B128 -m96 
</CsOptions>
<CsInstruments>

sr      = 96000
ksmps   = 1
nchnls  = 2
0dbfs   = 1


	gkBPM 		init 	0
	gkFactor 	init 	0
	gkQuarter 	init 	0

	gkMeasure 	init 	0
	gkHalf 		init 	0
	gk8th 	 	init 	0
	gk16th 		init 	0

	gkHalf3 	init 	0
	gkQuarter3 	init 	0
	gk8th3 		init 	0
	gk16th3 	init 	0

	gkHalfDot 	init 	0
	gkQuartDot 	init 	0
	gk8thDot 	init 	0
	gk16thDot 	init 	0


instr		ModDelay

	aIn     	inch    1 		;Entrada del plugin

	;Para el opcode "vdelayxw" 
	aDel 		init 	0		;Inicializar output de retraso para retroalimentación.

	kSync 		= 		1
	kSubDiv 	= 		2
	kTrip 		= 		0
	kDot 		= 		1

	aFree 		= 		0.25

	gkBPM 		= 		100
	gkFactor 	= 		60
	gkQuarter 	= 		gkFactor/gkBPM

	gkMeasure 	= 		gkQuarter*4
	gkHalf 		= 		gkQuarter*2
	gk8th 	 	= 		gkQuarter*0.5
	gk16th 		= 		gkQuarter*0.25

	gkMeasure3 	= 		gkMeasure*0.6666
	gkHalf3 	= 		gkHalf*0.6666
	gkQuarter3 	= 		gkQuarter*0.6666
	gk8th3 		= 		gk8th*0.6666
	gk16th3 	= 		gk16th*0.6666

	gkMeasDot 	=		gkMeasure*1.5
	gkHalfDot 	= 		gkHalf*1.5
	gkQuartDot 	= 		gkQuarter*1.5
	gk8thDot 	= 		gk8th*1.5
	gk16thDot 	= 		gk16th*1.5

 	;Perilla de tiempo de retraso

 				if 		kSync==0 	then 	
	aTime 		=		aFree	
				
				elseif 	kSync==1 	then
					if 		kSubDiv==0 && kTrip==0 && kDot==0	then	
		aTime 		= 		gkMeasure
					elseif 	kSubDiv==1 && kTrip==0 && kDot==0	then
		aTime 		= 		gkHalf
					elseif 	kSubDiv==2 && kTrip==0 && kDot==0 	then
		aTime 		= 		gkQuarter
					elseif 	kSubDiv==3 && kTrip==0 && kDot==0 	then
		aTime 		= 		gk8th
					elseif 	kSubDiv==4 && kTrip==0 && kDot==0 	then
		aTime 		= 		gk16th
					elseif	kSubDiv==0 && kTrip==1 && kDot==0	then	
		aTime 		= 		gkMeasure3
					elseif 	kSubDiv==1 && kTrip==1 && kDot==0	then
		aTime 		= 		gkHalf3
					elseif 	kSubDiv==2 && kTrip==1 && kDot==0 	then
		aTime 		= 		gkQuarter3
					elseif 	kSubDiv==3 && kTrip==1 && kDot==0 	then
		aTime 		= 		gk8th3
					elseif 	kSubDiv==4 && kTrip==1 && kDot==0 	then
		aTime 		= 		gk16th3
					elseif	kSubDiv==0 && kTrip==0 && kDot==1	then	
		aTime 		= 		gkMeasDot
					elseif 	kSubDiv==1 && kTrip==0 && kDot==1	then
		aTime 		= 		gkHalfDot
					elseif 	kSubDiv==2 && kTrip==0 && kDot==1 	then
		aTime 		= 		gkQuartDot
					elseif 	kSubDiv==3 && kTrip==0 && kDot==1 	then
		aTime 		= 		gk8thDot
					elseif 	kSubDiv==4 && kTrip==0 && kDot==1 	then
		aTime 		= 		gk16thDot
		 			endif

/*
	aTime 		= 		gkHalf3
	aTime 		= 		gkQuarter3
	aTime 		= 		gk8th3
	aTime 		= 		gk16th3

	aTime 		= 		gkHalfDot
	aTime 		= 		gkQuartDot
	aTime 		= 		gk8thDot
	aTime 		= 		gk16thDot
*/
				endif

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

	;Selectores de tiempo



	aDel 					vdelayxw	aIn + aDel*kFdbk, aVar, iMax, iWindow 	;Opcode de retraso de alta calidad.
	aHPF, aLPF, aBPF, aBRF 	statevar 	aDel,  kCf, kQ, iOver, iStor 			;Filtro de estado variable.

	 		if 			kType==1 	then 	;Selección de filtro de paso bajo.
	aMix 	ntrpol 		aIn, aLPF, kDryWet 
		 	elseif 		kType==2 	then 	;Selección de filtro de paso alto.
	aMix 	ntrpol 		aIn, aHPF, kDryWet  
		 	elseif 		kType==3 	then 	;Selección de filtro de paso de banda.
	aMix 	ntrpol 		aIn, aBPF, kDryWet 	
		 	elseif 		kType==4 	then 	;Selección de filtro de rechazo de banda.
	aMix 	ntrpol 		aIn, aBRF, kDryWet
	 		endif 
			
			outs		aMix, aMix 	;Salidas del plugin.		
endin


</CsInstruments>
<CsScore>

i 	"ModDelay" 		0		z 	;Corre el instrumento "Mod Delay" infinitamente.

</CsScore>
</CsoundSynthesizer>