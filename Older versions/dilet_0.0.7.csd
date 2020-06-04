<CsoundSynthesizer>
<CsOptions>
-odac0 -iadc1 -d -b128 -B128 -m96 
</CsOptions>
<CsInstruments>

sr      = 44100
ksmps   = sr/512
nchnls  = 2
0dbfs   = 1

/*Inicialización de variables globales para sincronizar con el tempo.
Para mayor explicación, ver comentarios dentro del instrumento.*/
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

	aIn     inch 	1 		;Entrada de audio del plugin.

	;Controles para el opcode "vdelayxw". 
	aDelL 	init 	0		;Inicializar output de retraso para retroalimentación.
	aDelR 	init 	0		;Inicializar output de retraso para retroalimentación.
	aFree 	=		0.015	 	;Perilla de tiempo libre (sin sincronía al tempo).
	kFdbk	=		0 	 	;Perilla de retroalimentación (0-1).
	iMax 	=		10000 	;Tiempo de retraso máximo.
	iWindow =		1024 	;Ventana, en muestras, para procesamiento de retraso.

	;Botones para sincronía rítmica de tempo.
	kSync 		= 		0 	;Botón para encender o apagar sincronía al tempo del DAW.
	kSubDiv 	= 		2 	;Botón para seleccionar subdivisiones básicas.
	kTrip 		= 		0 	;Botón para calcular tresillos de la subdivisión seleccionada.
	kDot 		= 		0 	;Botón para poner punto a la subdivisión.

	gkBPM 		= 		100				;Recibe información de tempo del DAW.
	gkFactor 	= 		60				;Factor para relacionar BPM y segundos.
	gkQuarter 	= 		gkFactor/gkBPM 	;Cálculo de relación entre BPM y subdivisión de 1/4.
	
	;Subdivisiones rítmicas básicas.
	gkMeasure 	= 		gkQuarter*4 	;Calcula un redonda.
	gkHalf 		= 		gkQuarter*2 	;Calcula una blanca.
	gk8th 	 	= 		gkQuarter*0.5 	;Calcula una corchea.
	gk16th 		= 		gkQuarter*0.25 	;Calcula una semicorchea.

	gkMeasure3 	= 		gkMeasure*0.6666 	;Calcula tresillos de redonda.
	gkHalf3 	= 		gkHalf*0.6666 		;Calcula tresillos de blanca.
	gkQuarter3 	= 		gkQuarter*0.6666 	;Calcula tresillos de negra.
	gk8th3 		= 		gk8th*0.6666 		;Calcula tresillos de corchea.
	gk16th3 	= 		gk16th*0.6666 		;Calcula tresillos de semicorchea.

	gkMeasDot 	=		gkMeasure*1.5 	;Calcula redonda con puntillo.
	gkHalfDot 	= 		gkHalf*1.5 		;Calcula blanca con puntillo.
	gkQuartDot 	= 		gkQuarter*1.5 	;Calcula negra con puntillo.
	gk8thDot 	= 		gk8th*1.5 		;Calcula corchea con puntillo.
	gk16thDot 	= 		gk16th*1.5 		;Calcula dieciseisavo con puntillo.
	

 	if 	kSync==0 	then 	;Botón de sync apagado.
		aTime 	= 	aFree	
				
		elseif 	kSync==1 	then 	;Botón de sync encendido.
			;Selección de un compás.
			if 		kSubDiv==0 && kTrip==0 && kDot==0 	then 	
					aTime 	= 	gkMeasure
			;Selección de una blanca.
			elseif 	kSubDiv==1 && kTrip==0 && kDot==0	then 	
					aTime 	=	gkHalf
			;Selección de una negra.
			elseif 	kSubDiv==2 && kTrip==0 && kDot==0 	then 	
					aTime 	=	gkQuarter
			;Selección de una corchea.
			elseif 	kSubDiv==3 && kTrip==0 && kDot==0 	then 	
					aTime 	=	gk8th
			;Selección de una semicorchea.			
			elseif 	kSubDiv==4 && kTrip==0 && kDot==0 	then 	
					aTime 	=	gk16th
			;Selección de compás con tresillo.	
			elseif	kSubDiv==0 && kTrip==1 && kDot==0	then	
					aTime 	=	gkMeasure3
			;Selección de blanca con tresillo.
			elseif 	kSubDiv==1 && kTrip==1 && kDot==0	then 	
					aTime 	=	gkHalf3
			;Selección de negra con tresillo.
			elseif 	kSubDiv==2 && kTrip==1 && kDot==0 	then 	
					aTime 	=	gkQuarter3
			;Selección de corchea con tresillo.
			elseif 	kSubDiv==3 && kTrip==1 && kDot==0 	then 	
					aTime 	=	gk8th3
			;Selección de semicorchea con tresillo.
			elseif 	kSubDiv==4 && kTrip==1 && kDot==0 	then 	
					aTime 	=	gk16th3
			;Selección de compás con puntillo.
			elseif	kSubDiv==0 && kTrip==0 && kDot==1	then	
					aTime 	=	gkMeasDot
			;Selección de blanca con puntillo.
			elseif 	kSubDiv==1 && kTrip==0 && kDot==1	then 	
					aTime 	=	gkHalfDot
			;Selección de negra con puntillo.
			elseif 	kSubDiv==2 && kTrip==0 && kDot==1 	then 	
					aTime 	=	gkQuartDot
			;Selección de corchea con puntillo.
			elseif 	kSubDiv==3 && kTrip==0 && kDot==1 	then 	
					aTime 	=	gk8thDot
			;Selección de semicorchea con puntillo.
			elseif 	kSubDiv==4 && kTrip==0 && kDot==1 	then 	
					aTime 	=	gk16thDot
			endif
		endif

	;Controles para filtro de paso bajo.
	kType 	= 	1 		;Selección de tipo de filtro (1-4).
	kCf		=	20000 	;Perilla de frecuencia de corte para filtro.
	kQ 		= 	0.5 	;Factor Q del filtro.
	iOver 	= 	4 		;Selección de oversampling para el filtro.
	iStor 	= 	1 		;Habilita si el filtro guarda la información previa o no (0 ó 1).

	;Oscilador de frecuencia baja.
	kRate	=	6 		;Frecuencia del oscilador en Hz.
	kDepth 	= 	0		;Intensidad de la modulación (0-1).
	iWave   =   0 		;Forma de onda del oscilador.
	kMod 	= 	aTime*kDepth 		;Toma el tiempo y lo duplica (máximo) o divide (mínimo).
	aLFO	lfo	kMod, kRate, iWave 	;Oscilador de frecuencia baja.
	aVar 	= 	aTime + aLFO 	;Conexión entre perilla de tiempo y oscilador.

	/* 
	Formas de onda del oscilador:
	0 		=			Sinusoidal
	1 		=			Triángulo
	2 		= 			Cuadro bipolar
	3 		= 			Cuadro unipolar
	4 		= 			Sierra hacia arriba
	5 		= 			Sierra hacia abajo
	*/

	/*Para Jitter Spline, opcode de variación al azar.
	Jitter Spline se aplica al tempo del delay para generar un efecto de cinta vintage.*/
	kJitBut 	= 	0 		;Botón para apagar o encender Jitter.

	kJitDepth 	=	0.2
	kHzMin 		= 	2 	;Tasa de variación mínima en Hertz.
	kHzMax 		=	16 	;Tasa de variación máxima en Hertz.
	kJitAmp		=	aTime*kJitDepth

	kJit 	jspline kJitAmp, kHzMin, kHzMax ;Opcode jspline (Jitter Spline).
	aJit 	= 		kJit
	;Inclusión de Jitter para variable de tiempo
	aVarJit = 		aVar + aJit

	;Botón de ping-pong.
	kPing 	=	0
	
	;"vdelayxw" es un opcode de retraso de alta calidad.
	;Botón de ping-pong apagado.
	if 	kPing==0 	then 
		aDelL 		vdelayxw	aIn + aDelL*kFdbk, aVarJit, iMax, iWindow
		aDelR 		vdelayxw	aIn + aDelR*kFdbk, aVarJit, iMax, iWindow
		;Botón de ping-pong encendido.
		elseif 	kPing==1 	then 
			aDelL 	vdelayxw	aIn + aDelR*kFdbk, aVarJit, iMax, iWindow
			aDelR 	vdelayxw	aDelL*kFdbk, aVarJit, iMax, iWindow
	endif

	;Filtro de estado variable. 	
	aHPFL, aLPFL, aBPFL, aBRFL 	statevar 	aDelL,  kCf, kQ, iOver, iStor
	aHPFR, aLPFR, aBPFR, aBRFR 	statevar 	aDelR,  kCf, kQ, iOver, iStor 			
	kDryWet =   1 	;Perilla para relación entre efecto y señal inicial.

	;Selección de filtro de paso bajo.
	if 	kType==1 	then 	
		aMixL 		ntrpol 		aIn, aLPFL, kDryWet 
		aMixR 		ntrpol 		aIn, aLPFR, kDryWet 
		;Selección de filtro de paso alto.
		elseif 		kType==2 	then 	
			aMixL 	ntrpol 		aIn, aHPFL, kDryWet
			aMixR 	ntrpol 		aIn, aHPFR, kDryWet
		;Selección de filtro de paso de banda. 
		elseif 		kType==3 	then 	
			aMixL 	ntrpol 		aIn, aBPFL, kDryWet 	
			aMixR 	ntrpol 		aIn, aBPFR, kDryWet 	
		;Selección de filtro de rechazo de banda.
		elseif 		kType==4 	then 
			aMixL 	ntrpol 		aIn, aBRFL, kDryWet
			aMixR 	ntrpol 		aIn, aBRFR, kDryWet
	endif 
			
	outs	aMixL, aMixR 	;Salidas del plugin.

endin


</CsInstruments>
<CsScore>

;Corre el instrumento "Mod Delay" infinitamente.
i 	"ModDelay" 	0 	z 

</CsScore>
</CsoundSynthesizer>